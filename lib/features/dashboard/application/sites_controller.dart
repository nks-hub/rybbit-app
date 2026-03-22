import 'dart:async';
import 'dart:math';

import 'package:riverpod/riverpod.dart';

import '../../../shared/models/site.dart';
import '../data/sites_repository.dart';

class OrganizationGroup {
  final String id;
  final String name;
  final List<Site> sites;

  const OrganizationGroup({
    required this.id,
    required this.name,
    required this.sites,
  });
}

class SitesState {
  final List<Site> sites;
  final Map<String, int> liveCounts;
  final List<OrganizationGroup> organizations;

  const SitesState({
    this.sites = const [],
    this.liveCounts = const {},
    this.organizations = const [],
  });

  SitesState copyWith({
    List<Site>? sites,
    Map<String, int>? liveCounts,
    List<OrganizationGroup>? organizations,
  }) {
    return SitesState(
      sites: sites ?? this.sites,
      liveCounts: liveCounts ?? this.liveCounts,
      organizations: organizations ?? this.organizations,
    );
  }
}

class SitesController extends AsyncNotifier<SitesState> {
  @override
  Future<SitesState> build() async {
    return _loadSites();
  }

  Future<SitesState> _loadSites() async {
    final repo = ref.read(sitesRepositoryProvider);
    final organizations = await repo.getOrganizations();
    final sites = repo.parseSitesFromOrganizations(organizations);
    final orgNames = repo.parseOrgNames(organizations);

    // Build organization groups
    final orgGroups = <OrganizationGroup>[];
    final grouped = <String, List<Site>>{};
    for (final site in sites) {
      final orgId = site.organizationId ?? '';
      grouped.putIfAbsent(orgId, () => []).add(site);
    }
    for (final entry in grouped.entries) {
      orgGroups.add(OrganizationGroup(
        id: entry.key,
        name: orgNames[entry.key] ?? 'Default',
        sites: entry.value,
      ));
    }

    return SitesState(sites: sites, organizations: orgGroups);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadSites());
  }

  Future<void> refreshLiveCounts() async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final repo = ref.read(sitesRepositoryProvider);
    final counts = <String, int>{};
    final sites = currentState.sites;

    // Limit concurrency to 4 to avoid overwhelming the server with N requests.
    const maxConcurrent = 4;
    for (var i = 0; i < sites.length; i += maxConcurrent) {
      final batch = sites.sublist(i, min(i + maxConcurrent, sites.length));
      await Future.wait(
        batch.map((site) async {
          final count = await repo.getLiveUserCount(site.siteId.toString());
          counts[site.siteId.toString()] = count;
        }),
      );
    }

    state = AsyncValue.data(currentState.copyWith(liveCounts: counts));
  }
}

final sitesControllerProvider =
    AsyncNotifierProvider<SitesController, SitesState>(SitesController.new);
