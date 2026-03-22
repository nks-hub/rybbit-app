import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/cache_interceptor.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/paginated_notifier_mixin.dart';
import '../../../core/state/time_range_controller.dart';
import '../../../shared/models/session.dart';
import '../data/models.dart';
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

class SessionDetailController
    extends AsyncNotifier<SessionDetailViewState> {
  late final ({String siteId, String sessionId}) _arg;

  @override
  Future<SessionDetailViewState> build() async {
    final repo = ref.read(sessionsRepositoryProvider);
    final detail = await repo.getSessionDetail(_arg.siteId, _arg.sessionId);
    return SessionDetailViewState(
      session: detail.session,
      events: detail.events,
      totalEvents: detail.pagination.total,
      hasMore: detail.pagination.hasMore,
    );
  }

  Future<void> loadMoreEvents() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    try {
      final repo = ref.read(sessionsRepositoryProvider);
      final detail = await repo.getSessionDetail(
        _arg.siteId,
        _arg.sessionId,
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
    state = await AsyncValue.guard(() => build());
  }
}

final sessionDetailControllerProvider = AsyncNotifierProvider.autoDispose
    .family<SessionDetailController, SessionDetailViewState,
        ({String siteId, String sessionId})>(
        (arg) => SessionDetailController().._arg = arg);

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

class SessionFilterNotifier extends Notifier<SessionFilterParams> {
  @override
  SessionFilterParams build() => const SessionFilterParams();

  void set(SessionFilterParams params) => state = params;
}

final sessionFilterProvider =
    NotifierProvider<SessionFilterNotifier, SessionFilterParams>(
        SessionFilterNotifier.new);

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
    extends AsyncNotifier<SessionsState>
    with PaginatedNotifierMixin<SessionsState, AnalyticsSession> {
  late final String _siteId;
  static const int _pageSize = 20;
  CancelToken? _cancelToken;

  @override
  int get maxItems => 500;

  @override
  List<AnalyticsSession> getItems(SessionsState s) => s.sessions;

  @override
  PaginationInfo getPaginationInfo(SessionsState s) =>
      PaginationInfo(hasMore: s.hasMore, isLoadingMore: s.isLoadingMore);

  @override
  SessionsState setLoadingMore(SessionsState s, {required bool value}) =>
      s.copyWith(isLoadingMore: value);

  @override
  Future<PageResult<AnalyticsSession>> fetchNextPage(
      SessionsState currentState) async {
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
      _siteId,
      page: nextPage,
      limit: _pageSize,
      params: params,
      cancelToken: _cancelToken,
    );

    return _SessionsPageResult(
      items: sessions,
      hasMore: sessions.length >= _pageSize,
      nextPage: nextPage,
    );
  }

  @override
  SessionsState buildNextState(
    SessionsState currentState,
    List<AnalyticsSession> trimmedItems,
    PageResult<AnalyticsSession> result,
  ) {
    final r = result as _SessionsPageResult;
    return SessionsState(
      sessions: trimmedItems,
      currentPage: r.nextPage,
      hasMore: r.hasMore,
    );
  }

  @override
  Future<SessionsState> build() async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    ref.watch(sessionFilterProvider);

    ref.onDispose(() => _cancelToken?.cancel());

    return _loadData(_siteId, page: 1);
  }

  Future<SessionsState> _loadData(String siteId, {required int page}) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    final token = _cancelToken!;

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
      cancelToken: token,
    );

    return SessionsState(
      sessions: sessions,
      currentPage: page,
      hasMore: sessions.length >= _pageSize,
    );
  }

  Future<void> refresh() async {
    ref.read(cacheInterceptorProvider).invalidate();
    // Invalidate all cached session details
    ref.invalidate(sessionDetailControllerProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(_siteId, page: 1));
  }
}

final sessionsControllerProvider = AsyncNotifierProvider.autoDispose
    .family<SessionsController, SessionsState, String>(
        (arg) => SessionsController().._siteId = arg);

class _SessionsPageResult extends PageResult<AnalyticsSession> {
  final int nextPage;

  const _SessionsPageResult({
    required super.items,
    required super.hasMore,
    required this.nextPage,
  });
}
