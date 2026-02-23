import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/session.dart';
import '../../../shared/utils/formatters.dart';
import '../application/sessions_controller.dart';
import '../data/sessions_repository.dart';

// ── Filter Dialog ────────────────────────────────────────────────

class _SessionFilterDialog extends StatefulWidget {
  final SessionFilterParams initial;
  const _SessionFilterDialog({required this.initial});

  @override
  State<_SessionFilterDialog> createState() => _SessionFilterDialogState();
}

class _SessionFilterDialogState extends State<_SessionFilterDialog> {
  late final TextEditingController _pageviewsCtrl;
  late final TextEditingController _eventsCtrl;
  late final TextEditingController _durationCtrl;

  @override
  void initState() {
    super.initState();
    _pageviewsCtrl = TextEditingController(
        text: (widget.initial.minPageviews ?? 0) > 0
            ? widget.initial.minPageviews.toString()
            : '');
    _eventsCtrl = TextEditingController(
        text: (widget.initial.minEvents ?? 0) > 0
            ? widget.initial.minEvents.toString()
            : '');
    _durationCtrl = TextEditingController(
        text: (widget.initial.minDuration ?? 0) > 0
            ? widget.initial.minDuration.toString()
            : '');
  }

  @override
  void dispose() {
    _pageviewsCtrl.dispose();
    _eventsCtrl.dispose();
    _durationCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.sessionFilters),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _pageviewsCtrl,
              decoration: InputDecoration(labelText: l10n.minPageviews),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _eventsCtrl,
              decoration: InputDecoration(labelText: l10n.minEvents),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _durationCtrl,
              decoration:
                  InputDecoration(labelText: l10n.minDurationSeconds),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.pop(context, const SessionFilterParams()),
          child: Text(l10n.clear),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              SessionFilterParams(
                minPageviews: int.tryParse(_pageviewsCtrl.text),
                minEvents: int.tryParse(_eventsCtrl.text),
                minDuration: int.tryParse(_durationCtrl.text),
              ),
            );
          },
          child: Text(l10n.apply),
        ),
      ],
    );
  }
}

// ── Main Screen ──────────────────────────────────────────────────

class SessionsListScreen extends ConsumerStatefulWidget {
  final String siteId;

  const SessionsListScreen({super.key, required this.siteId});

  @override
  ConsumerState<SessionsListScreen> createState() =>
      _SessionsListScreenState();
}

class _SessionsListScreenState extends ConsumerState<SessionsListScreen> {
  final ScrollController _scrollController = ScrollController();

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
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(sessionsControllerProvider(widget.siteId).notifier)
          .loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final sessionsAsync =
        ref.watch(sessionsControllerProvider(widget.siteId));
    final theme = Theme.of(context);
    final domain = ref.watch(currentSiteDomainProvider);
    final sessionFilter = ref.watch(sessionFilterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.sessions, style: const TextStyle(fontSize: 18)),
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
          IconButton(
            tooltip: l10n.filterSessions,
            icon: Badge(
              isLabelVisible: sessionFilter.hasFilters,
              smallSize: 8,
              child: const Icon(Icons.filter_list),
            ),
            onPressed: () async {
              final result = await showDialog<SessionFilterParams>(
                context: context,
                builder: (_) =>
                    _SessionFilterDialog(initial: sessionFilter),
              );
              if (result != null) {
                ref.read(sessionFilterProvider.notifier).state = result;
              }
            },
          ),
        ],
      ),
      body: sessionsAsync.when(
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
                Text(l10n.failedToLoadSessions,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref
                      .read(sessionsControllerProvider(widget.siteId)
                          .notifier)
                      .refresh(),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (sessionsState) {
          if (sessionsState.sessions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline,
                      size: 48, color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text(l10n.noSessionsFound,
                      style: theme.textTheme.bodyLarge),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref
                .read(
                    sessionsControllerProvider(widget.siteId).notifier)
                .refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: sessionsState.sessions.length +
                  (sessionsState.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= sessionsState.sessions.length) {
                  return Semantics(
                    label: l10n.loadingMoreSessions,
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child:
                              CircularProgressIndicator(strokeWidth: 2)),
                    ),
                  );
                }

                final session = sessionsState.sessions[index];
                return _SessionCard(
                  session: session,
                  siteId: widget.siteId,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// ── Session Card (Expandable) ────────────────────────────────────

class _SessionCard extends ConsumerStatefulWidget {
  final AnalyticsSession session;
  final String siteId;

  const _SessionCard({required this.session, required this.siteId});

  @override
  ConsumerState<_SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends ConsumerState<_SessionCard> {
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
                  ? const BorderRadius.vertical(
                      top: Radius.circular(12))
                  : BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row 1: Flag + Browser/OS + Time
                    Row(
                      children: [
                        if (flag.isNotEmpty) ...[
                          Text(flag,
                              style: const TextStyle(fontSize: 20),
                              semanticsLabel: session.country ??
                                  l10n.unknownCountry),
                          const SizedBox(width: 10),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  if (session.browser != null &&
                                      session.browser!.isNotEmpty)
                                    Flexible(
                                      child: Text(
                                        session.browser!,
                                        style: theme
                                            .textTheme.bodyMedium
                                            ?.copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow:
                                            TextOverflow.ellipsis,
                                      ),
                                    ),
                                  if (session.deviceType != null &&
                                      session
                                          .deviceType!.isNotEmpty) ...[
                                    const SizedBox(width: 6),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 6,
                                                vertical: 1),
                                        decoration: BoxDecoration(
                                          color: theme
                                              .colorScheme.primary
                                              .withValues(alpha: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          session.deviceType!,
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: theme
                                                .colorScheme.primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          overflow:
                                              TextOverflow.ellipsis,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                              if (session.operatingSystem != null &&
                                  session
                                      .operatingSystem!.isNotEmpty)
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
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                ),
                              ),
                            const SizedBox(height: 2),
                            Text(
                              duration,
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(
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
                            color: const Color(0xFF22C55E),
                          ),
                          const SizedBox(width: 6),
                        ],
                        if (session.errors > 0) ...[
                          _StatBadge(
                            icon: Icons.error_outline,
                            value: '${session.errors}',
                            theme: theme,
                            color: const Color(0xFFEF4444),
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
    final textStyle =
        theme.textTheme.bodySmall?.copyWith(fontSize: 11);
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
        if (exit != null &&
            exit.isNotEmpty &&
            exit != entry) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Icon(Icons.arrow_forward,
                size: 10, color: iconColor),
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
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(
      sessionDetailProvider(
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
            _DetailContent(detail: detail, siteId: siteId),
      ),
    );
  }
}

// ── Detail Content ───────────────────────────────────────────────

class _DetailContent extends StatelessWidget {
  final SessionDetail detail;
  final String siteId;

  const _DetailContent({
    required this.detail,
    required this.siteId,
  });

  @override
  Widget build(BuildContext context) {
    final s = detail.session;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    // Build location string
    final locationParts = <String>[
      if (s.country != null && s.country!.isNotEmpty) s.country!,
      if (s.city != null && s.city!.isNotEmpty) s.city!,
      if (s.region != null && s.region!.isNotEmpty) s.region!,
    ];
    final locationStr =
        locationParts.isNotEmpty ? locationParts.join(', ') : null;

    // Build device string
    final deviceParts = <String>[
      if (s.browser != null)
        '${s.browser} ${s.browserVersion ?? ""}'.trim(),
      if (s.operatingSystem != null)
        '${s.operatingSystem} ${s.osVersion ?? ""}'.trim(),
      if (s.language != null && s.language!.isNotEmpty) s.language!,
    ];
    final deviceStr = deviceParts.isNotEmpty
        ? deviceParts.join(' \u00b7 ')
        : null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              icon: Icons.devices_outlined,
              text: deviceStr,
              theme: theme,
            ),
          // Source
          if (s.referrer != null && s.referrer!.isNotEmpty)
            _DetailRow(
              icon: Icons.link,
              text: s.referrer!,
              theme: theme,
            ),
          // UTM
          if (s.utmSource != null && s.utmSource!.isNotEmpty)
            _DetailRow(
              icon: Icons.campaign_outlined,
              text: [s.utmSource, s.utmMedium, s.utmCampaign]
                  .where((v) => v != null && v.isNotEmpty)
                  .join(' / '),
              theme: theme,
            ),
          // Channel
          if (s.channel != null && s.channel!.isNotEmpty)
            _DetailRow(
              icon: Icons.public,
              text: s.channel!,
              theme: theme,
            ),
          const SizedBox(height: 8),
          // Mini timeline header
          Text(
            l10n.eventTimelineCount(detail.events.length),
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Timeline events (max 5)
          if (detail.events.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(l10n.noEvents,
                  style: theme.textTheme.bodySmall),
            )
          else ...[
            ...detail.events
                .take(5)
                .map((event) =>
                    _MiniTimelineEvent(event: event, theme: theme)),
            if (detail.events.length > 5)
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => context.push(
                    '/sessions/$siteId/${detail.session.sessionId}',
                  ),
                  icon: const Icon(Icons.list, size: 16),
                  label: Text(
                    l10n.eventTimelineCount(detail.events.length),
                    style: const TextStyle(fontSize: 12),
                  ),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
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

  const _DetailRow({
    required this.icon,
    required this.text,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon,
              size: 14,
              color: theme.textTheme.bodySmall?.color),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              text.trim(),
              style: theme.textTheme.bodySmall,
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
    final timeStr =
        dt != null ? DateFormat('HH:mm:ss').format(dt) : '';

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
              style: theme.textTheme.bodySmall
                  ?.copyWith(fontSize: 11),
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
    final c =
        color ?? theme.textTheme.bodySmall?.color ?? Colors.grey;
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
