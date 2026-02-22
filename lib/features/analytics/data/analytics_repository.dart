import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/metric.dart';
import '../../../shared/models/overview.dart';

class AnalyticsRepository {
  final Dio _dio;

  AnalyticsRepository(this._dio);

  /// Fetches overview stats for a site within a time range.
  Future<Overview> getOverview(
      String siteId, Map<String, String> params) async {
    final response = await _dio.get(
      '/api/sites/$siteId/overview',
      queryParameters: params,
    );
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'] as Map<String, dynamic>? ?? envelope;
    return Overview.fromJson(data);
  }

  /// Fetches bucketed overview data for charting.
  Future<List<OverviewBucket>> getOverviewBucketed(
      String siteId, Map<String, String> params) async {
    final response = await _dio.get(
      '/api/sites/$siteId/overview-bucketed',
      queryParameters: params,
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
      String siteId, String parameter, Map<String, String> params) async {
    final queryParams = Map<String, String>.from(params);
    queryParams['parameter'] = parameter;
    final response = await _dio.get(
      '/api/sites/$siteId/metric',
      queryParameters: queryParams,
    );
    final envelope = response.data as Map<String, dynamic>;
    final data = envelope['data'] as Map<String, dynamic>? ?? envelope;
    return MetricResponse.fromJson(data);
  }

  /// Fetches live user count for a site.
  Future<int> getLiveUserCount(String siteId) async {
    try {
      final response = await _dio.get('/api/sites/$siteId/live-user-count');
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
