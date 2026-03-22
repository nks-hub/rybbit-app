import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../models/filter.dart';

String _filterParamLabel(FilterParameter param, AppLocalizations l10n) {
  return switch (param) {
    FilterParameter.browser => l10n.filterBrowser,
    FilterParameter.operatingSystem => l10n.filterOs,
    FilterParameter.language => l10n.filterLanguage,
    FilterParameter.country => l10n.filterCountry,
    FilterParameter.region => l10n.filterRegion,
    FilterParameter.city => l10n.filterCity,
    FilterParameter.deviceType => l10n.filterDeviceType,
    FilterParameter.referrer => l10n.filterReferrer,
    FilterParameter.hostname => l10n.filterHostname,
    FilterParameter.pathname => l10n.filterPathname,
    FilterParameter.pageTitle => l10n.filterPageTitle,
    FilterParameter.querystring => l10n.filterQuerystring,
    FilterParameter.eventName => l10n.filterEventName,
    FilterParameter.channel => l10n.filterChannel,
    FilterParameter.utmSource => l10n.filterUtmSource,
    FilterParameter.utmMedium => l10n.filterUtmMedium,
    FilterParameter.utmCampaign => l10n.filterUtmCampaign,
    FilterParameter.utmTerm => l10n.filterUtmTerm,
    FilterParameter.utmContent => l10n.filterUtmContent,
    FilterParameter.entryPage => l10n.filterEntryPage,
    FilterParameter.exitPage => l10n.filterExitPage,
    FilterParameter.deviceModel => l10n.deviceModel,
    FilterParameter.appVersion => l10n.appVersion,
  };
}

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
    final l10n = AppLocalizations.of(context)!;

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
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 200),
                child: Chip(
                label: Text(
                  '${_filterParamLabel(filter.parameter, l10n)}: ${filter.value.join(", ")}',
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
                deleteIcon: const Icon(Icons.close, size: 16),
                onDeleted: () => onRemoveFilter(index),
                backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
                side: BorderSide(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
              ),
            );
          }),
          ActionChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add, size: 16),
                const SizedBox(width: 4),
                Text(l10n.filter, style: const TextStyle(fontSize: 12)),
              ],
            ),
            onPressed: onAddFilter,
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
        ],
      ),
    );
  }
}

class AddFilterDialog extends StatefulWidget {
  final bool isMobile;

  const AddFilterDialog({super.key, this.isMobile = false});

  static Future<Filter?> show(BuildContext context, {bool isMobile = false}) {
    return showDialog<Filter>(
      context: context,
      builder: (context) => AddFilterDialog(isMobile: isMobile),
    );
  }

  @override
  State<AddFilterDialog> createState() => _AddFilterDialogState();
}

class _AddFilterDialogState extends State<AddFilterDialog> {
  FilterParameter _parameter = FilterParameter.country;
  final _valueController = TextEditingController();

  List<FilterParameter> get _availableParameters {
    return FilterParameter.values.where((p) {
      if (widget.isMobile && p.isWebOnly) return false;
      if (!widget.isMobile && p.isMobileOnly) return false;
      return true;
    }).toList();
  }

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final params = _availableParameters;

    return AlertDialog(
      title: Text(l10n.addFilter),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<FilterParameter>(
            initialValue: _parameter,
            decoration: InputDecoration(labelText: l10n.parameter),
            items: params
                .map((p) => DropdownMenuItem(
                      value: p,
                      child: Text(_filterParamLabel(p, l10n)),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) setState(() => _parameter = value);
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _valueController,
            decoration: InputDecoration(
              labelText: l10n.value,
              hintText: l10n.enterFilterValue,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
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
          child: Text(l10n.add),
        ),
      ],
    );
  }
}
