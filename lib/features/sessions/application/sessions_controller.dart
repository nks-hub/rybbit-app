import 'package:riverpod/riverpod.dart';

import '../../../features/analytics/application/filter_controller.dart';
import '../../../features/analytics/application/time_range_controller.dart';
import '../../../shared/models/session.dart';
import '../data/sessions_repository.dart';

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

class SessionsController extends FamilyAsyncNotifier<SessionsState, String> {
  static const int _pageSize = 20;

  @override
  Future<SessionsState> build(String arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    return _loadData(arg, page: 1);
  }

  Future<SessionsState> _loadData(String siteId, {required int page}) async {
    final repo = ref.read(sessionsRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
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
      final nextPage = currentState.currentPage + 1;

      final params = {
        ...timeRange.toQueryParams(),
        ...filterCtrl.toQueryParams(),
      };

      final sessions = await repo.getSessions(
        arg,
        page: nextPage,
        limit: _pageSize,
        params: params,
      );

      state = AsyncValue.data(SessionsState(
        sessions: [...currentState.sessions, ...sessions],
        currentPage: nextPage,
        hasMore: sessions.length >= _pageSize,
      ));
    } catch (_) {
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg, page: 1));
  }
}

final sessionsControllerProvider = AsyncNotifierProvider.family<
    SessionsController, SessionsState, String>(SessionsController.new);
