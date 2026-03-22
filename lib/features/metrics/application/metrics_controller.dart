import 'package:riverpod/riverpod.dart';

import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
import '../../../features/analytics/data/analytics_repository.dart';
import '../../../shared/models/metric.dart';

class MetricsKey {
  final String siteId;
  final String parameter;

  const MetricsKey({required this.siteId, required this.parameter});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MetricsKey &&
          siteId == other.siteId &&
          parameter == other.parameter;

  @override
  int get hashCode => Object.hash(siteId, parameter);
}

class MetricsState {
  final List<MetricItem> items;
  final int totalCount;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const MetricsState({
    this.items = const [],
    this.totalCount = 0,
    this.currentPage = 1,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  MetricsState copyWith({
    List<MetricItem>? items,
    int? totalCount,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MetricsState(
      items: items ?? this.items,
      totalCount: totalCount ?? this.totalCount,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class MetricsController
    extends AutoDisposeFamilyAsyncNotifier<MetricsState, MetricsKey> {
  static const int _pageSize = 20;
  static const int _maxItems = 500;

  @override
  Future<MetricsState> build(MetricsKey arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    return _loadData(arg, page: 1);
  }

  Future<MetricsState> _loadData(MetricsKey key, {required int page}) async {
    final repo = ref.read(analyticsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      'limit': _pageSize.toString(),
      'page': page.toString(),
    };

    final response = await repo.getMetric(key.siteId, key.parameter, params);

    return MetricsState(
      items: response.data,
      totalCount: response.totalCount,
      currentPage: page,
      hasMore: response.data.length >= _pageSize,
    );
  }

  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState == null || !currentState.hasMore || currentState.isLoadingMore) {
      return;
    }

    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(analyticsRepositoryProvider);
      final timeRange = ref.read(timeRangeControllerProvider);
      final filterCtrl = ref.read(filterControllerProvider.notifier);
      final nextPage = currentState.currentPage + 1;

      final params = {
        ...timeRange.toQueryParams(),
        ...filterCtrl.toQueryParams(),
        'limit': _pageSize.toString(),
        'page': nextPage.toString(),
      };

      final response = await repo.getMetric(arg.siteId, arg.parameter, params);

      final combined = [...currentState.items, ...response.data];
      final trimmed = combined.length > _maxItems
          ? combined.sublist(combined.length - _maxItems)
          : combined;
      state = AsyncValue.data(MetricsState(
        items: trimmed,
        totalCount: response.totalCount,
        currentPage: nextPage,
        hasMore: response.data.length >= _pageSize,
      ));
    } catch (e, st) {
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
      // Rethrow so caller can handle if needed
      throw AsyncError(e, st);
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg, page: 1));
  }
}

final metricsControllerProvider = AsyncNotifierProvider.autoDispose.family<
    MetricsController, MetricsState, MetricsKey>(MetricsController.new);
