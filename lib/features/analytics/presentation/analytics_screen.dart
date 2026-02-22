import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/overview.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/widgets/filter_bar.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/time_range_picker.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../application/analytics_controller.dart';
import '../application/filter_controller.dart';
import '../application/time_range_controller.dart';

enum SelectedStat {
  users('Users'),
  sessions('Sessions'),
  pageviews('Pageviews'),
  pagesPerSession('Pages/Session'),
  bounceRate('Bounce Rate'),
  duration('Duration');

  const SelectedStat(this.label);
  final String label;
}

final selectedStatProvider = StateProvider<SelectedStat>((ref) => SelectedStat.users);

class AnalyticsScreen extends ConsumerWidget {
  final String siteId;

  const AnalyticsScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(analyticsControllerProvider(siteId));
    final timeRangeLabel =
        ref.read(timeRangeControllerProvider.notifier).label;
    final filters = ref.watch(filterControllerProvider);
    final selectedStat = ref.watch(selectedStatProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Site $siteId',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          // Live user count badge
          analyticsAsync.when(
            data: (state) {
              if (state.liveUserCount <= 0) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF22C55E).withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFF22C55E),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${state.liveUserCount}',
                          style: const TextStyle(
                            color: Color(0xFF22C55E),
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            loading: () => const SizedBox.shrink(),
            error: (_, _) => const SizedBox.shrink(),
          ),
          // Time range selector
          TextButton.icon(
            icon: const Icon(Icons.calendar_today, size: 16),
            label: Text(
              timeRangeLabel,
              style: const TextStyle(fontSize: 13),
            ),
            onPressed: () => _showTimeRangePicker(context, ref),
          ),
        ],
      ),
      body: analyticsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: theme.colorScheme.error),
                const SizedBox(height: 16),
                Text('Failed to load analytics',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref
                      .read(analyticsControllerProvider(siteId).notifier)
                      .refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (analyticsState) {
          final overview = analyticsState.overview;
          if (overview == null) {
            return const Center(child: Text('No data available'));
          }

          return RefreshIndicator(
            onRefresh: () => ref
                .read(analyticsControllerProvider(siteId).notifier)
                .refresh(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter bar
                  if (filters.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    FilterBar(
                      filters: filters,
                      onRemoveFilter: (index) => ref
                          .read(filterControllerProvider.notifier)
                          .removeFilter(index),
                      onAddFilter: () => _showAddFilter(context, ref),
                    ),
                    const SizedBox(height: 8),
                  ],

                  // Stat cards grid
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: _buildStatGrid(
                        context, ref, overview, analyticsState, selectedStat),
                  ),

                  const SizedBox(height: 16),

                  // Time series chart
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedStat.label,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TimeSeriesChart(
                          values: _extractBucketValues(
                              analyticsState.buckets, selectedStat),
                          labels: analyticsState.buckets
                              .map((b) => b.time)
                              .toList(),
                          lineColor: theme.colorScheme.primary,
                          tooltipFormatter: (v) =>
                              _formatStatValue(v, selectedStat),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Quick links
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Metrics',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildQuickLinks(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatGrid(
    BuildContext context,
    WidgetRef ref,
    Overview overview,
    AnalyticsState analyticsState,
    SelectedStat selectedStat,
  ) {
    final prev = analyticsState.previousOverview;

    double? change(double current, double previous) {
      if (previous == 0) return current > 0 ? 100.0 : null;
      return ((current - previous) / previous) * 100;
    }

    final stats = [
      (
        title: 'Users',
        value: formatNumber(overview.users),
        change: prev != null
            ? change(overview.users.toDouble(), prev.users.toDouble())
            : null,
        stat: SelectedStat.users,
      ),
      (
        title: 'Sessions',
        value: formatNumber(overview.sessions),
        change: prev != null
            ? change(overview.sessions.toDouble(), prev.sessions.toDouble())
            : null,
        stat: SelectedStat.sessions,
      ),
      (
        title: 'Pageviews',
        value: formatNumber(overview.pageviews),
        change: prev != null
            ? change(overview.pageviews.toDouble(), prev.pageviews.toDouble())
            : null,
        stat: SelectedStat.pageviews,
      ),
      (
        title: 'Pages/Session',
        value: overview.pagesPerSession.toStringAsFixed(1),
        change: prev != null
            ? change(overview.pagesPerSession, prev.pagesPerSession)
            : null,
        stat: SelectedStat.pagesPerSession,
      ),
      (
        title: 'Bounce Rate',
        value: formatPercentage(overview.bounceRate),
        change: prev != null
            ? change(overview.bounceRate, prev.bounceRate)
            : null,
        stat: SelectedStat.bounceRate,
      ),
      (
        title: 'Duration',
        value: formatDuration(overview.sessionDuration),
        change: prev != null
            ? change(overview.sessionDuration, prev.sessionDuration)
            : null,
        stat: SelectedStat.duration,
      ),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      childAspectRatio: 1.8,
      children: stats
          .map((s) => StatCard(
                title: s.title,
                value: s.value,
                changePercent: s.change,
                selected: selectedStat == s.stat,
                onTap: () =>
                    ref.read(selectedStatProvider.notifier).state = s.stat,
              ))
          .toList(),
    );
  }

  Widget _buildQuickLinks(BuildContext context) {
    final theme = Theme.of(context);
    final links = [
      ('Pages', Icons.article_outlined),
      ('Referrers', Icons.link),
      ('Countries', Icons.public),
      ('Devices', Icons.devices),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 2.8,
        children: links
            .map(
              (link) => Card(
                child: InkWell(
                  onTap: () {
                    // TODO: Navigate to metric detail
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Icon(link.$2,
                            size: 20,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(width: 10),
                        Text(
                          link.$1,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  List<double> _extractBucketValues(
      List<OverviewBucket> buckets, SelectedStat stat) {
    return buckets.map((b) {
      switch (stat) {
        case SelectedStat.users:
          return b.users.toDouble();
        case SelectedStat.sessions:
          return b.sessions.toDouble();
        case SelectedStat.pageviews:
          return b.pageviews.toDouble();
        case SelectedStat.pagesPerSession:
          return b.pagesPerSession;
        case SelectedStat.bounceRate:
          return b.bounceRate;
        case SelectedStat.duration:
          return b.sessionDuration;
      }
    }).toList();
  }

  String _formatStatValue(double value, SelectedStat stat) {
    switch (stat) {
      case SelectedStat.users:
      case SelectedStat.sessions:
      case SelectedStat.pageviews:
        return formatNumber(value);
      case SelectedStat.pagesPerSession:
        return value.toStringAsFixed(1);
      case SelectedStat.bounceRate:
        return formatPercentage(value);
      case SelectedStat.duration:
        return formatDuration(value);
    }
  }

  TimeRangePreset? _getCurrentPreset(WidgetRef ref) {
    final label = ref.read(timeRangeControllerProvider.notifier).label;
    return switch (label) {
      'Today' => TimeRangePreset.today,
      'Yesterday' => TimeRangePreset.yesterday,
      'This Week' => TimeRangePreset.thisWeek,
      'This Month' => TimeRangePreset.thisMonth,
      'This Year' => TimeRangePreset.thisYear,
      _ => null,
    };
  }

  Future<void> _showTimeRangePicker(BuildContext context, WidgetRef ref) async {
    final preset = await TimeRangePicker.show(
      context,
      selected: _getCurrentPreset(ref),
    );
    if (preset == null) return;

    final controller = ref.read(timeRangeControllerProvider.notifier);
    switch (preset) {
      case TimeRangePreset.today:
        controller.setToday();
      case TimeRangePreset.yesterday:
        controller.setYesterday();
      case TimeRangePreset.last7Days:
        controller.setLast7Days();
      case TimeRangePreset.last30Days:
        controller.setLast30Days();
      case TimeRangePreset.thisWeek:
        controller.setThisWeek();
      case TimeRangePreset.thisMonth:
        controller.setThisMonth();
      case TimeRangePreset.thisYear:
        controller.setThisYear();
    }
  }

  Future<void> _showAddFilter(BuildContext context, WidgetRef ref) async {
    final filter = await AddFilterDialog.show(context);
    if (filter != null) {
      ref.read(filterControllerProvider.notifier).addFilter(filter);
    }
  }
}
