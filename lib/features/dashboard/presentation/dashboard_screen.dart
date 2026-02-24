import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/site.dart';
import '../../../shared/utils/formatters.dart';
import '../../auth/application/auth_controller.dart';
import '../application/sites_controller.dart';
import '../application/sparkline_provider.dart';
import 'widgets/site_card.dart';

enum _SortMode { alphabetical, visitors, liveUsers, organization }

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  Timer? _liveCountTimer;
  String _searchQuery = '';
  _SortMode _sortMode = _SortMode.visitors;
  bool _showSearch = false;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
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
    _searchController.dispose();
    super.dispose();
  }

  List<Site> _filterAndSort(SitesState sitesState) {
    var sites = List<Site>.from(sitesState.sites);

    // Filter
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      sites = sites
          .where((s) =>
              s.domain.toLowerCase().contains(q) ||
              s.name.toLowerCase().contains(q))
          .toList();
    }

    // Sort
    switch (_sortMode) {
      case _SortMode.alphabetical:
        sites.sort(
            (a, b) => a.domain.toLowerCase().compareTo(b.domain.toLowerCase()));
      case _SortMode.visitors:
        sites.sort((a, b) {
          final aUsers =
              ref.read(todayUsersProvider(a.siteId.toString())).valueOrNull ?? 0;
          final bUsers =
              ref.read(todayUsersProvider(b.siteId.toString())).valueOrNull ?? 0;
          return bUsers.compareTo(aUsers);
        });
      case _SortMode.liveUsers:
        sites.sort((a, b) {
          final aLive =
              sitesState.liveCounts[a.siteId.toString()] ?? 0;
          final bLive =
              sitesState.liveCounts[b.siteId.toString()] ?? 0;
          return bLive.compareTo(aLive);
        });
      case _SortMode.organization:
        sites.sort((a, b) {
          final aOrg = a.organizationId ?? '';
          final bOrg = b.organizationId ?? '';
          final cmp = aOrg.compareTo(bOrg);
          if (cmp != 0) return cmp;
          return a.domain.toLowerCase().compareTo(b.domain.toLowerCase());
        });
    }

    return sites;
  }

  Widget _buildSitesContent(
    BuildContext context,
    WidgetRef ref,
    SitesState sitesState,
    ThemeData theme,
  ) {
    final sites = _filterAndSort(sitesState);
    final l10n = AppLocalizations.of(context)!;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (sites.isEmpty && _searchQuery.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off,
                size: 48, color: theme.textTheme.bodySmall?.color),
            const SizedBox(height: 16),
            Text(l10n.noMatchingSites, style: theme.textTheme.bodyLarge),
          ],
        ),
      );
    }

    if (isLandscape) {
      return _buildGrid(context, ref, sites, sitesState, theme);
    }
    return _buildList(context, ref, sites, sitesState, theme);
  }

  Widget _buildGrid(
    BuildContext context,
    WidgetRef ref,
    List<Site> sites,
    SitesState sitesState,
    ThemeData theme,
  ) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 600 ? 3 : 2;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 2.4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: sites.length,
      itemBuilder: (context, index) {
        final site = sites[index];
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

  Widget _buildList(
    BuildContext context,
    WidgetRef ref,
    List<Site> sites,
    SitesState sitesState,
    ThemeData theme,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: sites.length,
      itemBuilder: (context, index) {
        final site = sites[index];
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

  void _onSiteTap(BuildContext context, WidgetRef ref, Site site) {
    ref.read(currentSiteIdProvider.notifier).set(site.siteId.toString());
    ref.read(currentSiteDomainProvider.notifier).set(site.domain);
    context.go('/analytics/${site.siteId}');
  }

  @override
  Widget build(BuildContext context) {
    final sitesAsync = ref.watch(sitesControllerProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: l10n.searchSites,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ),
                style: theme.textTheme.bodyLarge,
                onChanged: (v) => setState(() => _searchQuery = v),
              )
            : Image.asset(
                'assets/rybbit_horizontal_white.png',
                height: 24,
                fit: BoxFit.contain,
              ),
        actions: [
          // Search toggle
          IconButton(
            tooltip: _showSearch ? l10n.close : l10n.searchSites,
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchQuery = '';
                  _searchController.clear();
                }
              });
            },
          ),
          // Sort menu
          PopupMenuButton<_SortMode>(
            tooltip: l10n.sortSites,
            icon: const Icon(Icons.sort),
            onSelected: (mode) => setState(() => _sortMode = mode),
            itemBuilder: (context) => [
              _sortMenuItem(
                _SortMode.visitors,
                Icons.people_outline,
                l10n.sortByVisitors,
              ),
              _sortMenuItem(
                _SortMode.liveUsers,
                Icons.circle,
                l10n.sortByLiveUsers,
              ),
              _sortMenuItem(
                _SortMode.alphabetical,
                Icons.sort_by_alpha,
                l10n.sortAlphabetically,
              ),
              _sortMenuItem(
                _SortMode.organization,
                Icons.business_outlined,
                l10n.organizations,
              ),
            ],
          ),
          // Overflow menu
          PopupMenuButton<String>(
            tooltip: l10n.more,
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
              PopupMenuItem(
                value: 'organizations',
                child: Row(
                  children: [
                    const Icon(Icons.business_outlined, size: 20),
                    const SizedBox(width: 8),
                    Text(l10n.organizations),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    const Icon(Icons.logout, size: 20),
                    const SizedBox(width: 8),
                    Text(l10n.logout),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: sitesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Semantics(liveRegion: true, child: Center(
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
                  l10n.failedToLoadSites,
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
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        )),
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
                    l10n.noSitesFound,
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.noSitesHint,
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
            child: _buildSitesContent(
                context, ref, sitesState, theme),
          );
        },
      ),
    );
  }

  PopupMenuItem<_SortMode> _sortMenuItem(
    _SortMode mode,
    IconData icon,
    String label,
  ) {
    final isActive = _sortMode == mode;
    return PopupMenuItem(
      value: mode,
      child: Row(
        children: [
          Icon(icon, size: 20,
              color: isActive ? Theme.of(context).colorScheme.primary : null),
          const SizedBox(width: 8),
          Text(
            label,
            style: isActive
                ? TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  )
                : null,
          ),
          if (isActive) ...[
            const Spacer(),
            Icon(Icons.check,
                size: 18, color: Theme.of(context).colorScheme.primary),
          ],
        ],
      ),
    );
  }
}
