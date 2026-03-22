import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/event.dart';
import '../../../shared/models/overview.dart';
import '../../../shared/utils/formatters.dart';
import '../../events/data/events_repository.dart';
import '../data/analytics_repository.dart';

/// Live view data refreshed periodically.
class _LiveData {
  final int liveUserCount;
  final Overview? recentOverview;
  final List<RawEvent> recentEvents;
  final DateTime lastUpdated;

  const _LiveData({
    this.liveUserCount = 0,
    this.recentOverview,
    this.recentEvents = const [],
    required this.lastUpdated,
  });
}

class LiveViewScreen extends ConsumerStatefulWidget {
  final String siteId;

  const LiveViewScreen({super.key, required this.siteId});

  @override
  ConsumerState<LiveViewScreen> createState() => _LiveViewScreenState();
}

class _LiveViewScreenState extends ConsumerState<LiveViewScreen> {
  Timer? _refreshTimer;
  _LiveData _data = _LiveData(lastUpdated: DateTime.now());
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadData();
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => _loadData(),
    );
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  Future<void> _loadData() async {
    try {
      final analyticsRepo = ref.read(analyticsRepositoryProvider);
      final eventsRepo = ref.read(eventsRepositoryProvider);
      final siteId = widget.siteId;
      final tzOffset = DateTime.now().timeZoneOffset;
      final tzSign = tzOffset.isNegative ? '-' : '+';
      final tzH = tzOffset.inHours.abs().toString().padLeft(2, '0');
      final tzM = (tzOffset.inMinutes.abs() % 60).toString().padLeft(2, '0');
      final tz = 'UTC$tzSign$tzH:$tzM';

      final results = await Future.wait([
        analyticsRepo.getLiveUserCount(siteId),
        analyticsRepo.getOverview(siteId, {
          'past_minutes_start': '30',
          'past_minutes_end': '0',
          'time_zone': tz,
        }),
        eventsRepo.getRawEvents(siteId, {
          'past_minutes_start': '5',
          'past_minutes_end': '0',
          'time_zone': tz,
          'page_size': '20',
        }),
      ]);

      if (mounted) {
        setState(() {
          _data = _LiveData(
            liveUserCount: results[0] as int,
            recentOverview: results[1] as Overview,
            recentEvents: (results[2] as RawEventsResponse).data,
            lastUpdated: DateTime.now(),
          );
          _isLoading = false;
          _error = null;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _error = e.toString();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.liveView, style: const TextStyle(fontSize: 18)),
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
        actions: [
          // Auto-refresh indicator
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    l10n.autoRefresh,
                    style: TextStyle(
                      fontSize: 11,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: _isLoading && _data.recentOverview == null
          ? const Center(child: CircularProgressIndicator())
          : _error != null && _data.recentOverview == null
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline,
                            size: 48, color: theme.colorScheme.error),
                        const SizedBox(height: 16),
                        Text(formatError(_error!),
                            style: theme.textTheme.bodySmall,
                            textAlign: TextAlign.center),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _loadData,
                          child: Text(l10n.retry),
                        ),
                      ],
                    ),
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Live user count hero
                        _LiveCountCard(
                          count: _data.liveUserCount,
                          lastUpdated: _data.lastUpdated,
                        ),

                        const SizedBox(height: 16),

                        // Recent stats (last 30 min)
                        if (_data.recentOverview != null) ...[
                          Text(
                            l10n.last30Minutes,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _RecentStatsGrid(overview: _data.recentOverview!),
                        ],

                        const SizedBox(height: 24),

                        // Recent events
                        Row(
                          children: [
                            Text(
                              l10n.recentEvents,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              l10n.last5Minutes,
                              style: theme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        if (_data.recentEvents.isEmpty)
                          Padding(
                            padding: const EdgeInsets.all(32),
                            child: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.hourglass_empty,
                                      size: 40,
                                      color: theme.textTheme.bodySmall?.color),
                                  const SizedBox(height: 12),
                                  Text(l10n.noRecentEvents,
                                      style: theme.textTheme.bodyMedium),
                                ],
                              ),
                            ),
                          )
                        else
                          ...List.generate(
                            _data.recentEvents.length,
                            (i) => _LiveEventTile(
                                event: _data.recentEvents[i]),
                          ),
                      ],
                    ),
                  ),
                ),
    );
  }
}

class _LiveCountCard extends StatelessWidget {
  final int count;
  final DateTime lastUpdated;

  const _LiveCountCard({required this.count, required this.lastUpdated});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final timeStr = DateFormat('HH:mm:ss').format(lastUpdated);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: count > 0
                        ? AppColors.success
                        : const Color(0xFF94A3B8),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '$count',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: count > 0
                        ? AppColors.success
                        : theme.textTheme.bodyMedium?.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.usersOnlineNow,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.lastUpdatedAt(timeStr),
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentStatsGrid extends ConsumerWidget {
  final Overview overview;

  const _RecentStatsGrid({required this.overview});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    final stats = [
      (isMobile ? l10n.screenviews : l10n.pageviews, formatNumber(overview.pageviews), Icons.visibility),
      (l10n.sessions, formatNumber(overview.sessions), Icons.people),
      (l10n.bounceRate, formatPercentage(overview.bounceRate), Icons.trending_down),
      (l10n.duration, formatDuration(overview.sessionDuration), Icons.timer),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 2.2,
      children: stats.map((s) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Icon(s.$3,
                        size: 14,
                        color: theme.textTheme.bodySmall?.color),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(s.$1,
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 11),
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  s.$2,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _LiveEventTile extends StatelessWidget {
  final RawEvent event;

  const _LiveEventTile({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final flag = countryToFlag(event.country);

    final (Color typeColor, IconData typeIcon) = switch (event.type) {
      'pageview' => (const Color(0xFF3B82F6), Icons.visibility),
      'custom_event' => (AppColors.success, Icons.bolt),
      'outbound' => (const Color(0xFFF59E0B), Icons.open_in_new),
      _ => (const Color(0xFF94A3B8), Icons.circle),
    };

    final dt = DateTime.tryParse(event.timestamp);
    final timeStr = dt != null
        ? DateFormat('HH:mm:ss').format(dt.toLocal())
        : '';

    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: typeColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(typeIcon, size: 16, color: typeColor),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.displayType,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (event.pathname != null && event.pathname!.isNotEmpty)
                      Text(
                        event.pathname!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (flag.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Text(flag, style: const TextStyle(fontSize: 16)),
                ),
              Flexible(
                flex: 0,
                child: Text(
                  timeStr,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
