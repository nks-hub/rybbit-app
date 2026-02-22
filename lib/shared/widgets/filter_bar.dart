import 'package:flutter/material.dart';

import '../models/filter.dart';

class FilterBar extends StatelessWidget {
  final List<Filter> filters;
  final ValueChanged<int> onRemoveFilter;
  final VoidCallback onAddFilter;

  const FilterBar({
    super.key,
    required this.filters,
    required this.onRemoveFilter,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          ...filters.asMap().entries.map((entry) {
            final index = entry.key;
            final filter = entry.value;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Chip(
                label: Text(
                  '${filter.parameter.value}: ${filter.value.join(", ")}',
                  style: const TextStyle(fontSize: 12),
                ),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () => onRemoveFilter(index),
                backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            );
          }),
          ActionChip(
            label: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, size: 16),
                SizedBox(width: 4),
                Text('Filter', style: TextStyle(fontSize: 12)),
              ],
            ),
            onPressed: onAddFilter,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}

/// Simple dialog for adding a filter.
class AddFilterDialog extends StatefulWidget {
  const AddFilterDialog({super.key});

  static Future<Filter?> show(BuildContext context) {
    return showDialog<Filter>(
      context: context,
      builder: (context) => const AddFilterDialog(),
    );
  }

  @override
  State<AddFilterDialog> createState() => _AddFilterDialogState();
}

class _AddFilterDialogState extends State<AddFilterDialog> {
  FilterParameter _parameter = FilterParameter.country;
  final _valueController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Filter'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<FilterParameter>(
            initialValue: _parameter,
            decoration: const InputDecoration(labelText: 'Parameter'),
            items: FilterParameter.values
                .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(p.value.replaceAll('_', ' ')),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _parameter = value);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _valueController,
            decoration: const InputDecoration(
              labelText: 'Value',
              hintText: 'Enter filter value',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final value = _valueController.text.trim();
            if (value.isEmpty) return;
            Navigator.of(context).pop(Filter(
              parameter: _parameter,
              type: FilterType.equals,
              value: [value],
            ));
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
