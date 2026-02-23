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
      name: json['step_name'] as String? ??
          json['name'] as String? ??
          json['step'] as String? ??
          '',
      visitors: (json['visitors'] as num?)?.toInt() ??
          (json['count'] as num?)?.toInt() ??
          0,
      dropoff: (json['dropoff_rate'] as num?)?.toDouble() ??
          (json['dropoff'] as num?)?.toDouble() ??
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
    final stepsData = json['steps'] as List? ?? json['data'] as List? ?? [];
    final steps = stepsData
        .map((e) => FunnelStep.fromJson(e as Map<String, dynamic>))
        .toList();

    // Compute overall conversion if not provided
    final totalVisitors = (json['totalVisitors'] as num?)?.toInt() ??
        (json['total_visitors'] as num?)?.toInt() ??
        (steps.isNotEmpty ? steps.first.visitors : 0);

    double overallConversion =
        (json['overallConversion'] as num?)?.toDouble() ??
            (json['overall_conversion'] as num?)?.toDouble() ??
            0.0;

    if (overallConversion == 0.0 && steps.length >= 2) {
      final first = steps.first.visitors;
      final last = steps.last.visitors;
      if (first > 0) {
        overallConversion = (last / first) * 100;
      }
    }

    return FunnelAnalysis(
      steps: steps,
      totalVisitors: totalVisitors,
      overallConversion: overallConversion,
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
    // Ensure each step has a type field (required by backend)
    final normalizedSteps = steps.map((step) {
      final s = Map<String, dynamic>.from(step);
      if (!s.containsKey('type') || s['type'] == null) {
        s['type'] = 'page';
      }
      // Ensure value field exists
      if (!s.containsKey('value') || s['value'] == null) {
        s['value'] = s['name'] ?? s['step_name'] ?? '';
      }
      return s;
    }).toList();

    final response = await _dio.post(
      '/api/sites/$siteId/funnels/analyze',
      data: {'steps': normalizedSteps},
      queryParameters: params,
    );
    final data = response.data;
    // Backend may return array directly or wrapped in object
    if (data is List) {
      final funnelSteps = data
          .map((e) => FunnelStep.fromJson(e as Map<String, dynamic>))
          .toList();
      return FunnelAnalysis(
        steps: funnelSteps,
        totalVisitors: funnelSteps.isNotEmpty ? funnelSteps.first.visitors : 0,
        overallConversion: funnelSteps.length >= 2 && funnelSteps.first.visitors > 0
            ? (funnelSteps.last.visitors / funnelSteps.first.visitors) * 100
            : 0.0,
      );
    }
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is List) {
        final funnelSteps = (data['data'] as List)
            .map((e) => FunnelStep.fromJson(e as Map<String, dynamic>))
            .toList();
        return FunnelAnalysis(
          steps: funnelSteps,
          totalVisitors: funnelSteps.isNotEmpty ? funnelSteps.first.visitors : 0,
          overallConversion: funnelSteps.length >= 2 && funnelSteps.first.visitors > 0
              ? (funnelSteps.last.visitors / funnelSteps.first.visitors) * 100
              : 0.0,
        );
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
