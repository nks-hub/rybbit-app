import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../data/replay_repository.dart';

/// Provider for the replay list, keyed by (siteId, page).
final replayListProvider = FutureProvider.family<ReplayListResult,
    ({String siteId, int page})>((ref, args) async {
  final repo = ref.read(replayRepositoryProvider);
  const limit = 20;
  final offset = (args.page - 1) * limit;
  return repo.getReplayList(args.siteId, offset: offset, limit: limit);
});

class ReplayListScreen extends ConsumerStatefulWidget {
  final String siteId;

  const ReplayListScreen({super.key, required this.siteId});

  @override
  ConsumerState<ReplayListScreen> createState() => _ReplayListScreenState();
}

class _ReplayListScreenState extends ConsumerState<ReplayListScreen> {
  int _currentPage = 1;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final replayAsync = ref.watch(
      replayListProvider((siteId: widget.siteId, page: _currentPage)),
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.sessionReplays, style: const TextStyle(fontSize: 18)),
      ),
      body: replayAsync.when(
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
                Text(l10n.failedToLoadReplays,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    replayListProvider(
                        (siteId: widget.siteId, page: _currentPage)),
                  ),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (result) {
          if (result.sessions.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.videocam_off_outlined,
                      size: 48, color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text(l10n.noReplaysFound, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(
                    l10n.noReplaysHint,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(replayListProvider(
                        (siteId: widget.siteId, page: _currentPage)));
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    itemCount: result.sessions.length,
                    itemBuilder: (context, index) {
                      final session = result.sessions[index];
                      return _ReplaySessionCard(
                        session: session,
                        onTap: () => context.push(
                          '/analytics/${widget.siteId}/replay/${session.sessionId}',
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Pagination controls
              if (_currentPage > 1 || result.hasMore)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        tooltip: l10n.previousPage,
                        icon: const Icon(Icons.chevron_left),
                        onPressed: _currentPage > 1
                            ? () => setState(() => _currentPage--)
                            : null,
                      ),
                      Text(
                        l10n.pageNumber(_currentPage),
                        style: theme.textTheme.bodyMedium,
                      ),
                      IconButton(
                        tooltip: l10n.nextPage,
                        icon: const Icon(Icons.chevron_right),
                        onPressed: result.hasMore
                            ? () => setState(() => _currentPage++)
                            : null,
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ReplaySessionCard extends StatelessWidget {
  final ReplaySession session;
  final VoidCallback onTap;

  const _ReplaySessionCard({required this.session, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final flag = countryToFlag(session.country);
    final duration = formatDuration(session.sessionDuration);

    final dt = DateTime.tryParse(session.sessionStart ?? '');
    final dateStr =
        dt != null ? DateFormat('MMM d, HH:mm').format(dt) : l10n.unknown;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                // Replay icon
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.videocam_outlined,
                    size: 22,
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (flag.isNotEmpty) ...[
                            Text(flag,
                                style: const TextStyle(fontSize: 14),
                                semanticsLabel: session.country ?? l10n.unknownCountry),
                            const SizedBox(width: 6),
                          ],
                          Expanded(
                            child: Text(
                              session.browser ?? l10n.unknownBrowser,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            dateStr,
                            style: theme.textTheme.bodySmall
                                ?.copyWith(fontSize: 11),
                          ),
                          const SizedBox(width: 8),
                          if (session.entryPage != null) ...[
                            Icon(Icons.login,
                                size: 12,
                                color: theme.textTheme.bodySmall?.color),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Text(
                                session.entryPage!,
                                style: theme.textTheme.bodySmall
                                    ?.copyWith(fontSize: 11),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
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
                      l10n.nPages(session.pageviews),
                      style:
                          theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
