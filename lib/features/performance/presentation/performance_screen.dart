import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
import '../../../shared/models/performance_data.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../data/performance_repository.dart';

/// Web Vital metric definitions with thresholds.
enum WebVital {
  lcp('LCP', 'Largest Contentful Paint', 'ms', 2500, 4000),
  cls('CLS', 'Cumulative Layout Shift', '', 0.1, 0.25),
  fcp('FCP', 'First Contentful Paint', 'ms', 1800, 3000),
  ttfb('TTFB', 'Time to First Byte', 'ms', 800, 1800),
  inp('INP', 'Interaction to Next Paint', 'ms', 200, 500);

  const WebVital(
      this.shortName, this.fullName, this.unit, this.goodMax, this.poorMin);

  final String shortName;
  final String fullName;
  final String unit;
  final double goodMax;
  final double poorMin;

  Color ratingColor(double value) {
    if (value <= goodMax) return const Color(0xFF22C55E);
    if (value < poorMin) return const Color(0xFFF59E0B);
    return const Color(0xFFEF4444);
  }

  String ratingLabel(double value) {
    if (value <= goodMax) return 'Good';
    if (value < poorMin) return 'Needs Improvement';
    return 'Poor';
  }

  String formatValue(double value) {
    if (unit == 'ms') {
      if (value >= 1000) {
        return '${(value / 1000).toStringAsFixed(2)}s';
      }
      return '${value.toStringAsFixed(0)}ms';
    }
    return value.toStringAsFixed(3);
  }
}

/// Provider for performance overview.
final _perfOverviewProvider =
    FutureProvider.family<PerformanceOverview, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);

  final repo = ref.read(performanceRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getOverview(siteId, params);
});

/// Provider for the selected metric.
final _selectedMetricProvider =
    StateProvider<WebVital>((ref) => WebVital.lcp);

/// Provider for time series of selected metric.
final _perfTimeSeriesProvider = FutureProvider.family<
    List<PerformanceTimeSeries>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);
  final metric = ref.watch(_selectedMetricProvider);

  final repo = ref.read(performanceRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toBucketedQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getTimeSeries(siteId, metric.shortName.toLowerCase(), params);
});

class PerformanceScreen extends ConsumerWidget {
  final String siteId;

  const PerformanceScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overviewAsync = ref.watch(_perfOverviewProvider(siteId));
    final timeSeriesAsync = ref.watch(_perfTimeSeriesProvider(siteId));
    final selectedMetric = ref.watch(_selectedMetricProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: 'Go back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(_perfOverviewProvider(siteId));
          ref.invalidate(_perfTimeSeriesProvider(siteId));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Vitals grid
              Padding(
                padding: const EdgeInsets.all(12),
                child: overviewAsync.when(
                  loading: () => const SizedBox(
                    height: 200,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  error: (err, _) => SizedBox(
                    height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error_outline,
                              size: 48, color: theme.colorScheme.error),
                          const SizedBox(height: 8),
                          Text('Failed to load performance data',
                              style: theme.textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  data: (overview) => _buildVitalsGrid(
                    context,
                    ref,
                    overview,
                    selectedMetric,
                  ),
                ),
              ),

              const Divider(height: 1),

              // Time series chart for selected metric
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${selectedMetric.fullName} Over Time',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    timeSeriesAsync.when(
                      loading: () => const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (err, _) => SizedBox(
                        height: 200,
                        child: Center(
                          child: Text('Failed to load chart',
                              style: theme.textTheme.bodySmall),
                        ),
                      ),
                      data: (series) {
                        if (series.isEmpty) {
                          return const SizedBox(
                            height: 200,
                            child: Center(child: Text('No data')),
                          );
                        }

                        return TimeSeriesChart(
                          values:
                              series.map((s) => s.value).toList(),
                          labels:
                              series.map((s) => s.time).toList(),
                          lineColor: _getMetricColor(
                              selectedMetric, series),
                          tooltipFormatter: (v) =>
                              selectedMetric.formatValue(v),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVitalsGrid(
    BuildContext context,
    WidgetRef ref,
    PerformanceOverview overview,
    WebVital selected,
  ) {
    final vitals = [
      (WebVital.lcp, overview.lcp),
      (WebVital.cls, overview.cls),
      (WebVital.fcp, overview.fcp),
      (WebVital.ttfb, overview.ttfb),
      (WebVital.inp, overview.inp),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.6,
      children: vitals.map((entry) {
        final vital = entry.$1;
        final value = entry.$2;
        return _VitalCard(
          vital: vital,
          value: value,
          selected: vital == selected,
          onTap: () =>
              ref.read(_selectedMetricProvider.notifier).state = vital,
        );
      }).toList(),
    );
  }

  Color _getMetricColor(WebVital metric, List<PerformanceTimeSeries> series) {
    if (series.isEmpty) return const Color(0xFF6366F1);
    final avg = series.fold<double>(0, (sum, s) => sum + s.value) /
        series.length;
    return metric.ratingColor(avg);
  }
}

class _VitalCard extends StatelessWidget {
  final WebVital vital;
  final double value;
  final bool selected;
  final VoidCallback onTap;

  const _VitalCard({
    required this.vital,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ratingColor = vital.ratingColor(value);
    final ratingLabel = vital.ratingLabel(value);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected
              ? theme.colorScheme.primary
              : theme.dividerColor,
          width: selected ? 2 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    vital.shortName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Semantics(
                    label: 'Performance rating: $ratingLabel',
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: ratingColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ratingLabel,
                        style: TextStyle(
                          color: ratingColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                vital.formatValue(value),
                style: TextStyle(
                  color: ratingColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                vital.fullName,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
