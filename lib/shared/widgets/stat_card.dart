import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final double? changePercent;
  final IconData? icon;
  final bool selected;
  final VoidCallback? onTap;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.changePercent,
    this.icon,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPositive = changePercent != null && changePercent! > 0;
    final isNegative = changePercent != null && changePercent! < 0;

    return Semantics(
      label: '$title: $value',
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: selected
                ? theme.colorScheme.primary
                : theme.dividerTheme.color ?? const Color(0xFF262626),
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18, color: theme.textTheme.bodySmall?.color),
                      const SizedBox(width: 4),
                    ],
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  value,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                if (changePercent != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        isPositive
                            ? Icons.trending_up
                            : isNegative
                                ? Icons.trending_down
                                : Icons.trending_flat,
                        size: 14,
                        color: isPositive
                            ? AppColors.success
                            : isNegative
                                ? AppColors.error
                                : theme.textTheme.bodySmall?.color,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        changePercent!.abs() > 999
                            ? '999%+'
                            : '${changePercent!.abs().toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isPositive
                              ? AppColors.success
                              : isNegative
                                  ? AppColors.error
                                  : theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
