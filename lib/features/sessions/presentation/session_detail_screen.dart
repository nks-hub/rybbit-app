import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/session.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/utils/user_display_name.dart';
import '../application/sessions_controller.dart';
import '../data/sessions_repository.dart';

class SessionDetailScreen extends ConsumerStatefulWidget {
  final String siteId;
  final String sessionId;

  const SessionDetailScreen({
    super.key,
    required this.siteId,
    required this.sessionId,
  });

  @override
  ConsumerState<SessionDetailScreen> createState() =>
      _SessionDetailScreenState();
}

class _SessionDetailScreenState extends ConsumerState<SessionDetailScreen> {
  final ScrollController _scrollController = ScrollController();

  ({String siteId, String sessionId}) get _args =>
      (siteId: widget.siteId, sessionId: widget.sessionId);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 300) {
      ref
          .read(sessionDetailControllerProvider(_args).notifier)
          .loadMoreEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailAsync = ref.watch(sessionDetailControllerProvider(_args));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.sessionDetail, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: detailAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Semantics(
            liveRegion: true,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,
                        size: 48, color: theme.colorScheme.error),
                    const SizedBox(height: 16),
                    Text(l10n.failedToLoadSession,
                        style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text(formatError(error),
                        style: theme.textTheme.bodySmall,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () => ref
                          .read(
                              sessionDetailControllerProvider(_args).notifier)
                          .refresh(),
                      child: Text(l10n.retry),
                    ),
                  ],
                ),
              ),
            )),
        data: (detail) => _buildContent(context, detail),
      ),
    );
  }

  Widget _buildContent(BuildContext context, SessionDetailViewState detail) {
    final session = detail.session;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final flag = countryToFlag(session.country);
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    return RefreshIndicator(
      onRefresh: () =>
          ref.read(sessionDetailControllerProvider(_args).notifier).refresh(),
      child: CustomScrollView(
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User info card
                if (isIdentified(session) ||
                    (session.traits != null && session.traits!.isNotEmpty))
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  isIdentified(session)
                                      ? Icons.person
                                      : Icons.person_outline,
                                  size: 20,
                                  color: isIdentified(session)
                                      ? const Color(0xFF22C55E)
                                      : theme.colorScheme.primary,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    getUserDisplayName(session),
                                    style:
                                        theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isIdentified(session))
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF22C55E)
                                          .withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      'Identified',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Color(0xFF22C55E),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            if (session.identifiedUserId != null &&
                                session.identifiedUserId!.isNotEmpty) ...[
                              const SizedBox(height: 4),
                              _InfoRow(
                                icon: Icons.badge_outlined,
                                label: 'User ID',
                                value: session.identifiedUserId!,
                              ),
                            ],
                            if (session.traits != null &&
                                session.traits!.isNotEmpty) ...[
                              const Divider(height: 16),
                              ...session.traits!.entries
                                  .where((e) =>
                                      e.value != null &&
                                      e.value.toString().isNotEmpty)
                                  .map((e) => _InfoRow(
                                        icon: Icons.label_outline,
                                        label: e.key,
                                        value: e.value.toString(),
                                      )),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),

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
                                    semanticsLabel: session.country ??
                                        l10n.unknownCountry),
                                const SizedBox(width: 12),
                              ],
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${session.country ?? l10n.unknown}'
                                      '${session.city != null && session.city!.isNotEmpty ? ", ${session.city}" : ""}',
                                      style: theme.textTheme.bodyLarge
                                          ?.copyWith(
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
                            label: l10n.duration,
                            value: formatDuration(session.sessionDuration),
                          ),
                          _InfoRow(
                            icon: Icons.pageview,
                            label: isMobile ? l10n.screenviews : l10n.pageviews,
                            value: session.pageviews.toString(),
                          ),
                          _InfoRow(
                            icon: Icons.login,
                            label: isMobile ? l10n.entryScreens : l10n.entryPageLabel,
                            value: session.entryPage ?? '-',
                          ),
                          _InfoRow(
                            icon: Icons.logout,
                            label: isMobile ? l10n.exitScreens : l10n.exitPage,
                            value: session.exitPage ?? '-',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Browser/Device card - conditional for mobile vs web
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isMobile ? l10n.sdkInfo : l10n.browserAndDevice,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isMobile) ...[
                            if (session.deviceModel != null &&
                                session.deviceModel!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.smartphone,
                                label: l10n.deviceModel,
                                value: session.deviceModel!,
                              ),
                            if (session.appVersion != null &&
                                session.appVersion!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.label_outlined,
                                label: l10n.appVersion,
                                value: session.appVersion!,
                              ),
                            _InfoRow(
                              icon: Icons.computer,
                              label: l10n.os,
                              value:
                                  '${session.operatingSystem ?? "-"} ${session.osVersion ?? ""}',
                            ),
                            _InfoRow(
                              icon: Icons.translate,
                              label: l10n.language,
                              value: session.language ?? '-',
                            ),
                          ] else ...[
                            _InfoRow(
                              icon: Icons.web,
                              label: l10n.browser,
                              value:
                                  '${session.browser ?? "-"} ${session.browserVersion ?? ""}',
                            ),
                            _InfoRow(
                              icon: Icons.computer,
                              label: l10n.os,
                              value:
                                  '${session.operatingSystem ?? "-"} ${session.osVersion ?? ""}',
                            ),
                            _InfoRow(
                              icon: Icons.devices,
                              label: l10n.device,
                              value: session.deviceType ?? '-',
                            ),
                            _InfoRow(
                              icon: Icons.translate,
                              label: l10n.language,
                              value: session.language ?? '-',
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Referrer/UTM card - only for web sites
                if (!isMobile && _hasReferrerOrUtm(session))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.sourceLabel,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            if (session.referrer != null &&
                                session.referrer!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.link,
                                label: l10n.referrer,
                                value: session.referrer!,
                              ),
                            if (session.utmSource != null &&
                                session.utmSource!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.campaign,
                                label: l10n.utmSource,
                                value: session.utmSource!,
                              ),
                            if (session.utmMedium != null &&
                                session.utmMedium!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.mediation,
                                label: l10n.utmMedium,
                                value: session.utmMedium!,
                              ),
                            if (session.utmCampaign != null &&
                                session.utmCampaign!.isNotEmpty)
                              _InfoRow(
                                icon: Icons.flag,
                                label: l10n.utmCampaign,
                                value: session.utmCampaign!,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 16),

                // Event timeline header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    detail.totalEvents > 0
                        ? l10n.eventTimelineCount(detail.totalEvents)
                        : l10n.eventTimelineCount(detail.events.length),
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
                      child: Text(l10n.noEvents,
                          style: theme.textTheme.bodySmall),
                    ),
                  ),
              ],
            ),
          ),

          // Event timeline as sliver list for infinite scroll
          if (detail.events.isNotEmpty)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index >= detail.events.length) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child:
                            CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  }
                  final event = detail.events[index];
                  final isLast =
                      index == detail.events.length - 1 && !detail.hasMore;
                  return _EventTimelineItem(
                    event: event,
                    isLast: isLast,
                  );
                },
                childCount: detail.events.length +
                    (detail.isLoadingMore ? 1 : 0),
              ),
            ),

          const SliverPadding(padding: EdgeInsets.only(bottom: 32)),
        ],
      ),
    );
  }

  bool _hasReferrerOrUtm(AnalyticsSession session) {
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
          Icon(icon, size: 18, color: theme.textTheme.bodyMedium?.color),
          const SizedBox(width: 8),
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: theme.textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
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
        dotColor = theme.disabledColor;
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
                    child: Icon(dotIcon, size: 16, color: dotColor),
                  ),
                  if (!isLast)
                    Expanded(
                      child: Container(
                        width: 2,
                        color:
                            theme.dividerTheme.color?.withValues(alpha: 0.3),
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
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                    if (event.pageTitle != null &&
                        event.pageTitle!.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        event.pageTitle!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 11),
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
