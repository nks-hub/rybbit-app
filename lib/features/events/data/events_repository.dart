import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/event.dart';
import 'models.dart';

class EventsRepository {
  final Dio _dio;

  EventsRepository(this._dio);

  /// Fetches event names with counts for a site.
  Future<List<EventName>> getEventNames(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events/names',
      queryParameters: params,
      cancelToken: cancelToken,
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => EventName.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches event properties for a specific event name.
  Future<List<EventProperty>> getEventProperties(
    String siteId,
    String eventName,
    Map<String, String> params,
  ) async {
    final queryParams = <String, String>{
      ...params,
      'event_name': eventName,
    };
    try {
      final response = await _dio.get(
        '/api/sites/$siteId/events/properties',
        queryParameters: queryParams,
      );
      final data = response.data;
      if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => EventProperty.fromJson(e as Map<String, dynamic>))
            .toList();
      }
      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// Fetches outbound link clicks.
  Future<List<OutboundLink>> getOutboundLinks(
    String siteId,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events/outbound',
      queryParameters: params,
    );
    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => OutboundLink.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches raw individual events with cursor-based pagination.
  Future<RawEventsResponse> getRawEvents(
    String siteId,
    Map<String, String> params, {
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events',
      queryParameters: params,
      cancelToken: cancelToken,
    );

    final data = response.data;
    if (data is Map<String, dynamic>) {
      return RawEventsResponse.fromJson(data);
    }
    return const RawEventsResponse(data: []);
  }

  /// Fetches bucketed event data for charting.
  Future<List<EventBucketItem>> getEventsBucketed(
    String siteId,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events/bucketed',
      queryParameters: params,
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => EventBucketItem.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return EventsRepository(dio);
});
