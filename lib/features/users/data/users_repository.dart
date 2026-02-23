import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';

class UserListItem {
  final String userId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic>? traits;

  const UserListItem({
    required this.userId,
    required this.sessionCount,
    this.lastSeen,
    this.traits,
  });

  factory UserListItem.fromJson(Map<String, dynamic> json) {
    return UserListItem(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>?,
    );
  }
}

class UserDetail {
  final String userId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic> traits;

  const UserDetail({
    required this.userId,
    required this.sessionCount,
    this.lastSeen,
    this.traits = const {},
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>? ?? {},
    );
  }
}

class UsersPageResponse {
  final List<UserListItem> users;
  final int totalCount;
  final int page;
  final int pageSize;

  const UsersPageResponse({
    this.users = const [],
    this.totalCount = 0,
    this.page = 1,
    this.pageSize = 20,
  });
}

class UsersRepository {
  final Dio _dio;

  UsersRepository(this._dio);

  /// Fetches paginated user list with total count.
  Future<UsersPageResponse> getUsers(
    String siteId, {
    int page = 1,
    int pageSize = 20,
    Map<String, String>? params,
  }) async {
    final queryParams = <String, String>{
      'page': page.toString(),
      'page_size': pageSize.toString(),
      ...?params,
    };

    final response = await _dio.get(
      '/api/sites/$siteId/users',
      queryParameters: queryParams,
    );

    final raw = response.data;
    if (raw is Map<String, dynamic>) {
      final dataList = raw['data'];
      final users = dataList is List
          ? dataList
              .map((e) => UserListItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : <UserListItem>[];
      return UsersPageResponse(
        users: users,
        totalCount: (raw['totalCount'] as num?)?.toInt() ?? users.length,
        page: (raw['page'] as num?)?.toInt() ?? page,
        pageSize: (raw['pageSize'] as num?)?.toInt() ?? pageSize,
      );
    }
    if (raw is List) {
      final users =
          raw.map((e) => UserListItem.fromJson(e as Map<String, dynamic>)).toList();
      return UsersPageResponse(users: users, totalCount: users.length);
    }
    return const UsersPageResponse();
  }

  /// Fetches user detail with traits.
  Future<UserDetail> getUserDetail(String siteId, String userId) async {
    final response = await _dio.get('/api/sites/$siteId/users/$userId');
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return UserDetail.fromJson(data['data'] as Map<String, dynamic>);
      }
      return UserDetail.fromJson(data);
    }
    throw Exception('Invalid user detail response');
  }
}

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UsersRepository(dio);
});
