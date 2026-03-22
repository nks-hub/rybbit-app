import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/cache_interceptor.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/paginated_notifier_mixin.dart';
import '../../../core/state/time_range_controller.dart';
import '../../../shared/models/event.dart';
import '../data/events_repository.dart';

class EventLogState {
  final List<RawEvent> events;
  final bool hasMore;
  final String? oldestTimestamp;
  final bool isLoadingMore;

  const EventLogState({
    this.events = const [],
    this.hasMore = true,
    this.oldestTimestamp,
    this.isLoadingMore = false,
  });

  EventLogState copyWith({
    List<RawEvent>? events,
    bool? hasMore,
    String? oldestTimestamp,
    bool? isLoadingMore,
  }) {
    return EventLogState(
      events: events ?? this.events,
      hasMore: hasMore ?? this.hasMore,
      oldestTimestamp: oldestTimestamp ?? this.oldestTimestamp,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class EventLogController
    extends AsyncNotifier<EventLogState>
    with PaginatedNotifierMixin<EventLogState, RawEvent> {
  late final String _siteId;
  static const int _pageSize = 50;
  CancelToken? _cancelToken;

  @override
  int get maxItems => 500;

  @override
  List<RawEvent> getItems(EventLogState s) => s.events;

  @override
  PaginationInfo getPaginationInfo(EventLogState s) =>
      PaginationInfo(hasMore: s.hasMore, isLoadingMore: s.isLoadingMore);

  @override
  EventLogState setLoadingMore(EventLogState s, {required bool value}) =>
      s.copyWith(isLoadingMore: value);

  @override
  Future<PageResult<RawEvent>> fetchNextPage(EventLogState currentState) async {
    final repo = ref.read(eventsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final params = <String, String>{
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      'page_size': _pageSize.toString(),
    };

    if (currentState.oldestTimestamp != null) {
      params['before_timestamp'] = currentState.oldestTimestamp!;
    }

    final response =
        await repo.getRawEvents(_siteId, params, cancelToken: _cancelToken);

    return _EventLogPageResult(
      items: response.data,
      hasMore: response.cursor?.hasMore ?? false,
      oldestTimestamp: response.cursor?.oldestTimestamp,
    );
  }

  @override
  EventLogState buildNextState(
    EventLogState currentState,
    List<RawEvent> trimmedItems,
    PageResult<RawEvent> result,
  ) {
    final r = result as _EventLogPageResult;
    return EventLogState(
      events: trimmedItems,
      hasMore: r.hasMore,
      oldestTimestamp: r.oldestTimestamp,
    );
  }

  @override
  Future<EventLogState> build() async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);

    ref.onDispose(() => _cancelToken?.cancel());

    return _loadData(_siteId);
  }

  Future<EventLogState> _loadData(String siteId,
      {String? beforeTimestamp}) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    final token = _cancelToken!;

    final repo = ref.read(eventsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final params = <String, String>{
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      'page_size': _pageSize.toString(),
    };

    if (beforeTimestamp != null) {
      params['before_timestamp'] = beforeTimestamp;
    }

    final response = await repo.getRawEvents(siteId, params, cancelToken: token);

    return EventLogState(
      events: response.data,
      hasMore: response.cursor?.hasMore ?? false,
      oldestTimestamp: response.cursor?.oldestTimestamp,
    );
  }

  Future<void> refresh() async {
    ref.read(cacheInterceptorProvider).invalidate();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(_siteId));
  }
}

final eventLogControllerProvider = AsyncNotifierProvider.autoDispose
    .family<EventLogController, EventLogState, String>(
        (arg) => EventLogController().._siteId = arg);

class _EventLogPageResult extends PageResult<RawEvent> {
  final String? oldestTimestamp;

  const _EventLogPageResult({
    required super.items,
    required super.hasMore,
    this.oldestTimestamp,
  });
}
