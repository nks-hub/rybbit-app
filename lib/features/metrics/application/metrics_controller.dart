import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/cache_interceptor.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/paginated_notifier_mixin.dart';
import '../../../core/state/time_range_controller.dart';
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
    extends AutoDisposeFamilyAsyncNotifier<MetricsState, MetricsKey>
    with PaginatedNotifierMixin<MetricsState, MetricItem, MetricsKey> {
  static const int _pageSize = 20;
  CancelToken? _cancelToken;

  @override
  int get maxItems => 500;

  @override
  List<MetricItem> getItems(MetricsState s) => s.items;

  @override
  PaginationInfo getPaginationInfo(MetricsState s) =>
      PaginationInfo(hasMore: s.hasMore, isLoadingMore: s.isLoadingMore);

  @override
  MetricsState setLoadingMore(MetricsState s, {required bool value}) =>
      s.copyWith(isLoadingMore: value);

  @override
  Future<PageResult<MetricItem>> fetchNextPage(MetricsState currentState) async {
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

    final response = await repo.getMetric(
      arg.siteId,
      arg.parameter,
      params,
      cancelToken: _cancelToken,
    );

    return _MetricsPageResult(
      items: response.data,
      hasMore: response.data.length >= _pageSize,
      nextPage: nextPage,
      totalCount: response.totalCount,
    );
  }

  @override
  MetricsState buildNextState(
    MetricsState currentState,
    List<MetricItem> trimmedItems,
    PageResult<MetricItem> result,
  ) {
    final r = result as _MetricsPageResult;
    return MetricsState(
      items: trimmedItems,
      totalCount: r.totalCount,
      currentPage: r.nextPage,
      hasMore: r.hasMore,
    );
  }

  @override
  Future<MetricsState> build(MetricsKey arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);

    ref.onDispose(() => _cancelToken?.cancel());

    return _loadData(arg, page: 1);
  }

  Future<MetricsState> _loadData(MetricsKey key, {required int page}) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    final token = _cancelToken!;

    final repo = ref.read(analyticsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      'limit': _pageSize.toString(),
      'page': page.toString(),
    };

    final response =
        await repo.getMetric(key.siteId, key.parameter, params, cancelToken: token);

    return MetricsState(
      items: response.data,
      totalCount: response.totalCount,
      currentPage: page,
      hasMore: response.data.length >= _pageSize,
    );
  }

  Future<void> refresh() async {
    ref.read(cacheInterceptorProvider).invalidate();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg, page: 1));
  }
}

final metricsControllerProvider = AsyncNotifierProvider.autoDispose.family<
    MetricsController, MetricsState, MetricsKey>(MetricsController.new);

class _MetricsPageResult extends PageResult<MetricItem> {
  final int nextPage;
  final int totalCount;

  const _MetricsPageResult({
    required super.items,
    required super.hasMore,
    required this.nextPage,
    required this.totalCount,
  });
}
