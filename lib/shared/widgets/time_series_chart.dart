import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSeriesChart extends StatelessWidget {
  final List<double> values;
  final List<String> labels;
  final List<double>? previousValues;
  final Color? lineColor;
  final String Function(double)? tooltipFormatter;

  const TimeSeriesChart({
    super.key,
    required this.values,
    required this.labels,
    this.previousValues,
    this.lineColor,
    this.tooltipFormatter,
  });

  @override
  Widget build(BuildContext context) {
    if (values.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('No data')),
      );
    }

    final theme = Theme.of(context);
    final color = lineColor ?? theme.colorScheme.primary;
    final maxY = _computeMaxY();

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: maxY > 0 ? maxY / 4 : 1,
            getDrawingHorizontalLine: (value) => FlLine(
              color: theme.dividerTheme.color?.withValues(alpha: 0.3) ??
                  Colors.grey.withValues(alpha: 0.2),
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            topTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  if (value == meta.max || value == meta.min) {
                    return const SizedBox.shrink();
                  }
                  return Text(
                    _formatAxisValue(value),
                    style: TextStyle(
                      fontSize: 10,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                interval: _computeXInterval(),
                getTitlesWidget: (value, meta) {
                  final idx = value.toInt();
                  if (idx < 0 || idx >= labels.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      _formatLabel(labels[idx]),
                      style: TextStyle(
                        fontSize: 10,
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minY: 0,
          maxY: maxY,
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) =>
                  theme.cardTheme.color ?? const Color(0xFF171717),
              getTooltipItems: (touchedSpots) {
                return touchedSpots.map((spot) {
                  final formatter = tooltipFormatter ?? _formatAxisValue;
                  final label =
                      spot.barIndex == 0 ? formatter(spot.y) : formatter(spot.y);
                  return LineTooltipItem(
                    label,
                    TextStyle(
                      color: spot.bar.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  );
                }).toList();
              },
            ),
          ),
          lineBarsData: [
            _buildCurrentLine(color),
            if (previousValues != null && previousValues!.isNotEmpty)
              _buildPreviousLine(theme),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildCurrentLine(Color color) {
    return LineChartBarData(
      spots: List.generate(
        values.length,
        (i) => FlSpot(i.toDouble(), values[i]),
      ),
      isCurved: true,
      curveSmoothness: 0.25,
      color: color,
      barWidth: 2.5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color.withValues(alpha: 0.3),
            color.withValues(alpha: 0.0),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildPreviousLine(ThemeData theme) {
    final prevData = previousValues!;
    return LineChartBarData(
      spots: List.generate(
        prevData.length,
        (i) => FlSpot(i.toDouble(), prevData[i]),
      ),
      isCurved: true,
      curveSmoothness: 0.25,
      color: Colors.grey.withValues(alpha: 0.4),
      barWidth: 1.5,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      dashArray: [6, 4],
    );
  }

  double _computeMaxY() {
    double maxVal = 0;
    for (final v in values) {
      if (v > maxVal) maxVal = v;
    }
    if (previousValues != null) {
      for (final v in previousValues!) {
        if (v > maxVal) maxVal = v;
      }
    }
    return maxVal == 0 ? 10 : maxVal * 1.15;
  }

  double _computeXInterval() {
    if (labels.length <= 6) return 1;
    if (labels.length <= 12) return 2;
    if (labels.length <= 24) return 4;
    return (labels.length / 6).ceilToDouble();
  }

  String _formatAxisValue(double value) {
    if (value >= 1000000) return '${(value / 1000000).toStringAsFixed(1)}M';
    if (value >= 1000) return '${(value / 1000).toStringAsFixed(1)}K';
    if (value == value.truncateToDouble()) return value.truncate().toString();
    return value.toStringAsFixed(1);
  }

  String _formatLabel(String label) {
    final dt = DateTime.tryParse(label);
    if (dt == null) return label;
    // Daily/weekly/monthly buckets: time part is midnight → show date
    if (dt.hour == 0 && dt.minute == 0 && dt.second == 0) {
      return DateFormat('MMM d').format(dt);
    }
    // Hourly or sub-hourly buckets: show time
    return DateFormat('HH:mm').format(dt);
  }
}
