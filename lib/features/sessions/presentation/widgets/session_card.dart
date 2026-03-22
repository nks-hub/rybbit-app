import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../core/state/current_site_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../../shared/models/session.dart';
import '../../../../shared/utils/formatters.dart';
import '../../../../shared/utils/user_display_name.dart';
import '../../application/sessions_controller.dart';
import '../../data/models.dart';

class SessionCard extends ConsumerStatefulWidget {
  final AnalyticsSession session;
  final String siteId;

  const SessionCard({super.key, required this.session, required this.siteId});

  @override
  ConsumerState<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends ConsumerState<SessionCard> {
  bool _expanded = false;

  String _relativeTime(String? sessionStart, AppLocalizations l10n) {
    if (sessionStart == null) return '';
    final dt = DateTime.tryParse(sessionStart);
    if (dt == null) return '';
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return l10n.relativeNow;
    if (diff.inMinutes < 60) return l10n.relativeMinutes(diff.inMinutes);
    if (diff.inHours < 24) return l10n.relativeHours(diff.inHours);
    if (diff.inDays < 7) return l10n.relativeDays(diff.inDays);
    return l10n.relativeWeeks(diff.inDays ~/ 7);
  }

  @override
  Widget build(BuildContext context) {
    final session = widget.session;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final flag = countryToFlag(session.country);
    final duration = formatDuration(session.sessionDuration);
    final relTime = _relativeTime(session.sessionStart, l10n);
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            // ── Header (always visible) ──
            InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              borderRadius: _expanded
                  ? const BorderRadius.vertical(top: Radius.circular(12))
                  : BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row 0: User display name
                    Row(
                      children: [
                        Icon(
                          isIdentified(session)
                              ? Icons.person
                              : Icons.person_outline,
                          size: 14,
                          color: isIdentified(session)
                              ? AppColors.success
                              : theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            getUserDisplayName(session),
                            style: TextStyle(
                              fontSize: 11,
                              color: isIdentified(session)
                                  ? AppColors.success
                                  : theme.colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isIdentified(session)) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 1),
                            decoration: BoxDecoration(
                              color: AppColors.success.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'ID',
                              style: TextStyle(
                                fontSize: 9,
                                color: AppColors.success,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Row 1: Flag + Browser/Device info + Time
                    Row(
                      children: [
                        if (flag.isNotEmpty) ...[
                          Text(flag,
                              style: const TextStyle(fontSize: 20),
                              semanticsLabel:
                                  session.country ?? l10n.unknownCountry),
                          const SizedBox(width: 10),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (isMobile) ...[
                                    // Mobile: show device model and app version
                                    if (session.deviceModel != null &&
                                        session.deviceModel!.isNotEmpty)
                                      Flexible(
                                        child: Text(
                                          session.deviceModel!,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    if (session.appVersion != null &&
                                        session.appVersion!.isNotEmpty) ...[
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 1),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.primary
                                                .withValues(alpha: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            'v${session.appVersion!}',
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ] else ...[
                                    // Web: show browser and device type
                                    if (session.browser != null &&
                                        session.browser!.isNotEmpty)
                                      Flexible(
                                        child: Text(
                                          session.browser!,
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    if (session.deviceType != null &&
                                        session.deviceType!.isNotEmpty) ...[
                                      const SizedBox(width: 6),
                                      Flexible(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 1),
                                          decoration: BoxDecoration(
                                            color: theme.colorScheme.primary
                                                .withValues(alpha: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Text(
                                            session.deviceType!,
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: theme.colorScheme.primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ],
                              ),
                              if (session.operatingSystem != null &&
                                  session.operatingSystem!.isNotEmpty)
                                Text(
                                  session.operatingSystem!,
                                  style: theme.textTheme.bodySmall
                                      ?.copyWith(fontSize: 11),
                                ),
                            ],
                          ),
                        ),
                        // Time + duration column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            if (relTime.isNotEmpty)
                              Text(
                                relTime,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            const SizedBox(height: 2),
                            Text(
                              duration,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Row 2: Stats + Entry→Exit + expand icon
                    Row(
                      children: [
                        _StatBadge(
                          icon: Icons.pageview,
                          value: '${session.pageviews}',
                          theme: theme,
                        ),
                        const SizedBox(width: 6),
                        if (session.events > 0) ...[
                          _StatBadge(
                            icon: Icons.bolt,
                            value: '${session.events}',
                            theme: theme,
                            color: AppColors.success,
                          ),
                          const SizedBox(width: 6),
                        ],
                        if (session.errors > 0) ...[
                          _StatBadge(
                            icon: Icons.error_outline,
                            value: '${session.errors}',
                            theme: theme,
                            color: AppColors.error,
                          ),
                          const SizedBox(width: 6),
                        ],
                        const Spacer(),
                        // Entry → Exit page
                        if (session.entryPage != null &&
                            session.entryPage!.isNotEmpty)
                          Flexible(
                            child: _PagePath(session: session, theme: theme),
                          ),
                        const SizedBox(width: 4),
                        Icon(
                          _expanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 18,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // ── Expanded Detail ──
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: _expanded
                  ? _ExpandedDetail(
                      siteId: widget.siteId,
                      session: session,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Entry → Exit Page Path ───────────────────────────────────────

class _PagePath extends StatelessWidget {
  final AnalyticsSession session;
  final ThemeData theme;

  const _PagePath({required this.session, required this.theme});

  @override
  Widget build(BuildContext context) {
    final entry = session.entryPage ?? '/';
    final exit = session.exitPage;
    final textStyle = theme.textTheme.bodySmall?.copyWith(fontSize: 11);
    final iconColor = theme.textTheme.bodySmall?.color;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.login, size: 12, color: iconColor),
        const SizedBox(width: 3),
        Flexible(
          child: Text(
            entry,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (exit != null && exit.isNotEmpty && exit != entry) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.arrow_forward, size: 10, color: iconColor),
          ),
          Flexible(
            child: Text(
              exit,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }
}

// ── Expanded Detail (Lazy-loaded) ────────────────────────────────

class _ExpandedDetail extends ConsumerWidget {
  final String siteId;
  final AnalyticsSession session;

  const _ExpandedDetail({
    required this.siteId,
    required this.session,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final detailAsync = ref.watch(
      sessionDetailControllerProvider(
          (siteId: siteId, sessionId: session.sessionId)),
    );

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.dividerColor.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: detailAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(24),
          child: Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        error: (e, _) => Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            formatError(e),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.error,
            ),
          ),
        ),
        data: (detail) =>
            _DetailContent(detail: detail, siteId: siteId, listSession: session),
      ),
    );
  }
}

// ── Detail Content ───────────────────────────────────────────────

class _DetailContent extends ConsumerWidget {
  final SessionDetailViewState detail;
  final String siteId;
  final AnalyticsSession listSession;

  const _DetailContent({
    required this.detail,
    required this.siteId,
    required this.listSession,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = detail.session;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    // Build location string
    final locationParts = <String>[
      if (s.country != null && s.country!.isNotEmpty) s.country!,
      if (s.city != null && s.city!.isNotEmpty) s.city!,
      if (s.region != null && s.region!.isNotEmpty) s.region!,
    ];
    final locationStr =
        locationParts.isNotEmpty ? locationParts.join(', ') : null;

    // Build device string - different for mobile vs web
    final String? deviceStr;
    if (isMobile) {
      final mobileParts = <String>[
        if (s.deviceModel != null && s.deviceModel!.isNotEmpty) s.deviceModel!,
        if (s.operatingSystem != null)
          '${s.operatingSystem} ${s.osVersion ?? ""}'.trim(),
        if (s.appVersion != null && s.appVersion!.isNotEmpty)
          'v${s.appVersion!}',
        if (s.language != null && s.language!.isNotEmpty) s.language!,
      ];
      deviceStr = mobileParts.isNotEmpty ? mobileParts.join(' \u00b7 ') : null;
    } else {
      final webParts = <String>[
        if (s.browser != null) '${s.browser} ${s.browserVersion ?? ""}'.trim(),
        if (s.operatingSystem != null)
          '${s.operatingSystem} ${s.osVersion ?? ""}'.trim(),
        if (s.language != null && s.language!.isNotEmpty) s.language!,
      ];
      deviceStr = webParts.isNotEmpty ? webParts.join(' \u00b7 ') : null;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Identified user (use listSession as fallback for identified_user_id)
          if (isIdentified(listSession))
            _DetailRow(
              icon: Icons.person,
              text: getUserDisplayName(listSession),
              theme: theme,
              color: AppColors.success,
            ),
          // Location
          if (locationStr != null)
            _DetailRow(
              icon: Icons.location_on_outlined,
              text: locationStr,
              theme: theme,
            ),
          // Device
          if (deviceStr != null)
            _DetailRow(
              icon: isMobile ? Icons.smartphone : Icons.devices_outlined,
              text: deviceStr,
              theme: theme,
            ),
          // Source - only for web sites
          if (!isMobile && s.referrer != null && s.referrer!.isNotEmpty)
            _DetailRow(
              icon: Icons.link,
              text: s.referrer!,
              theme: theme,
            ),
          // UTM - only for web sites
          if (!isMobile && s.utmSource != null && s.utmSource!.isNotEmpty)
            _DetailRow(
              icon: Icons.campaign_outlined,
              text: [s.utmSource, s.utmMedium, s.utmCampaign]
                  .where((v) => v != null && v.isNotEmpty)
                  .join(' / '),
              theme: theme,
            ),
          // Channel - only for web sites
          if (!isMobile && s.channel != null && s.channel!.isNotEmpty)
            _DetailRow(
              icon: Icons.public,
              text: s.channel!,
              theme: theme,
            ),
          const SizedBox(height: 8),
          // Mini timeline header
          Text(
            l10n.eventTimelineCount(
                detail.totalEvents > detail.events.length
                    ? detail.totalEvents
                    : detail.events.length),
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Timeline events (max 5)
          if (detail.events.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(l10n.noEvents, style: theme.textTheme.bodySmall),
            )
          else ...[
            ...detail.events
                .take(5)
                .map((event) => _MiniTimelineEvent(event: event, theme: theme)),
            if (detail.events.length > 5)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {
                    final loc = GoRouterState.of(context).matchedLocation;
                    if (loc.contains('/analytics/')) {
                      context.push(
                        '/analytics/$siteId/sessions/${detail.session.sessionId}',
                      );
                    } else {
                      context.push(
                        '/sessions/$siteId/${detail.session.sessionId}',
                      );
                    }
                  },
                  icon: const Icon(Icons.list, size: 16),
                  label: Text(
                    l10n.eventTimelineCount(
                        detail.totalEvents > detail.events.length
                            ? detail.totalEvents
                            : detail.events.length),
                    style: const TextStyle(fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: const Size(0, 48),
                  ),
                ),
              ),
          ],
        ],
      ),
    );
  }
}

// ── Helper Widgets ───────────────────────────────────────────────

class _DetailRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final ThemeData theme;
  final Color? color;

  const _DetailRow({
    required this.icon,
    required this.text,
    required this.theme,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon,
              size: 14, color: color ?? theme.textTheme.bodySmall?.color),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text.trim(),
              style: color != null
                  ? theme.textTheme.bodySmall
                      ?.copyWith(color: color, fontWeight: FontWeight.w600)
                  : theme.textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniTimelineEvent extends StatelessWidget {
  final SessionEvent event;
  final ThemeData theme;

  const _MiniTimelineEvent({
    required this.event,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    final dt = DateTime.tryParse(event.timestamp);
    final timeStr = dt != null ? DateFormat('HH:mm:ss').format(dt) : '';

    Color dotColor;
    IconData dotIcon;
    switch (event.iconType) {
      case IconType.pageview:
        dotColor = theme.colorScheme.primary;
        dotIcon = Icons.article_outlined;
      case IconType.customEvent:
        dotColor = AppColors.success;
        dotIcon = Icons.bolt;
      case IconType.error:
        dotColor = AppColors.error;
        dotIcon = Icons.error_outline;
      case IconType.other:
        dotColor = theme.disabledColor;
        dotIcon = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        children: [
          Icon(dotIcon, size: 12, color: dotColor),
          const SizedBox(width: 4),
          Text(timeStr,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 10,
                fontFamily: 'monospace',
              )),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              event.displayLabel,
              style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final IconData icon;
  final String value;
  final ThemeData theme;
  final Color? color;

  const _StatBadge({
    required this.icon,
    required this.value,
    required this.theme,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final c = color ?? theme.textTheme.bodySmall?.color ?? theme.disabledColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: c.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 11, color: c),
          const SizedBox(width: 3),
          Text(
            value,
            style: TextStyle(
              fontSize: 11,
              color: c,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
