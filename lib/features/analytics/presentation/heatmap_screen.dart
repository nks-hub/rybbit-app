import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/overview.dart';
import '../../../shared/utils/formatters.dart';
import '../../../core/state/filter_controller.dart';
import '../data/analytics_repository.dart';

/// Fetches 4 weeks of hourly bucketed data for the heatmap.
final _heatmapDataProvider =
    FutureProvider.family<List<OverviewBucket>, String>((ref, siteId) async {
  ref.watch(filterControllerProvider);

  final repo = ref.read(analyticsRepositoryProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final start = today.subtract(const Duration(days: 27));
  final df = DateFormat('yyyy-MM-dd');
  final tzOffset = now.timeZoneOffset;
  final tzSign = tzOffset.isNegative ? '-' : '+';
  final tzH = tzOffset.inHours.abs().toString().padLeft(2, '0');
  final tzM = (tzOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');
  final tz = 'UTC$tzSign$tzH:$tzM';

  final params = <String, String>{
    'start_date': df.format(start),
    'end_date': df.format(today),
    'time_zone': tz,
    'bucket': 'hour',
    ...filterCtrl.toQueryParams(),
  };

  return repo.getOverviewBucketed(siteId, params);
});

class HeatmapScreen extends ConsumerWidget {
  final String siteId;

  const HeatmapScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(_heatmapDataProvider(siteId));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.activityHeatmap, style: const TextStyle(fontSize: 18)),
            if (domain != null)
              Text(
                domain,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
          ],
        ),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: dataAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
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
                  onPressed: () =>
                      ref.invalidate(_heatmapDataProvider(siteId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (buckets) => _HeatmapContent(
          buckets: buckets,
          isMobile: ref.watch(currentSiteIsMobileProvider),
        ),
      ),
    );
  }
}

class _HeatmapContent extends StatefulWidget {
  final List<OverviewBucket> buckets;
  final bool isMobile;

  const _HeatmapContent({required this.buckets, this.isMobile = false});

  @override
  State<_HeatmapContent> createState() => _HeatmapContentState();
}

enum _HeatmapMetric { users, sessions, pageviews }

class _HeatmapContentState extends State<_HeatmapContent> {
  _HeatmapMetric _metric = _HeatmapMetric.users;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Build 7×24 grid: day-of-week (0=Mon..6=Sun) × hour (0..23)
    final grid = List.generate(7, (_) => List.filled(24, 0.0));
    final counts = List.generate(7, (_) => List.filled(24, 0));

    for (final bucket in widget.buckets) {
      final dt = DateTime.tryParse(bucket.time);
      if (dt == null) continue;
      final local = dt.toLocal();
      final dow = (local.weekday - 1) % 7; // Mon=0, Sun=6
      final hour = local.hour;

      final value = switch (_metric) {
        _HeatmapMetric.users => bucket.users.toDouble(),
        _HeatmapMetric.sessions => bucket.sessions.toDouble(),
        _HeatmapMetric.pageviews => bucket.pageviews.toDouble(),
      };

      grid[dow][hour] += value;
      counts[dow][hour]++;
    }

    // Average over weeks
    for (int d = 0; d < 7; d++) {
      for (int h = 0; h < 24; h++) {
        if (counts[d][h] > 0) {
          grid[d][h] = grid[d][h] / counts[d][h];
        }
      }
    }

    // Find max for color scaling
    double maxVal = 0;
    for (final row in grid) {
      for (final v in row) {
        if (v > maxVal) maxVal = v;
      }
    }

    final dayLabels = [
      l10n.dayMon,
      l10n.dayTue,
      l10n.dayWed,
      l10n.dayThu,
      l10n.dayFri,
      l10n.daySat,
      l10n.daySun,
    ];

    final metricLabel = switch (_metric) {
      _HeatmapMetric.users => l10n.users,
      _HeatmapMetric.sessions => l10n.sessions,
      _HeatmapMetric.pageviews => widget.isMobile ? l10n.screenviews : l10n.pageviews,
    };

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Metric selector
          Row(
            children: [
              Text(
                l10n.heatmapLast4Weeks,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              SegmentedButton<_HeatmapMetric>(
                segments: [
                  ButtonSegment(
                    value: _HeatmapMetric.users,
                    label: Text(l10n.users, style: const TextStyle(fontSize: 11)),
                  ),
                  ButtonSegment(
                    value: _HeatmapMetric.sessions,
                    label: Text(l10n.sessions, style: const TextStyle(fontSize: 11)),
                  ),
                  ButtonSegment(
                    value: _HeatmapMetric.pageviews,
                    label: Text(widget.isMobile ? l10n.screenviews : l10n.pageviews, style: const TextStyle(fontSize: 11)),
                  ),
                ],
                selected: {_metric},
                onSelectionChanged: (s) => setState(() => _metric = s.first),
                style: const ButtonStyle(
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Heatmap grid
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hour labels
                Row(
                  children: [
                    const SizedBox(width: 36),
                    for (int h = 0; h < 24; h++)
                      SizedBox(
                        width: 28,
                        child: Text(
                          '${h}h',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 9),
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),

                // Rows: one per day
                for (int d = 0; d < 7; d++) ...[
                  Row(
                    children: [
                      SizedBox(
                        width: 36,
                        child: Text(
                          dayLabels[d],
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (int h = 0; h < 24; h++)
                        Tooltip(
                          message:
                              '${dayLabels[d]} $h:00 — ${grid[d][h].toStringAsFixed(1)} $metricLabel',
                          child: Container(
                            width: 26,
                            height: 26,
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: _cellColor(
                                  grid[d][h], maxVal, theme.brightness),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Legend
          Row(
            children: [
              Text(l10n.less,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 10)),
              const SizedBox(width: 4),
              for (int i = 0; i <= 4; i++)
                Container(
                  width: 18,
                  height: 18,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: _cellColor(
                        maxVal * i / 4, maxVal, theme.brightness),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              const SizedBox(width: 4),
              Text(l10n.more,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 10)),
            ],
          ),

          const SizedBox(height: 24),

          // Peak hours summary
          _PeakHoursSummary(grid: grid, dayLabels: dayLabels),
        ],
      ),
    );
  }

  Color _cellColor(double value, double maxVal, Brightness brightness) {
    if (maxVal == 0 || value == 0) {
      return brightness == Brightness.dark
          ? const Color(0xFF1E293B)
          : const Color(0xFFE2E8F0);
    }

    final intensity = (value / maxVal).clamp(0.0, 1.0);

    if (brightness == Brightness.dark) {
      // Dark theme: from dark blue to bright green
      return Color.lerp(
        const Color(0xFF1E3A5F),
        AppColors.success,
        intensity,
      )!;
    } else {
      // Light theme: from light green to dark green
      return Color.lerp(
        const Color(0xFFDCFCE7),
        const Color(0xFF16A34A),
        intensity,
      )!;
    }
  }
}

class _PeakHoursSummary extends StatelessWidget {
  final List<List<double>> grid;
  final List<String> dayLabels;

  const _PeakHoursSummary({required this.grid, required this.dayLabels});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Find peak hour overall
    double peakVal = 0;
    int peakDay = 0;
    int peakHour = 0;
    for (int d = 0; d < 7; d++) {
      for (int h = 0; h < 24; h++) {
        if (grid[d][h] > peakVal) {
          peakVal = grid[d][h];
          peakDay = d;
          peakHour = h;
        }
      }
    }

    // Find peak day (sum across hours)
    double bestDaySum = 0;
    int bestDay = 0;
    for (int d = 0; d < 7; d++) {
      final sum = grid[d].fold(0.0, (a, b) => a + b);
      if (sum > bestDaySum) {
        bestDaySum = sum;
        bestDay = d;
      }
    }

    if (peakVal == 0) return const SizedBox.shrink();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.peakActivity,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.access_time,
                    size: 16, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  l10n.peakHour(
                      dayLabels[peakDay], '$peakHour:00'),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today,
                    size: 16, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  l10n.busiestDay(dayLabels[bestDay]),
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
