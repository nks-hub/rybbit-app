import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/state/filter_controller.dart';
import '../../../core/state/time_range_controller.dart';
import '../../../shared/models/session.dart';
import '../data/sessions_repository.dart';

// ── Session Detail Controller ───────────────────────────────────

class SessionDetailViewState {
  final AnalyticsSession session;
  final List<SessionEvent> events;
  final int totalEvents;
  final bool hasMore;
  final bool isLoadingMore;

  const SessionDetailViewState({
    required this.session,
    required this.events,
    this.totalEvents = 0,
    this.hasMore = false,
    this.isLoadingMore = false,
  });

  SessionDetailViewState copyWith({
    AnalyticsSession? session,
    List<SessionEvent>? events,
    int? totalEvents,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SessionDetailViewState(
      session: session ?? this.session,
      events: events ?? this.events,
      totalEvents: totalEvents ?? this.totalEvents,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class SessionDetailController extends AutoDisposeFamilyAsyncNotifier<
    SessionDetailViewState, ({String siteId, String sessionId})> {
  @override
  Future<SessionDetailViewState> build(
      ({String siteId, String sessionId}) arg) async {
    final repo = ref.read(sessionsRepositoryProvider);
    final detail = await repo.getSessionDetail(arg.siteId, arg.sessionId);
    return SessionDetailViewState(
      session: detail.session,
      events: detail.events,
      totalEvents: detail.pagination.total,
      hasMore: detail.pagination.hasMore,
    );
  }

  Future<void> loadMoreEvents() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(sessionsRepositoryProvider);
      final detail = await repo.getSessionDetail(
        arg.siteId,
        arg.sessionId,
        offset: current.events.length,
      );
      final allEvents = [...current.events, ...detail.events];
      state = AsyncValue.data(SessionDetailViewState(
        session: current.session,
        events: allEvents,
        totalEvents: detail.pagination.total,
        hasMore: detail.pagination.hasMore,
      ));
    } catch (e) {
      debugPrint('SessionDetail loadMoreEvents failed: $e');
      state = AsyncValue.data(current.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build(arg));
  }
}

final sessionDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<SessionDetailController, SessionDetailViewState,
        ({String siteId, String sessionId})>(SessionDetailController.new);

// ── Session Filters ─────────────────────────────────────────────

class SessionFilterParams {
  final int? minPageviews;
  final int? minEvents;
  final int? minDuration;

  const SessionFilterParams({this.minPageviews, this.minEvents, this.minDuration});

  Map<String, String> toQueryParams() {
    final params = <String, String>{};
    if (minPageviews != null && minPageviews! > 0) {
      params['min_pageviews'] = minPageviews.toString();
    }
    if (minEvents != null && minEvents! > 0) {
      params['min_events'] = minEvents.toString();
    }
    if (minDuration != null && minDuration! > 0) {
      params['min_duration'] = minDuration.toString();
    }
    return params;
  }

  bool get hasFilters =>
      (minPageviews ?? 0) > 0 ||
      (minEvents ?? 0) > 0 ||
      (minDuration ?? 0) > 0;
}

final sessionFilterProvider =
    StateProvider<SessionFilterParams>((ref) => const SessionFilterParams());

// ── Sessions List Controller ────────────────────────────────────

class SessionsState {
  final List<AnalyticsSession> sessions;
  final int currentPage;
  final bool hasMore;
  final bool isLoadingMore;

  const SessionsState({
    this.sessions = const [],
    this.currentPage = 1,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  SessionsState copyWith({
    List<AnalyticsSession>? sessions,
    int? currentPage,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SessionsState(
      sessions: sessions ?? this.sessions,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class SessionsController
    extends AutoDisposeFamilyAsyncNotifier<SessionsState, String> {
  static const int _pageSize = 20;
  static const int _maxItems = 500;

  @override
  Future<SessionsState> build(String arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    ref.watch(sessionFilterProvider);
    return _loadData(arg, page: 1);
  }

  Future<SessionsState> _loadData(String siteId, {required int page}) async {
    final repo = ref.read(sessionsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final sessionFilter = ref.read(sessionFilterProvider);

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      ...sessionFilter.toQueryParams(),
    };

    final sessions = await repo.getSessions(
      siteId,
      page: page,
      limit: _pageSize,
      params: params,
    );

    return SessionsState(
      sessions: sessions,
      currentPage: page,
      hasMore: sessions.length >= _pageSize,
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
      final repo = ref.read(sessionsRepositoryProvider);
      final timeRange = ref.read(timeRangeControllerProvider);
      final filterCtrl = ref.read(filterControllerProvider.notifier);
      final sessionFilter = ref.read(sessionFilterProvider);
      final nextPage = currentState.currentPage + 1;

      final params = {
        ...timeRange.toQueryParams(),
        ...filterCtrl.toQueryParams(),
        ...sessionFilter.toQueryParams(),
      };

      final sessions = await repo.getSessions(
        arg,
        page: nextPage,
        limit: _pageSize,
        params: params,
      );

      final combined = [...currentState.sessions, ...sessions];
      final trimmed = combined.length > _maxItems
          ? combined.sublist(combined.length - _maxItems)
          : combined;
      state = AsyncValue.data(SessionsState(
        sessions: trimmed,
        currentPage: nextPage,
        hasMore: sessions.length >= _pageSize,
      ));
    } catch (e) {
      debugPrint('Sessions loadMore failed: $e');
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    // Invalidate all cached session details
    ref.invalidate(sessionDetailControllerProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg, page: 1));
  }
}

final sessionsControllerProvider = AsyncNotifierProvider.autoDispose.family<
    SessionsController, SessionsState, String>(SessionsController.new);
