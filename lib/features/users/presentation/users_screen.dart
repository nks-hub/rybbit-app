import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../data/users_repository.dart';

/// Provider for paginated user list.
final _usersProvider =
    FutureProvider.family<List<UserListItem>, String>((ref, siteId) async {
  final repo = ref.read(usersRepositoryProvider);
  return repo.getUsers(siteId);
});

class UsersScreen extends ConsumerWidget {
  final String siteId;

  const UsersScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(_usersProvider(siteId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: usersAsync.when(
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
                Text('Failed to load users',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(_usersProvider(siteId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.people_outline,
                      size: 64, color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text('No identified users',
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text('Users will appear once they are identified',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(_usersProvider(siteId));
            },
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return _UserCard(
                  user: user,
                  onTap: () => context.push(
                    '/sites/$siteId/users/${Uri.encodeComponent(user.userId)}',
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

class _UserCard extends StatelessWidget {
  final UserListItem user;
  final VoidCallback onTap;

  const _UserCard({required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayId = user.userId.length > 24
        ? '${user.userId.substring(0, 24)}...'
        : user.userId;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor:
                    theme.colorScheme.primary.withValues(alpha: 0.15),
                child: Icon(Icons.person_outline,
                    size: 18, color: theme.colorScheme.primary),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayId,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          '${user.sessionCount} sessions',
                          style: theme.textTheme.bodySmall,
                        ),
                        if (user.lastSeen != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            'Last: ${_formatLastSeen(user.lastSeen!)}',
                            style: theme.textTheme.bodySmall,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  String _formatLastSeen(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
      if (diff.inHours < 24) return '${diff.inHours}h ago';
      if (diff.inDays < 7) return '${diff.inDays}d ago';
      return '${date.month}/${date.day}/${date.year}';
    } catch (_) {
      return dateStr;
    }
  }
}
