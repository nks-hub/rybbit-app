import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../data/users_repository.dart';

/// Provider for user detail, keyed by "siteId:userId".
final _userDetailProvider =
    FutureProvider.family<UserDetail, String>((ref, key) async {
  final parts = key.split(':');
  final siteId = parts[0];
  final userId = parts.sublist(1).join(':');

  final repo = ref.read(usersRepositoryProvider);
  return repo.getUserDetail(siteId, userId);
});

String _getDisplayName(UserDetail detail) {
  // Prefer identifiedUserId (set via rybbit.identify)
  if (detail.identifiedUserId != null && detail.identifiedUserId!.isNotEmpty) {
    return detail.identifiedUserId!;
  }
  // Then check traits for human-readable names
  final traits = detail.traits;
  if (traits.isNotEmpty) {
    final username = traits['username']?.toString();
    if (username != null && username.isNotEmpty) return username;
    final name = traits['name']?.toString();
    if (name != null && name.isNotEmpty) return name;
    final email = traits['email']?.toString();
    if (email != null && email.isNotEmpty) return email;
  }
  return detail.userId.length > 24
      ? '${detail.userId.substring(0, 24)}...'
      : detail.userId;
}

class UserDetailScreen extends ConsumerWidget {
  final String siteId;
  final String userId;

  const UserDetailScreen({
    super.key,
    required this.siteId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(_userDetailProvider('$siteId:$userId'));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          detailAsync.whenOrNull(
                data: (d) => _getDisplayName(d),
              ) ??
              (userId.length > 20
                  ? '${userId.substring(0, 20)}...'
                  : userId),
          style: const TextStyle(fontSize: 18),
        ),
        leading: IconButton(
          tooltip: l10n.goBack,
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
                Text(l10n.failedToLoadUserDetails,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_userDetailProvider('$siteId:$userId')),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (detail) => RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(_userDetailProvider('$siteId:$userId'));
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: detail.traits.isNotEmpty
                                  ? const Color(0xFF22C55E)
                                      .withValues(alpha: 0.15)
                                  : theme.colorScheme.primary
                                      .withValues(alpha: 0.15),
                              child: Icon(
                                detail.traits.isNotEmpty
                                    ? Icons.person
                                    : Icons.person_outline,
                                size: 24,
                                color: detail.traits.isNotEmpty
                                    ? const Color(0xFF22C55E)
                                    : theme.colorScheme.primary,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _getDisplayName(detail),
                                    style:
                                        theme.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  if (_getDisplayName(detail) !=
                                      detail.userId) ...[
                                    const SizedBox(height: 2),
                                    Text(
                                      detail.userId.length > 32
                                          ? '${detail.userId.substring(0, 32)}...'
                                          : detail.userId,
                                      style: theme.textTheme.bodySmall
                                          ?.copyWith(fontSize: 11),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                  const SizedBox(height: 4),
                                  Text(
                                    l10n.nSessions(detail.sessionCount),
                                    style: theme.textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        if (detail.lastSeen != null) ...[
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 16,
                                  color: theme.textTheme.bodySmall?.color),
                              const SizedBox(width: 6),
                              Text(
                                l10n.lastSeenPrefix(detail.lastSeen!),
                                style: theme.textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Text(
                  l10n.traits,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                if (detail.traits.isEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          l10n.noTraits,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                  )
                else
                  Card(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: detail.traits.length,
                      separatorBuilder: (_, _) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final entry =
                            detail.traits.entries.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  entry.key,
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  entry.value?.toString() ?? 'null',
                                  style: theme.textTheme.bodyMedium,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
