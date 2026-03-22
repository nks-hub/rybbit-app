import 'package:flutter/foundation.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/state/filter_controller.dart';
import '../../../core/state/time_range_controller.dart';
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

final userSearchParamsProvider =
    StateProvider<UserSearchParams>((ref) => const UserSearchParams());

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
    extends AutoDisposeFamilyAsyncNotifier<UsersState, String> {
  static const int _pageSize = 20;
  static const int _maxItems = 500;

  @override
  Future<UsersState> build(String arg) async {
    ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    ref.watch(userSearchParamsProvider);
    return _loadData(arg, page: 1);
  }

  Future<UsersState> _loadData(String siteId, {required int page}) async {
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
    );

    return UsersState(
      users: response.users,
      currentPage: page,
      totalCount: response.totalCount,
      hasMore: response.users.length >= _pageSize,
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
        arg,
        page: nextPage,
        pageSize: _pageSize,
        params: params,
      );

      final combined = [...currentState.users, ...response.users];
      final trimmed = combined.length > _maxItems
          ? combined.sublist(combined.length - _maxItems)
          : combined;
      state = AsyncValue.data(UsersState(
        users: trimmed,
        currentPage: nextPage,
        totalCount: response.totalCount,
        hasMore: response.users.length >= _pageSize,
      ));
    } catch (e) {
      debugPrint('Users loadMore failed: $e');
      state = AsyncValue.data(currentState.copyWith(isLoadingMore: false));
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _loadData(arg, page: 1));
  }
}

final usersControllerProvider = AsyncNotifierProvider.autoDispose.family<
    UsersController, UsersState, String>(UsersController.new);
