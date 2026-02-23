import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/performance_data.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../data/performance_repository.dart';

/// Web Vital metric definitions with thresholds.
enum WebVital {
  lcp('LCP', 'ms', 2500, 4000),
  cls('CLS', '', 0.1, 0.25),
  fcp('FCP', 'ms', 1800, 3000),
  ttfb('TTFB', 'ms', 800, 1800),
  inp('INP', 'ms', 200, 500);

  const WebVital(
      this.shortName, this.unit, this.goodMax, this.poorMin);

  final String shortName;
  final String unit;
  final double goodMax;
  final double poorMin;

  String fullName(AppLocalizations l10n) {
    switch (this) {
      case WebVital.lcp:
        return l10n.largestContentfulPaint;
      case WebVital.cls:
        return l10n.cumulativeLayoutShift;
      case WebVital.fcp:
        return l10n.firstContentfulPaint;
      case WebVital.ttfb:
        return l10n.timeToFirstByte;
      case WebVital.inp:
        return l10n.interactionToNextPaint;
    }
  }

  Color ratingColor(double value) {
    if (value <= goodMax) return const Color(0xFF22C55E);
    if (value < poorMin) return const Color(0xFFF59E0B);
    return const Color(0xFFEF4444);
  }

  String ratingLabel(double value, AppLocalizations l10n) {
    if (value <= goodMax) return l10n.good;
    if (value < poorMin) return l10n.needsImprovement;
    return l10n.poor;
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

/// Dimension options for breakdown.
enum PerfDimension {
  pathname('pathname'),
  country('country'),
  deviceType('device_type'),
  browser('browser'),
  operatingSystem('operating_system');

  const PerfDimension(this.value);
  final String value;

  String label(AppLocalizations l10n) {
    switch (this) {
      case PerfDimension.pathname:
        return l10n.dimPages;
      case PerfDimension.country:
        return l10n.dimCountries;
      case PerfDimension.deviceType:
        return l10n.dimDevices;
      case PerfDimension.browser:
        return l10n.dimBrowsers;
      case PerfDimension.operatingSystem:
        return l10n.dimOS;
    }
  }
}

final _selectedDimensionProvider =
    StateProvider<PerfDimension>((ref) => PerfDimension.pathname);

/// Provider for performance by dimension breakdown.
final _perfByDimensionProvider = FutureProvider.family<
    List<PerformanceDimensionItem>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);
  final dimension = ref.watch(_selectedDimensionProvider);

  final repo = ref.read(performanceRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getByDimension(siteId, dimension.value, params);
});

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
    final dimensionAsync = ref.watch(_perfByDimensionProvider(siteId));
    final selectedMetric = ref.watch(_selectedMetricProvider);
    final selectedDimension = ref.watch(_selectedDimensionProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.performance, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(_perfOverviewProvider(siteId));
          ref.invalidate(_perfTimeSeriesProvider(siteId));
          ref.invalidate(_perfByDimensionProvider(siteId));
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
                          Text(l10n.failedToLoadPerformanceData,
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
                      l10n.metricOverTime(selectedMetric.fullName(l10n)),
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
                          child: Text(l10n.failedToLoadChart,
                              style: theme.textTheme.bodySmall),
                        ),
                      ),
                      data: (series) {
                        if (series.isEmpty) {
                          return SizedBox(
                            height: 200,
                            child: Center(child: Text(l10n.noData)),
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

              const Divider(height: 1),

              // Dimension breakdown
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  l10n.byDimension,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Dimension selector chips
              SizedBox(
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  children: PerfDimension.values.map((d) {
                    final isSelected = d == selectedDimension;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FilterChip(
                        label: Text(
                          d.label(l10n),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                          ),
                        ),
                        selected: isSelected,
                        onSelected: (_) => ref
                            .read(_selectedDimensionProvider.notifier)
                            .state = d,
                        showCheckmark: false,
                        selectedColor:
                            theme.colorScheme.primary.withValues(alpha: 0.2),
                        side: BorderSide(
                          color: isSelected
                              ? theme.colorScheme.primary
                              : theme.dividerTheme.color ??
                                  const Color(0xFF262626),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 8),
              // Dimension items
              dimensionAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Text(l10n.failedToLoadDimensionData,
                        style: theme.textTheme.bodySmall),
                  ),
                ),
                data: (items) {
                  if (items.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.bar_chart,
                                size: 40,
                                color: theme.textTheme.bodySmall?.color),
                            const SizedBox(height: 12),
                            Text(l10n.noData,
                                style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    );
                  }

                  final metricKey =
                      selectedMetric.shortName.toLowerCase();

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => Divider(
                      height: 1,
                      color: theme.dividerTheme.color
                          ?.withValues(alpha: 0.3),
                    ),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final p75 = item.getVitalP75(metricKey);
                      final color = selectedMetric.ratingColor(p75);

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                item.dimensionValue,
                                style: theme.textTheme.bodyMedium,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${item.eventCount}',
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(width: 16),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color:
                                    color.withValues(alpha: 0.15),
                                borderRadius:
                                    BorderRadius.circular(4),
                              ),
                              child: Text(
                                selectedMetric.formatValue(p75),
                                style: TextStyle(
                                  color: color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
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
    final l10n = AppLocalizations.of(context)!;
    final ratingColor = vital.ratingColor(value);
    final ratingLabel = vital.ratingLabel(value, l10n);

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
                    label: l10n.performanceRatingLabel(ratingLabel),
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
                vital.fullName(l10n),
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
