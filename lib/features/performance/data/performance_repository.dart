import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/performance_data.dart';
import 'models.dart';

class PerformanceRepository {
  final Dio _dio;

  PerformanceRepository(this._dio);

  /// Fetches performance overview (aggregated web vitals).
  Future<PerformanceOverview> getOverview(
    String siteId,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/performance/overview',
      queryParameters: params,
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return PerformanceOverview.fromJson(
            data['data'] as Map<String, dynamic>);
      }
      return PerformanceOverview.fromJson(data);
    }
    return const PerformanceOverview();
  }

  /// Fetches performance breakdown by dimension.
  Future<List<PerformanceDimensionItem>> getByDimension(
    String siteId,
    String dimension,
    Map<String, String> params,
  ) async {
    final queryParams = <String, String>{
      ...params,
      'dimension': dimension,
    };
    final response = await _dio.get(
      '/api/sites/$siteId/performance/by-dimension',
      queryParameters: queryParams,
    );
    final raw = response.data;
    // Response: { data: { data: [...], totalCount: N } }
    List<dynamic>? items;
    if (raw is Map<String, dynamic>) {
      final inner = raw['data'];
      if (inner is Map<String, dynamic>) {
        items = inner['data'] as List?;
      } else if (inner is List) {
        items = inner;
      }
    }
    if (items == null) return [];
    return items
        .map((e) => PerformanceDimensionItem.fromJson(
            e as Map<String, dynamic>, dimension))
        .toList();
  }

  /// Fetches time-series data for a specific metric.
  /// [metric] is the short name like 'lcp', 'cls', etc.
  Future<List<PerformanceTimeSeries>> getTimeSeries(
    String siteId,
    String metric,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/performance/time-series',
      queryParameters: params,
    );
    // Backend returns all metrics in each row. Extract the p75 value
    // for the selected metric (e.g., 'lcp' -> 'lcp_p75').
    final metricKey = '${metric}_p75';
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => PerformanceTimeSeries.fromJson(
              e as Map<String, dynamic>, metricKey))
          .toList();
    }
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => PerformanceTimeSeries.fromJson(
              e as Map<String, dynamic>, metricKey))
          .toList();
    }
    return [];
  }
}

final performanceRepositoryProvider = Provider<PerformanceRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PerformanceRepository(dio);
});
