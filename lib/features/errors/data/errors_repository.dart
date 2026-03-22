import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import 'models.dart';

class ErrorsRepository {
  final Dio _dio;

  ErrorsRepository(this._dio);

  /// Fetches error names/types with counts.
  Future<List<ErrorNameItem>> getErrorNames(
    String siteId,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/error-names',
      queryParameters: params,
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => ErrorNameItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches detailed error events for a specific error message.
  Future<List<ErrorEventItem>> getErrorEvents(
    String siteId, {
    required String errorMessage,
    int page = 1,
    int limit = 20,
    Map<String, String>? params,
  }) async {
    final queryParams = <String, String>{
      'errorMessage': errorMessage,
      'page': page.toString(),
      'limit': limit.toString(),
      ...?params,
    };

    final response = await _dio.get(
      '/api/sites/$siteId/error-events',
      queryParameters: queryParams,
    );

    final data = response.data;
    // Handle paginated response
    if (data is Map<String, dynamic> && data['data'] is Map<String, dynamic>) {
      final inner = data['data'] as Map<String, dynamic>;
      if (inner['data'] is List) {
        return (inner['data'] as List)
            .map((e) => ErrorEventItem.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    }
    // Handle non-paginated response
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => ErrorEventItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

final errorsRepositoryProvider = Provider<ErrorsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ErrorsRepository(dio);
});
