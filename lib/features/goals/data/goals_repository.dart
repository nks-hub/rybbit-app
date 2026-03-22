import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/goal.dart';

class GoalsRepository {
  final Dio _dio;

  GoalsRepository(this._dio);

  /// Fetches all goals for a site, optionally with conversion stats.
  Future<List<Goal>> getGoals(String siteId,
      {Map<String, String>? params}) async {
    final response = await _dio.get(
      '/api/sites/$siteId/goals',
      queryParameters: params,
    );
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => Goal.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Creates a new goal.
  Future<Goal> createGoal(String siteId, Map<String, dynamic> body) async {
    final response = await _dio.post(
      '/api/sites/$siteId/goals',
      data: body,
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return Goal.fromJson(data['data'] as Map<String, dynamic>);
      }
      return Goal.fromJson(data);
    }
    throw Exception('Invalid create goal response');
  }

  /// Updates an existing goal.
  Future<Goal> updateGoal(
    String siteId,
    int goalId,
    Map<String, dynamic> body,
  ) async {
    final response = await _dio.put(
      '/api/sites/$siteId/goals/$goalId',
      data: body,
    );
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return Goal.fromJson(data['data'] as Map<String, dynamic>);
      }
      return Goal.fromJson(data);
    }
    throw Exception('Invalid update goal response');
  }

  /// Deletes a goal.
  Future<void> deleteGoal(String siteId, int goalId) async {
    await _dio.delete('/api/sites/$siteId/goals/$goalId');
  }
}

final goalsRepositoryProvider = Provider<GoalsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return GoalsRepository(dio);
});
