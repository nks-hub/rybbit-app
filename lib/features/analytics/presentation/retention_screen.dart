import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/retention.dart';
import '../../../shared/utils/formatters.dart';
import '../data/analytics_repository.dart';

final _retentionProvider = FutureProvider.family
    .autoDispose<RetentionData, ({String siteId, String mode, int range})>(
  (ref, args) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final tz = DateTime.now().timeZoneName;
    return repo.getRetention(args.siteId, {
      'mode': args.mode,
      'range': args.range.toString(),
      'time_zone': tz,
    });
  },
);

class RetentionScreen extends ConsumerStatefulWidget {
  final String siteId;

  const RetentionScreen({super.key, required this.siteId});

  @override
  ConsumerState<RetentionScreen> createState() => _RetentionScreenState();
}

class _RetentionScreenState extends ConsumerState<RetentionScreen> {
  String _mode = 'week';
  int _range = 90;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);

    final args = (siteId: widget.siteId, mode: _mode, range: _range);
    final retentionAsync = ref.watch(_retentionProvider(args));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.retention, style: const TextStyle(fontSize: 18)),
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
      body: Column(
        children: [
          // Controls
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                // Mode selector
                SegmentedButton<String>(
                  segments: [
                    ButtonSegment(value: 'week', label: Text(l10n.weekly)),
                    ButtonSegment(value: 'day', label: Text(l10n.daily)),
                  ],
                  selected: {_mode},
                  onSelectionChanged: (v) =>
                      setState(() => _mode = v.first),
                  style: SegmentedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 13),
                  ),
                ),
                const SizedBox(width: 12),
                // Range selector
                Expanded(
                  child: DropdownButtonFormField<int>(
                    value: _range,
                    decoration: InputDecoration(
                      labelText: l10n.retentionRange,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                    ),
                    items: [
                      DropdownMenuItem(value: 14, child: Text(l10n.retentionDays(14))),
                      DropdownMenuItem(value: 30, child: Text(l10n.retentionDays(30))),
                      DropdownMenuItem(value: 60, child: Text(l10n.retentionDays(60))),
                      DropdownMenuItem(value: 90, child: Text(l10n.retentionDays(90))),
                      DropdownMenuItem(value: 180, child: Text(l10n.retentionDays(180))),
                      DropdownMenuItem(value: 365, child: Text(l10n.retentionDays(365))),
                    ],
                    onChanged: (v) {
                      if (v != null) setState(() => _range = v);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(
            child: retentionAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: theme.colorScheme.error),
                      const SizedBox(height: 16),
                      Text(l10n.failedToLoadRetention,
                          style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Text(formatError(error),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => ref.invalidate(_retentionProvider(args)),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              data: (data) {
                if (data.cohorts.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_off,
                            size: 48,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(height: 16),
                        Text(l10n.noRetentionData,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(_retentionProvider(args)),
                  child: _RetentionTable(data: data, mode: _mode),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RetentionTable extends StatelessWidget {
  final RetentionData data;
  final String mode;

  const _RetentionTable({required this.data, required this.mode});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;

    // Sort cohort keys chronologically
    final sortedKeys = data.cohorts.keys.toList()..sort();

    // Calculate max columns needed
    final maxCols = data.maxPeriods.clamp(1, 12);

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Table(
            defaultColumnWidth: const FixedColumnWidth(58),
            columnWidths: {
              0: const FixedColumnWidth(90),
              1: const FixedColumnWidth(56),
            },
            border: TableBorder.all(
              color: theme.dividerColor.withValues(alpha: 0.3),
              width: 0.5,
            ),
            children: [
              // Header row
              TableRow(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
                children: [
                  _headerCell(l10n.cohort, theme),
                  _headerCell(l10n.users, theme),
                  for (int i = 0; i < maxCols; i++)
                    _headerCell(
                      mode == 'week'
                          ? '${l10n.retentionWeekPrefix}$i'
                          : '${l10n.retentionDayPrefix}$i',
                      theme,
                    ),
                ],
              ),

              // Data rows
              for (final key in sortedKeys) ...[
                _buildCohortRow(
                  context,
                  key,
                  data.cohorts[key]!,
                  maxCols,
                  isDark,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildCohortRow(
    BuildContext context,
    String cohortKey,
    RetentionCohort cohort,
    int maxCols,
    bool isDark,
  ) {
    final theme = Theme.of(context);

    // Format date label
    String dateLabel;
    try {
      final date = DateTime.parse(cohortKey);
      dateLabel = DateFormat('MMM d').format(date);
    } catch (_) {
      dateLabel = cohortKey;
    }

    return TableRow(
      children: [
        // Date cell
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          child: Text(
            dateLabel,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ),
        // Size cell
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Text(
            formatNumber(cohort.size),
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
            textAlign: TextAlign.center,
          ),
        ),
        // Percentage cells
        for (int i = 0; i < maxCols; i++)
          _percentageCell(
            i < cohort.percentages.length ? cohort.percentages[i] : null,
            isDark,
            theme,
          ),
      ],
    );
  }

  Widget _percentageCell(double? value, bool isDark, ThemeData theme) {
    if (value == null) {
      return const SizedBox(height: 32);
    }

    final color = _retentionColor(value, isDark);

    return Container(
      height: 32,
      alignment: Alignment.center,
      color: color,
      child: Text(
        '${value.toStringAsFixed(0)}%',
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: value > 40 ? Colors.white : (isDark ? Colors.white70 : Colors.black87),
        ),
      ),
    );
  }

  Color _retentionColor(double percentage, bool isDark) {
    if (percentage >= 80) return const Color(0xFF166534);
    if (percentage >= 60) return const Color(0xFF15803D);
    if (percentage >= 40) return const Color(0xFF22C55E);
    if (percentage >= 20) {
      return isDark
          ? const Color(0xFF22C55E).withValues(alpha: 0.4)
          : const Color(0xFF22C55E).withValues(alpha: 0.3);
    }
    if (percentage > 0) {
      return isDark
          ? const Color(0xFF22C55E).withValues(alpha: 0.15)
          : const Color(0xFF22C55E).withValues(alpha: 0.12);
    }
    return Colors.transparent;
  }

  Widget _headerCell(String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Text(
        text,
        style: theme.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
