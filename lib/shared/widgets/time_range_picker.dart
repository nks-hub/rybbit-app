import 'package:flutter/material.dart';

enum TimeRangePreset {
  today('Today'),
  yesterday('Yesterday'),
  last7Days('Last 7 Days'),
  last30Days('Last 30 Days'),
  thisWeek('This Week'),
  thisMonth('This Month'),
  thisYear('This Year');

  const TimeRangePreset(this.label);
  final String label;
}

class TimeRangePicker extends StatelessWidget {
  final TimeRangePreset? selectedPreset;
  final ValueChanged<TimeRangePreset> onPresetSelected;

  const TimeRangePicker({
    super.key,
    this.selectedPreset,
    required this.onPresetSelected,
  });

  static Future<TimeRangePreset?> show(
    BuildContext context, {
    TimeRangePreset? selected,
  }) {
    return showModalBottomSheet<TimeRangePreset>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => TimeRangePicker(
        selectedPreset: selected,
        onPresetSelected: (preset) => Navigator.of(context).pop(preset),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Time Range',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 12),
          ...TimeRangePreset.values.map((preset) {
            final isSelected = preset == selectedPreset;
            return ListTile(
              title: Text(preset.label),
              leading: Icon(
                isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.textTheme.bodySmall?.color,
              ),
              selected: isSelected,
              selectedColor: theme.colorScheme.primary,
              onTap: () => onPresetSelected(preset),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
