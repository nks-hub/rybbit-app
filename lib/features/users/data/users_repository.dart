import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';

class UserListItem {
  final String userId;
  final String? identifiedUserId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic>? traits;
  final String? deviceModel;
  final String? appVersion;

  const UserListItem({
    required this.userId,
    this.identifiedUserId,
    required this.sessionCount,
    this.lastSeen,
    this.traits,
    this.deviceModel,
    this.appVersion,
  });

  factory UserListItem.fromJson(Map<String, dynamic> json) {
    return UserListItem(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      identifiedUserId: json['identified_user_id'] as String? ??
          json['identifiedUserId'] as String?,
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>?,
      deviceModel: json['device_model'] as String?,
      appVersion: json['app_version'] as String?,
    );
  }
}

class UserDetail {
  final String userId;
  final String? identifiedUserId;
  final int sessionCount;
  final String? lastSeen;
  final Map<String, dynamic> traits;
  final String? deviceModel;
  final String? appVersion;

  const UserDetail({
    required this.userId,
    this.identifiedUserId,
    required this.sessionCount,
    this.lastSeen,
    this.traits = const {},
    this.deviceModel,
    this.appVersion,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) {
    return UserDetail(
      userId: json['user_id'] as String? ?? json['userId'] as String? ?? '',
      identifiedUserId: json['identified_user_id'] as String? ??
          json['identifiedUserId'] as String?,
      sessionCount: (json['sessions'] as num?)?.toInt() ??
          (json['session_count'] as num?)?.toInt() ??
          (json['sessionCount'] as num?)?.toInt() ??
          0,
      lastSeen:
          json['last_seen'] as String? ?? json['lastSeen'] as String?,
      traits: json['traits'] as Map<String, dynamic>? ?? {},
      deviceModel: json['device_model'] as String?,
      appVersion: json['app_version'] as String?,
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

  /// Fetches available user trait keys for a site.
  Future<List<TraitKey>> getTraitKeys(String siteId) async {
    final response = await _dio.get('/api/sites/$siteId/user-traits/keys');
    final data = response.data as Map<String, dynamic>;
    final list = data['keys'] as List? ?? [];
    return list
        .map((e) => TraitKey.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetches values for a specific trait key.
  Future<TraitValuesResponse> getTraitValues(
      String siteId, String key) async {
    final response = await _dio.get(
      '/api/sites/$siteId/user-traits/values',
      queryParameters: {'key': key, 'limit': '100'},
    );
    final data = response.data as Map<String, dynamic>;
    return TraitValuesResponse.fromJson(data);
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

class TraitKey {
  final String key;
  final int userCount;

  const TraitKey({required this.key, required this.userCount});

  factory TraitKey.fromJson(Map<String, dynamic> json) {
    return TraitKey(
      key: json['key'] as String? ?? '',
      userCount: (json['userCount'] as num?)?.toInt() ?? 0,
    );
  }
}

class TraitValue {
  final String value;
  final int userCount;

  const TraitValue({required this.value, required this.userCount});

  factory TraitValue.fromJson(Map<String, dynamic> json) {
    return TraitValue(
      value: json['value'] as String? ?? '',
      userCount: (json['userCount'] as num?)?.toInt() ?? 0,
    );
  }
}

class TraitValuesResponse {
  final List<TraitValue> values;
  final int total;
  final bool hasMore;

  const TraitValuesResponse({
    this.values = const [],
    this.total = 0,
    this.hasMore = false,
  });

  factory TraitValuesResponse.fromJson(Map<String, dynamic> json) {
    final list = json['values'] as List? ?? [];
    return TraitValuesResponse(
      values: list
          .map((e) => TraitValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
    );
  }
}

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UsersRepository(dio);
});
