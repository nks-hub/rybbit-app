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
    Map<String, String> params,
  ) async {
    final response = await _dio.get(
      '/api/sites/$siteId/events',
      queryParameters: params,
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
      eventName: json['eventName'] as String? ??
          json['event_name'] as String? ??
          '',
      eventCount: (json['eventCount'] as num?)?.toInt() ??
          (json['event_count'] as num?)?.toInt() ??
          0,
    );
  }
}

class EventProperty {
  final String propertyKey;
  final String propertyValue;
  final int count;

  const EventProperty({
    required this.propertyKey,
    required this.propertyValue,
    required this.count,
  });

  factory EventProperty.fromJson(Map<String, dynamic> json) {
    return EventProperty(
      propertyKey: json['propertyKey'] as String? ??
          json['property_key'] as String? ??
          '',
      propertyValue: json['propertyValue'] as String? ??
          json['property_value'] as String? ??
          '',
      count: (json['count'] as num?)?.toInt() ?? 0,
    );
  }
}

class OutboundLink {
  final String url;
  final int count;
  final String? lastClicked;

  const OutboundLink({
    required this.url,
    required this.count,
    this.lastClicked,
  });

  factory OutboundLink.fromJson(Map<String, dynamic> json) {
    return OutboundLink(
      url: json['url'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      lastClicked: json['lastClicked'] as String? ??
          json['last_clicked'] as String?,
    );
  }
}

final eventsRepositoryProvider = Provider<EventsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return EventsRepository(dio);
});
