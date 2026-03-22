import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/journey.dart';
import '../../../shared/models/metric.dart';
import '../../../shared/models/overview.dart';
import '../../../shared/models/retention.dart';
import '../../../shared/models/session_location.dart';

class AnalyticsRepository {
  final Dio _dio;

  AnalyticsRepository(this._dio);

  /// Fetches overview stats for a site within a time range.
  Future<Overview> getOverview(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/overview',
      queryParameters: params,
      cancelToken: cancelToken,
    );
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'] as Map<String, dynamic>? ?? envelope;
    return Overview.fromJson(data);
  }

  /// Fetches bucketed overview data for charting.
  Future<List<OverviewBucket>> getOverviewBucketed(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/overview-bucketed',
      queryParameters: params,
      cancelToken: cancelToken,
    );
    final raw = response.data;
    // API returns { data: [...] } envelope
    final data = raw is Map<String, dynamic> ? (raw['data'] ?? raw) : raw;
    if (data is List) {
      return data
          .map((e) => OverviewBucket.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches a specific metric breakdown for a site.
  Future<MetricResponse> getMetric(
    String siteId,
    String parameter,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final queryParams = Map<String, String>.from(params);
    queryParams['parameter'] = parameter;
    final response = await _dio.get(
      '/api/sites/$siteId/metric',
      queryParameters: queryParams,
      cancelToken: cancelToken,
    );
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'] as Map<String, dynamic>? ?? envelope;
    return MetricResponse.fromJson(data);
  }

  /// Fetches retention cohort data for a site.
  Future<RetentionData> getRetention(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/retention',
      queryParameters: params,
      cancelToken: cancelToken,
    );
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'] as Map<String, dynamic>? ?? envelope;
    return RetentionData.fromJson(data);
  }

  /// Fetches user journey paths for a site.
  Future<List<JourneyPath>> getJourneys(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/journeys',
      queryParameters: params,
      cancelToken: cancelToken,
    );
    final envelope = response.data as Map<String, dynamic>;
    final list = envelope['journeys'] as List? ?? [];
    return list
        .map((e) => JourneyPath.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetches session locations for a site.
  Future<List<SessionLocation>> getSessionLocations(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/session-locations',
      queryParameters: params,
      cancelToken: cancelToken,
    );
    final envelope = response.data as Map<String, dynamic>;
    final list = envelope['data'] as List? ?? [];
    return list
        .map((e) => SessionLocation.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// Fetches live user count for a site.
  Future<int> getLiveUserCount(String siteId, {CancelToken? cancelToken}) async {
    try {
      final response = await _dio.get(
        '/api/sites/$siteId/live-user-count',
        cancelToken: cancelToken,
      );
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return (data['count'] as num?)?.toInt() ?? 0;
      }
      if (data is int) return data;
      return 0;
    } catch (_) {
      return 0;
    }
  }
}

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AnalyticsRepository(dio);
});
