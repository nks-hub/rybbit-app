import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
import '../../../shared/models/event.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/widgets/time_series_chart.dart';
import '../data/events_repository.dart';

/// Provider for event names list.
final _eventNamesProvider = FutureProvider.family<List<EventName>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);

  final repo = ref.read(eventsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getEventNames(siteId, params);
});

/// Provider for bucketed event data.
final _eventBucketedProvider = FutureProvider.family<List<EventBucketItem>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);

  final repo = ref.read(eventsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toBucketedQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getEventsBucketed(siteId, params);
});

/// Provider for outbound links.
final _outboundLinksProvider =
    FutureProvider.family<List<OutboundLink>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);

  final repo = ref.read(eventsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getOutboundLinks(siteId, params);
});

class EventsScreen extends ConsumerWidget {
  final String siteId;

  const EventsScreen({super.key, required this.siteId});

  Future<void> _showEventProperties(
    BuildContext context,
    WidgetRef ref,
    String eventName,
  ) async {
    final repo = ref.read(eventsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
    };

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.3,
          maxChildSize: 0.85,
          expand: false,
          builder: (ctx, scrollController) {
            return FutureBuilder<List<EventProperty>>(
              future: repo.getEventProperties(siteId, eventName, params),
              builder: (context, snapshot) {
                final theme = Theme.of(context);
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          const Icon(Icons.bolt, size: 20, color: Color(0xFF22C55E)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              eventName,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    if (snapshot.connectionState == ConnectionState.waiting)
                      const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (snapshot.hasError)
                      Expanded(
                        child: Center(
                          child: Text(
                            'Failed to load properties',
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      )
                    else if (!snapshot.hasData || snapshot.data!.isEmpty)
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.data_object,
                                  size: 40,
                                  color: theme.textTheme.bodySmall?.color),
                              const SizedBox(height: 12),
                              Text('No properties',
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: _PropertyList(
                          properties: snapshot.data!,
                          scrollController: scrollController,
                        ),
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventNamesAsync = ref.watch(_eventNamesProvider(siteId));
    final bucketedAsync = ref.watch(_eventBucketedProvider(siteId));
    final outboundAsync = ref.watch(_outboundLinksProvider(siteId));
    final domain = ref.watch(currentSiteDomainProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Events', style: TextStyle(fontSize: 18)),
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
          tooltip: 'Go back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(_eventNamesProvider(siteId));
          ref.invalidate(_eventBucketedProvider(siteId));
          ref.invalidate(_outboundLinksProvider(siteId));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bucketed chart
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Events Over Time',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    bucketedAsync.when(
                      loading: () => const SizedBox(
                        height: 200,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (err, stack) => SizedBox(
                        height: 200,
                        child: Center(
                          child: Text('Failed to load chart',
                              style: theme.textTheme.bodySmall),
                        ),
                      ),
                      data: (buckets) {
                        if (buckets.isEmpty) {
                          return const SizedBox(
                            height: 200,
                            child: Center(child: Text('No data')),
                          );
                        }

                        // Aggregate all events by time bucket
                        final aggregated = <String, double>{};
                        final timeLabels = <String>[];

                        for (final b in buckets) {
                          aggregated[b.time] =
                              (aggregated[b.time] ?? 0) + b.eventCount;
                          if (!timeLabels.contains(b.time)) {
                            timeLabels.add(b.time);
                          }
                        }
                        timeLabels.sort();

                        final values = timeLabels
                            .map((t) => aggregated[t] ?? 0)
                            .toList();

                        return TimeSeriesChart(
                          values: values,
                          labels: timeLabels,
                          lineColor: const Color(0xFF22C55E),
                          tooltipFormatter: (v) => formatNumber(v),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // Event names list
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Event Names',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              eventNamesAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Text('Failed to load events: $error',
                        style: theme.textTheme.bodySmall),
                  ),
                ),
                data: (events) {
                  if (events.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(32),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.bolt,
                                size: 48,
                                color: theme.textTheme.bodySmall?.color),
                            const SizedBox(height: 16),
                            Text('No custom events tracked',
                                style: theme.textTheme.bodyLarge),
                          ],
                        ),
                      ),
                    );
                  }

                  final totalCount = events.fold<int>(
                      0, (sum, e) => sum + e.count);

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      final pct = totalCount > 0
                          ? (event.count / totalCount * 100)
                          : 0.0;

                      return _EventNameTile(
                        eventName: event.eventName,
                        count: event.count,
                        percentage: pct,
                        onTap: () => _showEventProperties(
                            context, ref, event.eventName),
                      );
                    },
                  );
                },
              ),

              // Outbound links section
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Outbound Links',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              outboundAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.all(32),
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, _) => Padding(
                  padding: const EdgeInsets.all(32),
                  child: Center(
                    child: Text(formatError(error),
                        style: theme.textTheme.bodySmall),
                  ),
                ),
                data: (links) {
                  if (links.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text('No outbound links tracked',
                            style: theme.textTheme.bodySmall),
                      ),
                    );
                  }

                  final maxCount = links.fold<int>(
                      0, (max, l) => l.count > max ? l.count : max);

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: links.length,
                    itemBuilder: (context, index) {
                      final link = links[index];
                      final pct = maxCount > 0
                          ? (link.count / maxCount * 100)
                          : 0.0;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.open_in_new,
                                    size: 14,
                                    color: theme.textTheme.bodySmall?.color),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    link.url,
                                    style: theme.textTheme.bodySmall,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatNumber(link.count),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 2),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: (pct / 100).clamp(0.0, 1.0),
                                backgroundColor: theme.colorScheme.primary
                                    .withValues(alpha: 0.1),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  theme.colorScheme.primary
                                      .withValues(alpha: 0.5),
                                ),
                                minHeight: 3,
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
}

class _EventNameTile extends StatelessWidget {
  final String eventName;
  final int count;
  final double percentage;
  final VoidCallback? onTap;

  const _EventNameTile({
    required this.eventName,
    required this.count,
    required this.percentage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final barColor = const Color(0xFF22C55E);

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.bolt, size: 16, color: barColor),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    eventName,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
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
                if (onTap != null) ...[
                  const SizedBox(width: 4),
                  Icon(Icons.chevron_right,
                      size: 16, color: theme.textTheme.bodySmall?.color),
                ],
              ],
            ),
            const SizedBox(height: 4),
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
          ],
        ),
      ),
    );
  }
}

class _PropertyList extends StatelessWidget {
  final List<EventProperty> properties;
  final ScrollController scrollController;

  const _PropertyList({
    required this.properties,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Group properties by key
    final grouped = <String, List<EventProperty>>{};
    for (final p in properties) {
      grouped.putIfAbsent(p.propertyKey, () => []).add(p);
    }

    final keys = grouped.keys.toList();

    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: keys.length,
      itemBuilder: (context, index) {
        final key = keys[index];
        final values = grouped[key]!;
        final totalForKey = values.fold<int>(0, (sum, p) => sum + p.count);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                key,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 6),
              ...values.map((p) {
                final pct =
                    totalForKey > 0 ? (p.count / totalForKey * 100) : 0.0;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          p.propertyValue.isEmpty ? '(empty)' : p.propertyValue,
                          style: theme.textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${p.count}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 6),
                      SizedBox(
                        width: 42,
                        child: Text(
                          '${pct.toStringAsFixed(0)}%',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 11),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                );
              }),
              if (index < keys.length - 1)
                Divider(
                  color: theme.dividerTheme.color?.withValues(alpha: 0.3),
                ),
            ],
          ),
        );
      },
    );
  }
}
