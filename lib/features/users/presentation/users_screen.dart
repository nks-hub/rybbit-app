import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../application/users_controller.dart';
import '../data/users_repository.dart';

String _localizedSortLabel(AppLocalizations l10n, UserSortBy sortBy) {
  switch (sortBy) {
    case UserSortBy.lastSeen:
      return l10n.lastSeen;
    case UserSortBy.firstSeen:
      return l10n.firstSeen;
    case UserSortBy.pageviews:
      return l10n.pageviews;
    case UserSortBy.sessions:
      return l10n.sessions;
    case UserSortBy.events:
      return l10n.events;
  }
}

class UsersScreen extends ConsumerStatefulWidget {
  final String siteId;

  const UsersScreen({super.key, required this.siteId});

  @override
  ConsumerState<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends ConsumerState<UsersScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    final params = ref.read(userSearchParamsProvider);
    _searchController.text = params.query;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(usersControllerProvider(widget.siteId).notifier)
          .loadMore();
    }
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(userSearchParamsProvider.notifier).state =
          ref.read(userSearchParamsProvider).copyWith(query: value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final usersAsync = ref.watch(usersControllerProvider(widget.siteId));
    final searchParams = ref.watch(userSearchParamsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.users, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          // Sort button
          PopupMenuButton<UserSortBy>(
            tooltip: l10n.sortUsers,
            icon: const Icon(Icons.sort),
            onSelected: (sortBy) {
              final current = ref.read(userSearchParamsProvider);
              if (current.sortBy == sortBy) {
                ref.read(userSearchParamsProvider.notifier).state =
                    current.copyWith(sortAsc: !current.sortAsc);
              } else {
                ref.read(userSearchParamsProvider.notifier).state =
                    current.copyWith(sortBy: sortBy, sortAsc: false);
              }
            },
            itemBuilder: (_) => UserSortBy.values.map((s) {
              final isSelected = searchParams.sortBy == s;
              return PopupMenuItem(
                value: s,
                child: Row(
                  children: [
                    Expanded(child: Text(_localizedSortLabel(l10n, s))),
                    if (isSelected)
                      Icon(
                        searchParams.sortAsc
                            ? Icons.arrow_upward
                            : Icons.arrow_downward,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                  ],
                ),
              );
            }).toList(),
          ),
          // Identified only toggle
          IconButton(
            tooltip: searchParams.identifiedOnly
                ? l10n.showAllUsers
                : l10n.showIdentifiedOnly,
            icon: Icon(
              searchParams.identifiedOnly
                  ? Icons.person
                  : Icons.person_outline,
              color: searchParams.identifiedOnly
                  ? theme.colorScheme.primary
                  : null,
            ),
            onPressed: () {
              ref.read(userSearchParamsProvider.notifier).state =
                  searchParams.copyWith(
                      identifiedOnly: !searchParams.identifiedOnly);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: l10n.searchUsersHint,
                labelText: l10n.searchUsers,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        tooltip: l10n.clearSearch,
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),

          // Content
          Expanded(
            child: usersAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: theme.colorScheme.error),
                      const SizedBox(height: 16),
                      Text(l10n.failedToLoadUsers,
                          style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Text(formatError(error),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(usersControllerProvider(widget.siteId)
                                .notifier)
                            .refresh(),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              data: (usersState) {
                if (usersState.users.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.people_outline,
                            size: 64,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(height: 16),
                        Text(
                          searchParams.query.isNotEmpty
                              ? l10n.noUsersFound
                              : l10n.noIdentifiedUsers,
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          searchParams.query.isNotEmpty
                              ? l10n.tryDifferentSearch
                              : l10n.usersWillAppear,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref
                      .read(
                          usersControllerProvider(widget.siteId).notifier)
                      .refresh(),
                  child: Column(
                    children: [
                      // Total count header
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          children: [
                            Text(
                              l10n.nUsers(formatNumber(usersState.totalCount)),
                              style: theme.textTheme.bodySmall,
                            ),
                            const Spacer(),
                            Text(
                              '${l10n.sortedBy} ${_localizedSortLabel(l10n, searchParams.sortBy)}',
                              style: theme.textTheme.bodySmall
                                  ?.copyWith(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          itemCount: usersState.users.length +
                              (usersState.isLoadingMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index >= usersState.users.length) {
                              return Semantics(
                                label: l10n.loadingMoreUsers,
                                child: const Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2)),
                                ),
                              );
                            }
                            final user = usersState.users[index];
                            return _UserCard(
                              user: user,
                              onTap: () => context.push(
                                '/analytics/${widget.siteId}/users/${Uri.encodeComponent(user.userId)}',
                              ),
                            );
                          },
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
    );
  }
}

class _UserCard extends StatelessWidget {
  final UserListItem user;
  final VoidCallback onTap;

  const _UserCard({required this.user, required this.onTap});

  String _getDisplayName() {
    // Prefer identifiedUserId (set via rybbit.identify)
    if (user.identifiedUserId != null && user.identifiedUserId!.isNotEmpty) {
      return user.identifiedUserId!;
    }
    // Then check traits for human-readable names
    final traits = user.traits;
    if (traits != null) {
      final username = traits['username']?.toString();
      if (username != null && username.isNotEmpty) return username;
      final name = traits['name']?.toString();
      if (name != null && name.isNotEmpty) return name;
      final email = traits['email']?.toString();
      if (email != null && email.isNotEmpty) return email;
    }
    return user.userId.length > 24
        ? '${user.userId.substring(0, 24)}...'
        : user.userId;
  }

  bool get _isIdentified {
    final traits = user.traits;
    return traits != null && traits.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final displayName = _getDisplayName();
    final identified = _isIdentified;

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
                backgroundColor: identified
                    ? const Color(0xFF22C55E).withValues(alpha: 0.15)
                    : theme.colorScheme.primary.withValues(alpha: 0.15),
                child: Icon(
                  identified ? Icons.person : Icons.person_outline,
                  size: 18,
                  color: identified
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
                      displayName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: identified ? const Color(0xFF22C55E) : null,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          l10n.nSessions(user.sessionCount),
                          style: theme.textTheme.bodySmall,
                        ),
                        if (user.lastSeen != null) ...[
                          const SizedBox(width: 8),
                          Text(
                            l10n.lastPrefix(_formatLastSeen(user.lastSeen!)),
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
