import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/journey.dart';
import '../../../shared/utils/formatters.dart';
import '../data/analytics_repository.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/time_range_controller.dart';

final _journeysProvider = FutureProvider.family
    .autoDispose<List<JourneyPath>, ({String siteId, int steps})>(
  (ref, args) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final timeRange = ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final params = <String, String>{
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      'steps': args.steps.toString(),
      'limit': '50',
    };
    return repo.getJourneys(args.siteId, params);
  },
);

class JourneysScreen extends ConsumerStatefulWidget {
  final String siteId;

  const JourneysScreen({super.key, required this.siteId});

  @override
  ConsumerState<JourneysScreen> createState() => _JourneysScreenState();
}

class _JourneysScreenState extends ConsumerState<JourneysScreen> {
  int _steps = 3;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);

    final args = (siteId: widget.siteId, steps: _steps);
    final journeysAsync = ref.watch(_journeysProvider(args));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.journeys, style: const TextStyle(fontSize: 18)),
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
          // Steps selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  l10n.journeySteps,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 12),
                SegmentedButton<int>(
                  segments: [
                    for (int i = 2; i <= 5; i++)
                      ButtonSegment(value: i, label: Text('$i')),
                  ],
                  selected: {_steps},
                  onSelectionChanged: (v) =>
                      setState(() => _steps = v.first),
                  style: SegmentedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Content
          Expanded(
            child: journeysAsync.when(
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
                      Text(l10n.failedToLoadJourneys,
                          style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Text(formatError(error),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () =>
                            ref.invalidate(_journeysProvider(args)),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              data: (journeys) {
                if (journeys.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.route,
                            size: 48,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(height: 16),
                        Text(l10n.noJourneysFound,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(_journeysProvider(args)),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(12),
                    itemCount: journeys.length,
                    itemBuilder: (context, index) =>
                        _JourneyCard(journey: journeys[index], rank: index + 1),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _JourneyCard extends StatelessWidget {
  final JourneyPath journey;
  final int rank;

  const _JourneyCard({required this.journey, required this.rank});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: rank + count + percentage
              Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '#$rank',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    l10n.journeySessions(formatNumber(journey.count)),
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${journey.percentage.toStringAsFixed(1)}%',
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Path flow
              _PathFlow(path: journey.path),
            ],
          ),
        ),
      ),
    );
  }
}

class _PathFlow extends StatelessWidget {
  final List<String> path;

  const _PathFlow({required this.path});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 4,
      runSpacing: 4,
      children: [
        for (int i = 0; i < path.length; i++) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: _stepColor(i, theme),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              path[i],
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (i < path.length - 1)
            Icon(
              Icons.arrow_forward,
              size: 14,
              color: theme.textTheme.bodySmall?.color,
            ),
        ],
      ],
    );
  }

  Color _stepColor(int index, ThemeData theme) {
    final isDark = theme.brightness == Brightness.dark;
    final colors = isDark
        ? [
            const Color(0xFF3B82F6).withValues(alpha: 0.2),
            const Color(0xFF8B5CF6).withValues(alpha: 0.2),
            const Color(0xFFEC4899).withValues(alpha: 0.2),
            const Color(0xFFF59E0B).withValues(alpha: 0.2),
            const Color(0xFF22C55E).withValues(alpha: 0.2),
          ]
        : [
            const Color(0xFF3B82F6).withValues(alpha: 0.12),
            const Color(0xFF8B5CF6).withValues(alpha: 0.12),
            const Color(0xFFEC4899).withValues(alpha: 0.12),
            const Color(0xFFF59E0B).withValues(alpha: 0.12),
            const Color(0xFF22C55E).withValues(alpha: 0.12),
          ];
    return colors[index % colors.length];
  }
}
