import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
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

class EventLogController extends FamilyAsyncNotifier<EventLogState, String> {
  static const int _pageSize = 50;

  @override
  Future<EventLogState> build(String arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    return _loadData(arg);
  }

  Future<EventLogState> _loadData(String siteId, {String? beforeTimestamp}) async {
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

    final response = await repo.getRawEvents(siteId, params);

    return EventLogState(
      events: response.data,
      hasMore: response.cursor?.hasMore ?? false,
      oldestTimestamp: response.cursor?.oldestTimestamp,
    );
  }

  Future<void> loadMore() async {
    final currentState = state.valueOrNull;
    if (currentState == null ||
        !currentState.hasMore ||
        currentState.isLoadingMore) {
      return;
    }

    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    try {
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

      final response = await repo.getRawEvents(arg, params);

      state = AsyncValue.data(EventLogState(
        events: [...currentState.events, ...response.data],
        hasMore: response.cursor?.hasMore ?? false,
        oldestTimestamp: response.cursor?.oldestTimestamp,
      ));
    } catch (e) {
      debugPrint('EventLog loadMore failed: $e');
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg));
  }
}

final eventLogControllerProvider = AsyncNotifierProvider.family<
    EventLogController, EventLogState, String>(EventLogController.new);
