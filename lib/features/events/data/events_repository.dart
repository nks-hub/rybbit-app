import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/event.dart';

class EventsRepository {
  final Dio _dio;

  EventsRepository(this._dio);

  /// Fetches event names with counts for a site.
  Future<List<EventName>> getEventNames(
    String siteId,
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events/names',
      queryParameters: params,
    );

    final data = response.data;
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => EventName.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
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

class EventBucketItem {
  final String time;
  final String eventName;
  final int eventCount;

  const EventBucketItem({
    required this.time,
    required this.eventName,
    required this.eventCount,
  });

  factory EventBucketItem.fromJson(Map<String, dynamic> json) {
    return EventBucketItem(
      time: json['time'] as String? ?? '',
      eventName: json['event_name'] as String? ?? '',
      eventCount: (json['event_count'] as num?)?.toInt() ?? 0,
    );
  }
}

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return EventsRepository(dio);
});
