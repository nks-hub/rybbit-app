import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/cache_interceptor.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/paginated_notifier_mixin.dart';
import '../../../core/state/time_range_controller.dart';
import '../data/models.dart';
import '../data/users_repository.dart';

enum UserSortBy {
  lastSeen('last_seen', 'Last Seen'),
  firstSeen('first_seen', 'First Seen'),
  pageviews('pageviews', 'Pageviews'),
  sessions('sessions', 'Sessions'),
  events('events', 'Events');

  const UserSortBy(this.value, this.label);
  final String value;
  final String label;
}

class UserSearchParams {
  final String query;
  final UserSortBy sortBy;
  final bool sortAsc;
  final bool identifiedOnly;

  const UserSearchParams({
    this.query = '',
    this.sortBy = UserSortBy.lastSeen,
    this.sortAsc = false,
    this.identifiedOnly = false,
  });

  UserSearchParams copyWith({
    String? query,
    UserSortBy? sortBy,
    bool? sortAsc,
    bool? identifiedOnly,
  }) {
    return UserSearchParams(
      query: query ?? this.query,
      sortBy: sortBy ?? this.sortBy,
      sortAsc: sortAsc ?? this.sortAsc,
      identifiedOnly: identifiedOnly ?? this.identifiedOnly,
    );
  }

  Map<String, String> toQueryParams() {
    final params = <String, String>{
      'sort_by': sortBy.value,
      'sort_order': sortAsc ? 'asc' : 'desc',
    };
    if (query.isNotEmpty) {
      params['search'] = query;
      params['search_field'] = 'user_id';
    }
    if (identifiedOnly) {
      params['identified_only'] = 'true';
    }
    return params;
  }
}

class UserSearchParamsNotifier extends Notifier<UserSearchParams> {
  @override
  UserSearchParams build() => const UserSearchParams();

  void set(UserSearchParams params) => state = params;
}

final userSearchParamsProvider =
    NotifierProvider<UserSearchParamsNotifier, UserSearchParams>(
        UserSearchParamsNotifier.new);

class UsersState {
  final List<UserListItem> users;
  final int currentPage;
  final int totalCount;
  final bool hasMore;
  final bool isLoadingMore;

  const UsersState({
    this.users = const [],
    this.currentPage = 1,
    this.totalCount = 0,
    this.hasMore = true,
    this.isLoadingMore = false,
  });

  UsersState copyWith({
    List<UserListItem>? users,
    int? currentPage,
    int? totalCount,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return UsersState(
      users: users ?? this.users,
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

class UsersController
    extends AsyncNotifier<UsersState>
    with PaginatedNotifierMixin<UsersState, UserListItem> {
  late final String _siteId;
  static const int _pageSize = 20;
  CancelToken? _cancelToken;

  @override
  int get maxItems => 500;

  @override
  List<UserListItem> getItems(UsersState s) => s.users;

  @override
  PaginationInfo getPaginationInfo(UsersState s) =>
      PaginationInfo(hasMore: s.hasMore, isLoadingMore: s.isLoadingMore);

  @override
  UsersState setLoadingMore(UsersState s, {required bool value}) =>
      s.copyWith(isLoadingMore: value);

  @override
  Future<PageResult<UserListItem>> fetchNextPage(UsersState currentState) async {
    final repo = ref.read(usersRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final searchParams = ref.read(userSearchParamsProvider);
    final nextPage = currentState.currentPage + 1;

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      ...searchParams.toQueryParams(),
    };

    final response = await repo.getUsers(
      _siteId,
      page: nextPage,
      pageSize: _pageSize,
      params: params,
      cancelToken: _cancelToken,
    );

    return _UsersPageResult(
      items: response.users,
      hasMore: response.users.length >= _pageSize,
      nextPage: nextPage,
      totalCount: response.totalCount,
    );
  }

  @override
  UsersState buildNextState(
    UsersState currentState,
    List<UserListItem> trimmedItems,
    PageResult<UserListItem> result,
  ) {
    final r = result as _UsersPageResult;
    return UsersState(
      users: trimmedItems,
      currentPage: r.nextPage,
      totalCount: r.totalCount,
      hasMore: r.hasMore,
    );
  }

  @override
  Future<UsersState> build() async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    ref.watch(userSearchParamsProvider);

    ref.onDispose(() => _cancelToken?.cancel());

    return _loadData(_siteId, page: 1);
  }

  Future<UsersState> _loadData(String siteId, {required int page}) async {
    _cancelToken?.cancel();
    _cancelToken = CancelToken();
    final token = _cancelToken!;

    final repo = ref.read(usersRepositoryProvider);
    final timeRange = ref.read(timeRangeControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final searchParams = ref.read(userSearchParamsProvider);

    final params = {
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
      ...searchParams.toQueryParams(),
    };

    final response = await repo.getUsers(
      siteId,
      page: page,
      pageSize: _pageSize,
      params: params,
      cancelToken: token,
    );

    return UsersState(
      users: response.users,
      currentPage: page,
      totalCount: response.totalCount,
      hasMore: response.users.length >= _pageSize,
    );
  }

  Future<void> refresh() async {
    ref.read(cacheInterceptorProvider).invalidate();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(_siteId, page: 1));
  }
}

final usersControllerProvider = AsyncNotifierProvider.autoDispose
    .family<UsersController, UsersState, String>(
        (arg) => UsersController().._siteId = arg);

class _UsersPageResult extends PageResult<UserListItem> {
  final int nextPage;
  final int totalCount;

  const _UsersPageResult({
    required super.items,
    required super.hasMore,
    required this.nextPage,
    required this.totalCount,
  });
}
