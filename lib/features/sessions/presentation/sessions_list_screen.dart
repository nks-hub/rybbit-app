import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../shared/models/session.dart';
import '../../../shared/utils/formatters.dart';
import '../application/sessions_controller.dart';

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
    return AlertDialog(
      title: const Text('Session Filters'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _pageviewsCtrl,
              decoration: const InputDecoration(labelText: 'Min Pageviews'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _eventsCtrl,
              decoration: const InputDecoration(labelText: 'Min Events'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _durationCtrl,
              decoration:
                  const InputDecoration(labelText: 'Min Duration (seconds)'),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context,
              const SessionFilterParams()),
          child: const Text('Clear'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
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
          child: const Text('Apply'),
        ),
      ],
    );
  }
}

/// Maps ISO 3166-1 alpha-2 country codes to flag emojis.
String countryToFlag(String? countryCode) {
  if (countryCode == null || countryCode.length != 2) return '';
  final code = countryCode.toUpperCase();
  final firstChar = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final secondChar = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCodes([firstChar, secondChar]);
}

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
            const Text('Sessions', style: TextStyle(fontSize: 18)),
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
        actions: [
          IconButton(
            tooltip: 'Filter sessions',
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
                Text('Failed to load sessions',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref
                      .read(
                          sessionsControllerProvider(widget.siteId).notifier)
                      .refresh(),
                  child: const Text('Retry'),
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
                  Text('No sessions found',
                      style: theme.textTheme.bodyLarge),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => ref
                .read(sessionsControllerProvider(widget.siteId).notifier)
                .refresh(),
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: sessionsState.sessions.length +
                  (sessionsState.isLoadingMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index >= sessionsState.sessions.length) {
                  return Semantics(
                    label: 'Loading more sessions',
                    child: const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                          child: CircularProgressIndicator(strokeWidth: 2)),
                    ),
                  );
                }

                final session = sessionsState.sessions[index];
                return _SessionCard(
                  session: session,
                  onTap: () => context.push(
                    '/sessions/${widget.siteId}/${session.sessionId}',
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  final AnalyticsSession session;
  final VoidCallback onTap;

  const _SessionCard({required this.session, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final flag = countryToFlag(session.country);
    final duration = formatDuration(session.sessionDuration);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top row: country flag + browser + device + duration
                Row(
                  children: [
                    if (flag.isNotEmpty) ...[
                      Text(flag,
                          style: const TextStyle(fontSize: 18),
                          semanticsLabel: session.country ?? 'Unknown country'),
                      const SizedBox(width: 8),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              if (session.browser != null &&
                                  session.browser!.isNotEmpty) ...[
                                Flexible(
                                  child: Text(
                                    session.browser!,
                                    style: theme.textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                              if (session.deviceType != null &&
                                  session.deviceType!.isNotEmpty) ...[
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.primary
                                        .withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    session.deviceType!,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: theme.colorScheme.primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          duration,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          '${session.pageviews} pages',
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Entry page
                if (session.entryPage != null &&
                    session.entryPage!.isNotEmpty) ...[
                  Semantics(
                    label: 'Entry page: ${session.entryPage}',
                    excludeSemantics: true,
                    child: Row(
                      children: [
                        Icon(Icons.login,
                            size: 14,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            session.entryPage!,
                            style:
                                theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
