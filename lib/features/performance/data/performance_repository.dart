import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/performance_data.dart';

class PerformanceTimeSeries {
  final String time;
  final double value;

  const PerformanceTimeSeries({
    required this.time,
    required this.value,
  });

  factory PerformanceTimeSeries.fromJson(
      Map<String, dynamic> json, String metricKey) {
    return PerformanceTimeSeries(
      time: json['time'] as String? ?? '',
      value: (json[metricKey] as num?)?.toDouble() ?? 0.0,
    );
  }
}

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
