import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../shared/models/site.dart';
import '../../../shared/utils/formatters.dart';
import '../../auth/application/auth_controller.dart';
import '../application/sites_controller.dart';
import 'widgets/site_card.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  Timer? _liveCountTimer;

  @override
  void initState() {
    super.initState();
    // Refresh live counts on load and periodically
    Future.microtask(() {
      ref.read(sitesControllerProvider.notifier).refreshLiveCounts();
    });
    _liveCountTimer = Timer.periodic(
      const Duration(seconds: 30),
      (_) => ref.read(sitesControllerProvider.notifier).refreshLiveCounts(),
    );
  }

  @override
  void dispose() {
    _liveCountTimer?.cancel();
    super.dispose();
  }

  Widget _buildSitesList(
    BuildContext context,
    WidgetRef ref,
    SitesState sitesState,
    ThemeData theme,
  ) {
    final orgs = sitesState.organizations;

    // If only one organization, show flat list without headers
    if (orgs.length <= 1) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: sitesState.sites.length,
        itemBuilder: (context, index) {
          final site = sitesState.sites[index];
          final liveCount =
              sitesState.liveCounts[site.siteId.toString()] ?? 0;
          return SiteCard(
            site: site,
            liveCount: liveCount,
            onTap: () => _onSiteTap(context, ref, site),
          );
        },
      );
    }

    // Multiple organizations: group with headers
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: orgs.fold<int>(
          0, (sum, org) => sum + 1 + org.sites.length),
      itemBuilder: (context, index) {
        // Find which org and site this index corresponds to
        int cursor = 0;
        for (final org in orgs) {
          if (index == cursor) {
            // Organization header
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: Row(
                children: [
                  Icon(Icons.business_outlined,
                      size: 16, color: theme.colorScheme.primary),
                  const SizedBox(width: 8),
                  Text(
                    org.name,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${org.sites.length} ${org.sites.length == 1 ? 'site' : 'sites'}',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }
          cursor++; // header

          final siteIndex = index - cursor;
          if (siteIndex >= 0 && siteIndex < org.sites.length) {
            final site = org.sites[siteIndex];
            final liveCount =
                sitesState.liveCounts[site.siteId.toString()] ?? 0;
            return SiteCard(
              site: site,
              liveCount: liveCount,
              onTap: () => _onSiteTap(context, ref, site),
            );
          }
          cursor += org.sites.length;
        }
        return const SizedBox.shrink();
      },
    );
  }

  void _onSiteTap(BuildContext context, WidgetRef ref, Site site) {
    ref.read(currentSiteIdProvider.notifier).set(site.siteId.toString());
    ref.read(currentSiteDomainProvider.notifier).set(site.domain);
    context.go('/analytics/${site.siteId}');
  }

  @override
  Widget build(BuildContext context) {
    final sitesAsync = ref.watch(sitesControllerProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rybbit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              switch (value) {
                case 'organizations':
                  context.go('/organizations');
                case 'logout':
                  ref.read(authControllerProvider.notifier).logout();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'organizations',
                child: Row(
                  children: [
                    Icon(Icons.business_outlined, size: 20),
                    SizedBox(width: 8),
                    Text('Organizations'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, size: 20),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: sitesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 48,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  'Failed to load sites',
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  formatError(error),
                  style: theme.textTheme.bodySmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(sitesControllerProvider.notifier).refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (sitesState) {
          if (sitesState.sites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.language,
                    size: 64,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No sites found',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a site in the web dashboard to get started.',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(sitesControllerProvider.notifier).refresh();
              await ref
                  .read(sitesControllerProvider.notifier)
                  .refreshLiveCounts();
            },
            child: _buildSitesList(
                context, ref, sitesState, theme),
          );
        },
      ),
    );
  }
}
