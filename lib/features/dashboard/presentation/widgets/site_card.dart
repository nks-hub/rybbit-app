import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../shared/models/site.dart';
import '../../application/sparkline_provider.dart';

class SiteCard extends ConsumerWidget {
  final Site site;
  final int liveCount;
  final VoidCallback onTap;

  const SiteCard({
    super.key,
    required this.site,
    required this.liveCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final sparklineAsync =
        ref.watch(sparklineProvider(site.siteId.toString()));
    final todayAsync =
        ref.watch(todayUsersProvider(site.siteId.toString()));

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: domain + live badge + chevron
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          site.domain,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        if (site.name.isNotEmpty &&
                            site.name != site.domain) ...[
                          const SizedBox(height: 2),
                          Text(
                            site.name,
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (liveCount > 0) ...[
                    const SizedBox(width: 8),
                    Semantics(
                      label: l10n.usersOnline(liveCount),
                      excludeSemantics: true,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color:
                              const Color(0xFF22C55E).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Color(0xFF22C55E),
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '$liveCount',
                              style: const TextStyle(
                                color: Color(0xFF22C55E),
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  Icon(
                    Icons.chevron_right,
                    color: theme.textTheme.bodyMedium?.color,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Bottom row: today's visitors + sparkline
              Row(
                children: [
                  todayAsync.when(
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                    data: (users) => users > 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.person_outline,
                                size: 14,
                                color: theme.colorScheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                l10n.todayVisitors(users),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ),
                  const Spacer(),
                  sparklineAsync.when(
                    loading: () => const SizedBox(width: 120, height: 44),
                    error: (_, __) => const SizedBox(width: 120, height: 44),
                    data: (values) => values.isNotEmpty
                        ? RepaintBoundary(
                            child: _Sparkline(values: values, theme: theme),
                          )
                        : const SizedBox(width: 120, height: 44),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Sparkline extends StatelessWidget {
  final List<double> values;
  final ThemeData theme;

  const _Sparkline({required this.values, required this.theme});

  @override
  Widget build(BuildContext context) {
    final maxVal = values.reduce((a, b) => a > b ? a : b);
    final minVal = values.reduce((a, b) => a < b ? a : b);
    final range = maxVal - minVal;
    final isUpward = values.last >= values.first;
    final color = isUpward
        ? const Color(0xFF22C55E)
        : theme.colorScheme.error;

    return SizedBox(
      width: 120,
      height: 44,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          minY: range > 0 ? minVal - range * 0.1 : 0,
          maxY: range > 0
              ? maxVal + range * 0.1
              : (maxVal > 0 ? maxVal * 1.2 : 1),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                values.length,
                (i) => FlSpot(i.toDouble(), values[i]),
              ),
              isCurved: true,
              curveSmoothness: 0.3,
              color: color,
              barWidth: 2.0,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color.withValues(alpha: 0.3),
                    color.withValues(alpha: 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
