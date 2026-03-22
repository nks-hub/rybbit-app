import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import 'models.dart';

class ReplayRepository {
  final Dio _dio;

  ReplayRepository(this._dio);

  /// Fetches paginated list of sessions with replays.
  Future<ReplayListResult> getReplayList(
    String siteId, {
    int offset = 0,
    int limit = 20,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/session-replay/list',
      queryParameters: {
        'offset': offset.toString(),
        'limit': limit.toString(),
      },
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      final items = data['data'] as List? ?? [];
      final sessions = items
          .map((e) => ReplaySession.fromJson(e as Map<String, dynamic>))
          .toList();
      return ReplayListResult(
        sessions: sessions,
        total: sessions.length,
        hasMore: sessions.length >= limit,
      );
    }

    return const ReplayListResult(sessions: []);
  }

  /// Fetches replay events for a specific session.
  Future<List<ReplayEvent>> getReplayEvents(
    String siteId,
    String sessionId,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/session-replay/$sessionId',
    );

    final data = response.data;
    if (data is List) {
      return data
          .map((e) => ReplayEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (data is Map<String, dynamic>) {
      final events = data['events'] as List? ?? data['data'] as List? ?? [];
      return events
          .map((e) => ReplayEvent.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

final replayRepositoryProvider = Provider<ReplayRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return ReplayRepository(dio);
});
