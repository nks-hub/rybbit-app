import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../shared/utils/formatters.dart';
import '../data/sessions_repository.dart';
import 'sessions_list_screen.dart';

/// Provider for loading session detail.
final sessionDetailProvider = FutureProvider.family<SessionDetail, ({String siteId, String sessionId})>((ref, args) async {
  final repo = ref.read(sessionsRepositoryProvider);
  return repo.getSessionDetail(args.siteId, args.sessionId);
});

class SessionDetailScreen extends ConsumerWidget {
  final String siteId;
  final String sessionId;

  const SessionDetailScreen({
    super.key,
    required this.siteId,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(
      sessionDetailProvider((siteId: siteId, sessionId: sessionId)),
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Session Detail', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: 'Go back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: theme.colorScheme.error),
                const SizedBox(height: 16),
                Text('Failed to load session',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    sessionDetailProvider(
                        (siteId: siteId, sessionId: sessionId)),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (detail) => _buildContent(context, detail),
      ),
    );
  }

  Widget _buildContent(BuildContext context, SessionDetail detail) {
    final session = detail.session;
    final theme = Theme.of(context);
    final flag = countryToFlag(session.country);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Session overview card
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (flag.isNotEmpty) ...[
                          Text(flag,
                              style: const TextStyle(fontSize: 24),
                              semanticsLabel: session.country ?? 'Unknown country'),
                          const SizedBox(width: 12),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${session.country ?? "Unknown"}'
                                '${session.city != null && session.city!.isNotEmpty ? ", ${session.city}" : ""}',
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              if (session.region != null &&
                                  session.region!.isNotEmpty)
                                Text(
                                  session.region!,
                                  style: theme.textTheme.bodySmall,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    _InfoRow(
                      icon: Icons.timer,
                      label: 'Duration',
                      value: formatDuration(session.sessionDuration),
                    ),
                    _InfoRow(
                      icon: Icons.pageview,
                      label: 'Pageviews',
                      value: session.pageviews.toString(),
                    ),
                    _InfoRow(
                      icon: Icons.login,
                      label: 'Entry Page',
                      value: session.entryPage ?? '-',
                    ),
                    _InfoRow(
                      icon: Icons.logout,
                      label: 'Exit Page',
                      value: session.exitPage ?? '-',
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Browser/Device card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browser & Device',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _InfoRow(
                      icon: Icons.web,
                      label: 'Browser',
                      value:
                          '${session.browser ?? "-"} ${session.browserVersion ?? ""}',
                    ),
                    _InfoRow(
                      icon: Icons.computer,
                      label: 'OS',
                      value:
                          '${session.operatingSystem ?? "-"} ${session.osVersion ?? ""}',
                    ),
                    _InfoRow(
                      icon: Icons.devices,
                      label: 'Device',
                      value: session.deviceType ?? '-',
                    ),
                    _InfoRow(
                      icon: Icons.translate,
                      label: 'Language',
                      value: session.language ?? '-',
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Referrer/UTM card
          if (_hasReferrerOrUtm(session))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Source',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (session.referrer != null &&
                          session.referrer!.isNotEmpty)
                        _InfoRow(
                          icon: Icons.link,
                          label: 'Referrer',
                          value: session.referrer!,
                        ),
                      if (session.utmSource != null &&
                          session.utmSource!.isNotEmpty)
                        _InfoRow(
                          icon: Icons.campaign,
                          label: 'UTM Source',
                          value: session.utmSource!,
                        ),
                      if (session.utmMedium != null &&
                          session.utmMedium!.isNotEmpty)
                        _InfoRow(
                          icon: Icons.mediation,
                          label: 'UTM Medium',
                          value: session.utmMedium!,
                        ),
                      if (session.utmCampaign != null &&
                          session.utmCampaign!.isNotEmpty)
                        _InfoRow(
                          icon: Icons.flag,
                          label: 'UTM Campaign',
                          value: session.utmCampaign!,
                        ),
                    ],
                  ),
                ),
              ),
            ),

          const SizedBox(height: 16),

          // Event timeline
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Event Timeline (${detail.events.length})',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),

          if (detail.events.isEmpty)
            Padding(
              padding: const EdgeInsets.all(32),
              child: Center(
                child: Text('No events', style: theme.textTheme.bodySmall),
              ),
            )
          else
            ...detail.events.asMap().entries.map((entry) {
              final event = entry.value;
              final isLast = entry.key == detail.events.length - 1;
              return _EventTimelineItem(
                event: event,
                isLast: isLast,
              );
            }),
        ],
      ),
    );
  }

  bool _hasReferrerOrUtm(dynamic session) {
    return (session.referrer != null && session.referrer!.isNotEmpty) ||
        (session.utmSource != null && session.utmSource!.isNotEmpty) ||
        (session.utmMedium != null && session.utmMedium!.isNotEmpty) ||
        (session.utmCampaign != null && session.utmCampaign!.isNotEmpty);
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: theme.textTheme.bodySmall?.color),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: theme.textTheme.bodySmall,
            ),
          ),
          Expanded(
            child: Text(
              value.trim(),
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _EventTimelineItem extends StatelessWidget {
  final SessionEvent event;
  final bool isLast;

  const _EventTimelineItem({required this.event, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dt = DateTime.tryParse(event.timestamp);
    final timeStr = dt != null ? DateFormat('HH:mm:ss').format(dt) : '';

    Color dotColor;
    IconData dotIcon;
    switch (event.iconType) {
      case IconType.pageview:
        dotColor = theme.colorScheme.primary;
        dotIcon = Icons.article_outlined;
      case IconType.customEvent:
        dotColor = const Color(0xFF22C55E);
        dotIcon = Icons.bolt;
      case IconType.error:
        dotColor = const Color(0xFFEF4444);
        dotIcon = Icons.error_outline;
      case IconType.other:
        dotColor = Colors.grey;
        dotIcon = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timeline line + dot
            SizedBox(
              width: 32,
              child: Column(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: dotColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(dotIcon, size: 14, color: dotColor),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color: theme.dividerTheme.color?.withValues(alpha: 0.3),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            event.displayLabel,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          timeStr,
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                    if (event.pageTitle != null &&
                        event.pageTitle!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        event.pageTitle!,
                        style:
                            theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
