import 'package:flutter/material.dart';

import '../../../../shared/utils/formatters.dart';

class MetricListItem extends StatelessWidget {
  final String value;
  final int count;
  final double percentage;
  final double? bounceRate;
  final double? timeOnPageSeconds;

  const MetricListItem({
    super.key,
    required this.value,
    required this.count,
    required this.percentage,
    this.bounceRate,
    this.timeOnPageSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = theme.colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  value.isEmpty ? '(not set)' : value,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                formatNumber(count),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 6),
              SizedBox(
                width: 48,
                child: Text(
                  formatPercentage(percentage),
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          // Percentage bar
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: (percentage / 100).clamp(0.0, 1.0),
              backgroundColor: barColor.withValues(alpha: 0.1),
              valueColor: AlwaysStoppedAnimation<Color>(
                barColor.withValues(alpha: 0.6),
              ),
              minHeight: 4,
            ),
          ),
          if (bounceRate != null || timeOnPageSeconds != null) ...[
            const SizedBox(height: 4),
            Row(
              children: [
                if (bounceRate != null) ...[
                  Text(
                    'Bounce: ${formatPercentage(bounceRate!)}',
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                  ),
                ],
                if (bounceRate != null && timeOnPageSeconds != null)
                  const SizedBox(width: 12),
                if (timeOnPageSeconds != null) ...[
                  Text(
                    'Time: ${formatDuration(timeOnPageSeconds!)}',
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}
