import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/models/overview.dart';
import '../../../shared/models/time_range.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/widgets/filter_bar.dart';
import '../../../shared/widgets/stat_card.dart';
import '../../../shared/widgets/time_range_picker.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../../../core/state/current_site_provider.dart';
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

  String _localizedStatLabel(AppLocalizations l10n, SelectedStat stat) {
    switch (stat) {
      case SelectedStat.users:
        return l10n.users;
      case SelectedStat.sessions:
        return l10n.sessions;
      case SelectedStat.pageviews:
        return l10n.pageviews;
      case SelectedStat.pagesPerSession:
        return l10n.pagesPerSession;
      case SelectedStat.bounceRate:
        return l10n.bounceRate;
      case SelectedStat.duration:
        return l10n.duration;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(analyticsControllerProvider(siteId));
    final timeRangeLabel =
        ref.read(timeRangeControllerProvider.notifier).label;
    final filters = ref.watch(filterControllerProvider);
    final selectedStat = ref.watch(selectedStatProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ref.watch(currentSiteDomainProvider) ?? 'Site $siteId',
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          // Live user count badge
          analyticsAsync.when(
            data: (state) {
              if (state.liveUserCount <= 0) return const SizedBox.shrink();
              return Semantics(
                label: l10n.usersOnline(state.liveUserCount),
                excludeSemantics: true,
                child: Padding(
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
                Text(l10n.failedToLoadAnalytics,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref
                      .read(analyticsControllerProvider(siteId).notifier)
                      .refresh(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (analyticsState) {
          final overview = analyticsState.overview;
          if (overview == null) {
            return Center(child: Text(l10n.noDataAvailable));
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
                          _localizedStatLabel(l10n, selectedStat),
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
                          previousValues:
                              analyticsState.previousBuckets.isNotEmpty
                                  ? _extractBucketValues(
                                      analyticsState.previousBuckets,
                                      selectedStat)
                                  : null,
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
                      l10n.metrics,
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
    final l10n = AppLocalizations.of(context)!;
    final prev = analyticsState.previousOverview;

    double? change(double current, double previous) {
      if (previous == 0) return current > 0 ? 100.0 : null;
      return ((current - previous) / previous) * 100;
    }

    final stats = [
      (
        title: l10n.users,
        value: formatNumber(overview.users),
        change: prev != null
            ? change(overview.users.toDouble(), prev.users.toDouble())
            : null,
        stat: SelectedStat.users,
      ),
      (
        title: l10n.sessions,
        value: formatNumber(overview.sessions),
        change: prev != null
            ? change(overview.sessions.toDouble(), prev.sessions.toDouble())
            : null,
        stat: SelectedStat.sessions,
      ),
      (
        title: l10n.pageviews,
        value: formatNumber(overview.pageviews),
        change: prev != null
            ? change(overview.pageviews.toDouble(), prev.pageviews.toDouble())
            : null,
        stat: SelectedStat.pageviews,
      ),
      (
        title: l10n.pagesPerSession,
        value: overview.pagesPerSession.toStringAsFixed(1),
        change: prev != null
            ? change(overview.pagesPerSession, prev.pagesPerSession)
            : null,
        stat: SelectedStat.pagesPerSession,
      ),
      (
        title: l10n.bounceRate,
        value: formatPercentage(overview.bounceRate),
        change: prev != null
            ? change(overview.bounceRate, prev.bounceRate)
            : null,
        stat: SelectedStat.bounceRate,
      ),
      (
        title: l10n.duration,
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
    final l10n = AppLocalizations.of(context)!;
    // (label, icon, route parameter)
    final metricLinks = [
      (l10n.pages, Icons.article_outlined, 'pathname'),
      (l10n.referrers, Icons.link, 'referrer'),
      (l10n.countries, Icons.public, 'country'),
      (l10n.devices, Icons.devices, 'device_type'),
    ];

    final featureLinks = [
      (l10n.liveView, Icons.sensors, '/analytics/$siteId/live'),
      (l10n.sessions, Icons.people_outline, '/sessions/$siteId'),
      (l10n.events, Icons.bolt, '/analytics/$siteId/events'),
      (l10n.errors, Icons.error_outline, '/analytics/$siteId/errors'),
    ];

    final moreLinks = [
      (l10n.performance, Icons.speed, '/analytics/$siteId/performance'),
      (l10n.goals, Icons.flag_outlined, '/analytics/$siteId/goals'),
      (l10n.funnels, Icons.filter_alt_outlined, '/analytics/$siteId/funnels'),
      (l10n.users, Icons.person_outline, '/analytics/$siteId/users'),
      (l10n.replay, Icons.videocam_outlined, '/analytics/$siteId/replay'),
      (l10n.activityHeatmap, Icons.grid_view, '/analytics/$siteId/heatmap'),
      (l10n.config, Icons.settings_outlined, '/analytics/$siteId/config'),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.8,
            children: metricLinks
                .map(
                  (link) => Card(
                    child: InkWell(
                      onTap: () => context.push(
                        '/analytics/$siteId/metrics/${link.$3}',
                      ),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Icon(link.$2,
                                size: 20,
                                color: theme.textTheme.bodyMedium?.color),
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
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.0,
            children: featureLinks
                .map(
                  (link) => Card(
                    child: InkWell(
                      onTap: () => context.push(link.$3),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(link.$2,
                                size: 18,
                                color: theme.textTheme.bodyMedium?.color),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                link.$1,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
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
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2.0,
            children: moreLinks
                .map(
                  (link) => Card(
                    child: InkWell(
                      onTap: () => context.push(link.$3),
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(link.$2,
                                size: 18,
                                color: theme.textTheme.bodyMedium?.color),
                            const SizedBox(width: 6),
                            Flexible(
                              child: Text(
                                link.$1,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                                overflow: TextOverflow.ellipsis,
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
        ],
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
    final state = ref.read(timeRangeControllerProvider);
    switch (state.mode) {
      case TimeMode.day:
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        if (state.startDate == today) return TimeRangePreset.today;
        final yesterday = today.subtract(const Duration(days: 1));
        if (state.startDate == yesterday) return TimeRangePreset.yesterday;
        return null;
      case TimeMode.week:
        return TimeRangePreset.thisWeek;
      case TimeMode.month:
        return TimeRangePreset.thisMonth;
      case TimeMode.year:
        return TimeRangePreset.thisYear;
      case TimeMode.range:
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        if (state.endDate == today) {
          final diff = today.difference(state.startDate).inDays;
          if (diff == 6) return TimeRangePreset.last7Days;
          if (diff == 29) return TimeRangePreset.last30Days;
        }
        return null;
      default:
        return null;
    }
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
      case TimeRangePreset.custom:
        if (!context.mounted) return;
        final now = DateTime.now();
        final picked = await showDateRangePicker(
          context: context,
          firstDate: DateTime(2020),
          lastDate: now,
          initialDateRange: DateTimeRange(
            start: now.subtract(const Duration(days: 7)),
            end: now,
          ),
        );
        if (picked != null) {
          controller.setCustomRange(picked.start, picked.end);
        }
    }
  }

  Future<void> _showAddFilter(BuildContext context, WidgetRef ref) async {
    final filter = await AddFilterDialog.show(context);
    if (filter != null) {
      ref.read(filterControllerProvider.notifier).addFilter(filter);
    }
  }
}
