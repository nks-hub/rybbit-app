import 'dart:async';

import 'package:riverpod/riverpod.dart';

import '../../../shared/models/site.dart';
import '../data/sites_repository.dart';

class SitesState {
  final List<Site> sites;
  final Map<String, int> liveCounts;

  const SitesState({
    this.sites = const [],
    this.liveCounts = const {},
  });

  SitesState copyWith({
    List<Site>? sites,
    Map<String, int>? liveCounts,
  }) {
    return SitesState(
      sites: sites ?? this.sites,
      liveCounts: liveCounts ?? this.liveCounts,
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
    return SitesState(sites: sites);
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

    await Future.wait(
      currentState.sites.map((site) async {
        final count = await repo.getLiveUserCount(site.siteId.toString());
        counts[site.siteId.toString()] = count;
      }),
    );

    state = AsyncValue.data(currentState.copyWith(liveCounts: counts));
  }
}

final sitesControllerProvider =
    AsyncNotifierProvider<SitesController, SitesState>(SitesController.new);
