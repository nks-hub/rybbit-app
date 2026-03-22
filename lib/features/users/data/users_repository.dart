import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import 'models.dart';

class UsersRepository {
  final Dio _dio;

  UsersRepository(this._dio);

  /// Fetches paginated user list with total count.
  Future<UsersPageResponse> getUsers(
    String siteId, {
    int page = 1,
    int pageSize = 20,
    Map<String, String>? params,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, String>{
      'page': page.toString(),
      'page_size': pageSize.toString(),
      ...?params,
    };

    final response = await _dio.get(
      '/api/sites/$siteId/users',
      queryParameters: queryParams,
      cancelToken: cancelToken,
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

final usersRepositoryProvider = Provider<UsersRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return UsersRepository(dio);
});
