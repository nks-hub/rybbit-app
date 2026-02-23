import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/models/organization.dart';
import '../../../shared/utils/formatters.dart';
import '../data/organizations_repository.dart';

/// Provider for organizations list.
final _organizationsProvider =
    FutureProvider<List<Organization>>((ref) async {
  final repo = ref.read(organizationsRepositoryProvider);
  return repo.getOrganizations();
});

class OrganizationsScreen extends ConsumerWidget {
  const OrganizationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orgsAsync = ref.watch(_organizationsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Organizations', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: 'Go back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: orgsAsync.when(
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
                Text('Failed to load organizations',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_organizationsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (orgs) {
          if (orgs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.business_outlined,
                      size: 64,
                      color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text('No organizations',
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text('Organizations can be created in the web dashboard',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(_organizationsProvider);
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                  vertical: 8, horizontal: 16),
              itemCount: orgs.length,
              itemBuilder: (context, index) {
                final org = orgs[index];
                return _OrgCard(org: org);
              },
            ),
          );
        },
      ),
    );
  }
}

class _OrgCard extends ConsumerStatefulWidget {
  final Organization org;

  const _OrgCard({required this.org});

  @override
  ConsumerState<_OrgCard> createState() => _OrgCardState();
}

class _OrgCardState extends ConsumerState<_OrgCard> {
  bool _expanded = false;
  List<OrgMember>? _members;
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          InkWell(
            onTap: _toggleExpand,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.colorScheme.primary
                        .withValues(alpha: 0.15),
                    child: Icon(Icons.business,
                        size: 18, color: theme.colorScheme.primary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.org.name,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.org.slug,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const Divider(height: 1),
            if (_loading)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_error!, style: theme.textTheme.bodySmall),
              )
            else if (_members != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  'Members (${_members!.length})',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ..._members!.map((m) => ListTile(
                    dense: true,
                    leading: CircleAvatar(
                      radius: 14,
                      backgroundColor: theme.colorScheme.secondary
                          .withValues(alpha: 0.1),
                      child: Icon(Icons.person,
                          size: 14,
                          color: theme.colorScheme.secondary),
                    ),
                    title: Text(
                      m.name ?? m.email ?? m.userId,
                      style: theme.textTheme.bodyMedium,
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: m.role == 'owner'
                            ? const Color(0xFFF59E0B)
                                .withValues(alpha: 0.15)
                            : theme.colorScheme.primary
                                .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        m.role,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: m.role == 'owner'
                              ? const Color(0xFFF59E0B)
                              : theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  )),
              const SizedBox(height: 8),
            ],
          ],
        ],
      ),
    );
  }

  Future<void> _toggleExpand() async {
    setState(() => _expanded = !_expanded);

    if (_expanded && _members == null && !_loading) {
      setState(() {
        _loading = true;
        _error = null;
      });

      try {
        final repo = ref.read(organizationsRepositoryProvider);
        final members = await repo.getMembers(widget.org.id);
        setState(() {
          _members = members;
          _loading = false;
        });
      } catch (e) {
        setState(() {
          _loading = false;
          _error = 'Failed to load members: $e';
        });
      }
    }
  }
}
