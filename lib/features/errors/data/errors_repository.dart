import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';

class ErrorNameItem {
  final String value;
  final String errorName;
  final int count;
  final int sessionCount;
  final double percentage;

  const ErrorNameItem({
    required this.value,
    required this.errorName,
    required this.count,
    required this.sessionCount,
    required this.percentage,
  });

  factory ErrorNameItem.fromJson(Map<String, dynamic> json) {
    return ErrorNameItem(
      value: json['value'] as String? ?? '',
      errorName: json['errorName'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class ErrorEventItem {
  final String timestamp;
  final String? sessionId;
  final String? pathname;
  final String? hostname;
  final String? pageTitle;
  final String? browser;
  final String? browserVersion;
  final String? operatingSystem;
  final String? deviceType;
  final String? country;
  final String? city;
  final String message;
  final String? stack;

  const ErrorEventItem({
    required this.timestamp,
    this.sessionId,
    this.pathname,
    this.hostname,
    this.pageTitle,
    this.browser,
    this.browserVersion,
    this.operatingSystem,
    this.deviceType,
    this.country,
    this.city,
    required this.message,
    this.stack,
  });

  factory ErrorEventItem.fromJson(Map<String, dynamic> json) {
    return ErrorEventItem(
      timestamp: json['timestamp'] as String? ?? '',
      sessionId: json['session_id'] as String?,
      pathname: json['pathname'] as String?,
      hostname: json['hostname'] as String?,
      pageTitle: json['page_title'] as String?,
      browser: json['browser'] as String?,
      browserVersion: json['browser_version'] as String?,
      operatingSystem: json['operating_system'] as String?,
      deviceType: json['device_type'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      message: json['message'] as String? ?? '',
      stack: json['stack'] as String?,
    );
  }
}

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
