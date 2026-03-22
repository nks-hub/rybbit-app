import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/session.dart';
import 'models.dart';

class SessionsRepository {
  final Dio _dio;

  SessionsRepository(this._dio);

  /// Fetches paginated session list for a site.
  Future<List<AnalyticsSession>> getSessions(
    String siteId, {
    int page = 1,
    int limit = 20,
    Map<String, String>? params,
    CancelToken? cancelToken,
  }) async {
    final queryParams = <String, String>{
      'page': page.toString(),
      'limit': limit.toString(),
      ...?params,
    };

    final response = await _dio.get(
      '/api/sites/$siteId/sessions',
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => AnalyticsSession.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches full session detail with events.
  Future<SessionDetail> getSessionDetail(
    String siteId,
    String sessionId, {
    int offset = 0,
    int limit = 100,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/sessions/$sessionId',
      queryParameters: {
        'offset': offset.toString(),
        'limit': limit.toString(),
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is Map<String, dynamic>) {
      return SessionDetail.fromJson(data['data'] as Map<String, dynamic>);
    }
    throw Exception('Invalid session detail response');
  }
}

final sessionsRepositoryProvider = Provider<SessionsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SessionsRepository(dio);
});
