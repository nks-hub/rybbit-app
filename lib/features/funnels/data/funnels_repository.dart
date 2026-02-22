import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/funnel.dart';

class FunnelStep {
  final String name;
  final int visitors;
  final double dropoff;

  const FunnelStep({
    required this.name,
    required this.visitors,
    required this.dropoff,
  });

  factory FunnelStep.fromJson(Map<String, dynamic> json) {
    return FunnelStep(
      name: json['name'] as String? ?? json['step'] as String? ?? '',
      visitors: (json['visitors'] as num?)?.toInt() ??
          (json['count'] as num?)?.toInt() ??
          0,
      dropoff: (json['dropoff'] as num?)?.toDouble() ??
          (json['dropoffRate'] as num?)?.toDouble() ??
          0.0,
    );
  }
}

class FunnelAnalysis {
  final List<FunnelStep> steps;
  final int totalVisitors;
  final double overallConversion;

  const FunnelAnalysis({
    required this.steps,
    required this.totalVisitors,
    required this.overallConversion,
  });

  factory FunnelAnalysis.fromJson(Map<String, dynamic> json) {
    final stepsData = json['steps'] as List? ?? [];
    final steps = stepsData
        .map((e) => FunnelStep.fromJson(e as Map<String, dynamic>))
        .toList();

    return FunnelAnalysis(
      steps: steps,
      totalVisitors: (json['totalVisitors'] as num?)?.toInt() ?? 0,
      overallConversion:
          (json['overallConversion'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class FunnelsRepository {
  final Dio _dio;

  FunnelsRepository(this._dio);

  /// Fetches all saved funnels for a site.
  Future<List<Funnel>> getFunnels(String siteId) async {
    final response = await _dio.get('/api/sites/$siteId/funnels');
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => Funnel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => Funnel.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Analyzes a funnel with given steps.
  Future<FunnelAnalysis> analyzeFunnel(
    String siteId,
    List<Map<String, dynamic>> steps,
    Map<String, String>? params,
  ) async {
    final response = await _dio.post(
      '/api/sites/$siteId/funnels/analyze',
      data: {'steps': steps},
      queryParameters: params,
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return FunnelAnalysis.fromJson(data['data'] as Map<String, dynamic>);
      }
      return FunnelAnalysis.fromJson(data);
    }
    throw Exception('Invalid funnel analysis response');
  }

  /// Saves a funnel.
  Future<Funnel> saveFunnel(
    String siteId,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.post(
      '/api/sites/$siteId/funnels',
      data: body,
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return Funnel.fromJson(data['data'] as Map<String, dynamic>);
      }
      return Funnel.fromJson(data);
    }
    throw Exception('Invalid save funnel response');
  }

  /// Deletes a funnel.
  Future<void> deleteFunnel(String siteId, int funnelId) async {
    await _dio.delete('/api/sites/$siteId/funnels/$funnelId');
  }
}

final funnelsRepositoryProvider = Provider<FunnelsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return FunnelsRepository(dio);
});
