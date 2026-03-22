import 'package:riverpod/riverpod.dart';

import '../../../shared/models/overview.dart';
import '../data/analytics_repository.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/time_range_controller.dart';

class AnalyticsState {
  final Overview? overview;
  final Overview? previousOverview;
  final List<OverviewBucket> buckets;
  final List<OverviewBucket> previousBuckets;
  final int liveUserCount;

  const AnalyticsState({
    this.overview,
    this.previousOverview,
    this.buckets = const [],
    this.previousBuckets = const [],
    this.liveUserCount = 0,
  });

  AnalyticsState copyWith({
    Overview? overview,
    Overview? previousOverview,
    List<OverviewBucket>? buckets,
    List<OverviewBucket>? previousBuckets,
    int? liveUserCount,
  }) {
    return AnalyticsState(
      overview: overview ?? this.overview,
      previousOverview: previousOverview ?? this.previousOverview,
      buckets: buckets ?? this.buckets,
      previousBuckets: previousBuckets ?? this.previousBuckets,
      liveUserCount: liveUserCount ?? this.liveUserCount,
    );
  }
}

class AnalyticsController
    extends AutoDisposeFamilyAsyncNotifier<AnalyticsState, String> {
  @override
  Future<AnalyticsState> build(String arg) async {
    // Watch dependencies to auto-rebuild when they change
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);

    return _loadData(arg);
  }

  Future<AnalyticsState> _loadData(String siteId) async {
    final repo = ref.read(analyticsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final baseParams = timeRange.toQueryParams();
    final bucketParams = timeRange.toBucketedQueryParams();
    final filterParams = filterCtrl.toQueryParams();

    final overviewParams = {...baseParams, ...filterParams};
    final bucketedParams = {...bucketParams, ...filterParams};

    // Load current period first (3 requests) for fast initial render.
    final (overview, buckets, liveCount) = await (
      repo.getOverview(siteId, overviewParams),
      repo.getOverviewBucketed(siteId, bucketedParams),
      repo.getLiveUserCount(siteId),
    ).wait;

    final initialState = AnalyticsState(
      overview: overview,
      buckets: buckets,
      liveUserCount: liveCount,
    );

    // Render immediately with primary data; load previous period in background.
    state = AsyncValue.data(initialState);

    // Compute previous period params
    final duration = timeRange.endDate.difference(timeRange.startDate);
    final prevEnd = timeRange.startDate.subtract(const Duration(days: 1));
    final prevStart = prevEnd.subtract(duration);
    final prevTimeRange = timeRange.copyWith(
      startDate: prevStart,
      endDate: prevEnd,
    );
    final prevParams = {...prevTimeRange.toQueryParams(), ...filterParams};
    final prevBucketedParams = {
      ...prevTimeRange.toBucketedQueryParams(),
      ...filterParams,
    };

    try {
      final (prevOverview, prevBuckets) = await (
        repo.getOverview(siteId, prevParams),
        repo.getOverviewBucketed(siteId, prevBucketedParams),
      ).wait;

      // Only update if not superseded by a newer load (ref still alive)
      state = AsyncValue.data(initialState.copyWith(
        previousOverview: prevOverview,
        previousBuckets: prevBuckets,
      ));
    } catch (_) {
      // Previous period data is non-critical; leave it null
    }

    return state.value!;
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }
}

final analyticsControllerProvider = AsyncNotifierProvider.autoDispose.family<
    AnalyticsController, AnalyticsState, String>(AnalyticsController.new);
