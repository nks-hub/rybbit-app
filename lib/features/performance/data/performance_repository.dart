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

class PerformanceDimensionItem {
  final String dimensionValue;
  final int eventCount;
  final double lcpP75;
  final double clsP75;
  final double fcpP75;
  final double ttfbP75;
  final double inpP75;

  const PerformanceDimensionItem({
    required this.dimensionValue,
    required this.eventCount,
    this.lcpP75 = 0,
    this.clsP75 = 0,
    this.fcpP75 = 0,
    this.ttfbP75 = 0,
    this.inpP75 = 0,
  });

  factory PerformanceDimensionItem.fromJson(
      Map<String, dynamic> json, String dimension) {
    return PerformanceDimensionItem(
      dimensionValue: json[dimension] as String? ?? '(unknown)',
      eventCount: (json['event_count'] as num?)?.toInt() ?? 0,
      lcpP75: (json['lcp_p75'] as num?)?.toDouble() ?? 0,
      clsP75: (json['cls_p75'] as num?)?.toDouble() ?? 0,
      fcpP75: (json['fcp_p75'] as num?)?.toDouble() ?? 0,
      ttfbP75: (json['ttfb_p75'] as num?)?.toDouble() ?? 0,
      inpP75: (json['inp_p75'] as num?)?.toDouble() ?? 0,
    );
  }

  double getVitalP75(String vital) {
    switch (vital) {
      case 'lcp':
        return lcpP75;
      case 'cls':
        return clsP75;
      case 'fcp':
        return fcpP75;
      case 'ttfb':
        return ttfbP75;
      case 'inp':
        return inpP75;
      default:
        return 0;
    }
  }
}

final performanceRepositoryProvider = Provider<PerformanceRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return PerformanceRepository(dio);
});
