import '../../../shared/models/session.dart';

class SessionDetail {
  final AnalyticsSession session;
  final List<SessionEvent> events;
  final SessionPagination pagination;

  const SessionDetail({
    required this.session,
    required this.events,
    required this.pagination,
  });

  factory SessionDetail.fromJson(Map<String, dynamic> json) {
    final sessionJson = json['session'] as Map<String, dynamic>;
    final eventsJson = json['events'] as List? ?? [];
    final paginationJson = json['pagination'] as Map<String, dynamic>? ?? {};

    return SessionDetail(
      session: AnalyticsSession.fromJson(sessionJson),
      events: eventsJson
          .map((e) => SessionEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      pagination: SessionPagination.fromJson(paginationJson),
    );
  }
}

class SessionEvent {
  final String timestamp;
  final String? pathname;
  final String? hostname;
  final String? querystring;
  final String? pageTitle;
  final String? referrer;
  final String type;
  final String? eventName;
  final String? properties;

  const SessionEvent({
    required this.timestamp,
    this.pathname,
    this.hostname,
    this.querystring,
    this.pageTitle,
    this.referrer,
    required this.type,
    this.eventName,
    this.properties,
  });

  factory SessionEvent.fromJson(Map<String, dynamic> json) {
    return SessionEvent(
      timestamp: json['timestamp'] as String? ?? '',
      pathname: json['pathname'] as String?,
      hostname: json['hostname'] as String?,
      querystring: json['querystring'] as String?,
      pageTitle: json['page_title'] as String?,
      referrer: json['referrer'] as String?,
      type: json['type'] as String? ?? 'pageview',
      eventName: json['event_name'] as String?,
      properties: json['props']?.toString(),
    );
  }

  String get displayLabel {
    switch (type) {
      case 'pageview':
        return pathname ?? '/';
      case 'custom_event':
        return eventName ?? 'Event';
      case 'error':
        return 'Error: ${eventName ?? "Unknown"}';
      default:
        return type;
    }
  }

  IconType get iconType {
    switch (type) {
      case 'pageview':
        return IconType.pageview;
      case 'custom_event':
        return IconType.customEvent;
      case 'error':
        return IconType.error;
      default:
        return IconType.other;
    }
  }
}

enum IconType { pageview, customEvent, error, other }

class SessionPagination {
  final int total;
  final int limit;
  final int offset;
  final bool hasMore;

  const SessionPagination({
    this.total = 0,
    this.limit = 100,
    this.offset = 0,
    this.hasMore = false,
  });

  factory SessionPagination.fromJson(Map<String, dynamic> json) {
    return SessionPagination(
      total: (json['total'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 100,
      offset: (json['offset'] as num?)?.toInt() ?? 0,
      hasMore: json['hasMore'] as bool? ?? false,
    );
  }
}
