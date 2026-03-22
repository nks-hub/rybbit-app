import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_view.dart';
import '../application/sessions_controller.dart';
import 'widgets/session_card.dart';

// ── Filter Dialog ────────────────────────────────────────────────

class _SessionFilterDialog extends StatefulWidget {
  final SessionFilterParams initial;
  final bool isMobile;
  const _SessionFilterDialog({required this.initial, this.isMobile = false});

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
              decoration: InputDecoration(
                labelText: widget.isMobile ? l10n.minScreenviews : l10n.minPageviews,
              ),
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

    final location = GoRouterState.of(context).matchedLocation;
    final isSubRoute = location.contains('/analytics/');

    return PopScope(
      canPop: isSubRoute,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) context.go('/');
      },
      child: Scaffold(
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
          onPressed: () {
            if (isSubRoute) {
              context.pop();
            } else {
              context.go('/');
            }
          },
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
              final isMobile = ref.read(currentSiteIsMobileProvider);
              final result = await showDialog<SessionFilterParams>(
                context: context,
                builder: (_) =>
                    _SessionFilterDialog(initial: sessionFilter, isMobile: isMobile),
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
        error: (error, _) => ErrorView(
          message: l10n.failedToLoadSessions,
          detail: formatError(error),
          onRetry: () => ref
              .read(sessionsControllerProvider(widget.siteId).notifier)
              .refresh(),
        ),
        data: (sessionsState) {
          if (sessionsState.sessions.isEmpty) {
            return EmptyState(
              icon: Icons.people_outline,
              title: l10n.noSessionsFound,
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
                return SessionCard(
                  session: session,
                  siteId: widget.siteId,
                );
              },
            ),
          );
        },
      ),
    ),
    );
  }
}
