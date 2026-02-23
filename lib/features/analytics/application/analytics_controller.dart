import 'package:riverpod/riverpod.dart';

import '../../../shared/models/overview.dart';
import '../data/analytics_repository.dart';
import 'filter_controller.dart';
import 'time_range_controller.dart';

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
    extends FamilyAsyncNotifier<AnalyticsState, String> {
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

    // Compute previous period params
    final duration = timeRange.endDate.difference(timeRange.startDate);
    final prevEnd =
        timeRange.startDate.subtract(const Duration(days: 1));
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

    // Load data in parallel
    final results = await Future.wait([
      repo.getOverview(siteId, overviewParams),
      repo.getOverviewBucketed(siteId, bucketedParams),
      repo.getLiveUserCount(siteId),
      repo.getOverview(siteId, prevParams),
      repo.getOverviewBucketed(siteId, prevBucketedParams),
    ]);

    return AnalyticsState(
      overview: results[0] as Overview,
      previousOverview: results[3] as Overview,
      buckets: results[1] as List<OverviewBucket>,
      previousBuckets: results[4] as List<OverviewBucket>,
      liveUserCount: results[2] as int,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }
}

final analyticsControllerProvider = AsyncNotifierProvider.family<
    AnalyticsController, AnalyticsState, String>(AnalyticsController.new);
