class EventName {
  final String eventName;
  final int count;

  const EventName({
    this.eventName = '',
    this.count = 0,
  });

  factory EventName.fromJson(Map<String, dynamic> json) {
    return EventName(
      eventName: json['eventName'] as String? ??
          json['event_name'] as String? ??
          '',
      count: (json['count'] as num?)?.toInt() ?? 0,
    );
  }
}

/// Raw event from the /events endpoint.
class RawEvent {
  final String timestamp;
  final String eventName;
  final String? properties;
  final String? sessionId;
  final String? userId;
  final String? identifiedUserId;
  final String? pathname;
  final String? querystring;
  final String? hostname;
  final String? pageTitle;
  final String? referrer;
  final String? browser;
  final String? operatingSystem;
  final String? country;
  final String? city;
  final String? deviceType;
  final String type;

  const RawEvent({
    required this.timestamp,
    this.eventName = '',
    this.properties,
    this.sessionId,
    this.userId,
    this.identifiedUserId,
    this.pathname,
    this.querystring,
    this.hostname,
    this.pageTitle,
    this.referrer,
    this.browser,
    this.operatingSystem,
    this.country,
    this.city,
    this.deviceType,
    this.type = 'pageview',
  });

  factory RawEvent.fromJson(Map<String, dynamic> json) {
    return RawEvent(
      timestamp: json['timestamp'] as String? ?? '',
      eventName: json['event_name'] as String? ??
          json['eventName'] as String? ??
          '',
      properties: json['properties'] as String?,
      sessionId: json['session_id'] as String?,
      userId: json['user_id'] as String?,
      identifiedUserId: json['identified_user_id'] as String?,
      pathname: json['pathname'] as String?,
      querystring: json['querystring'] as String?,
      hostname: json['hostname'] as String?,
      pageTitle: json['page_title'] as String?,
      referrer: json['referrer'] as String?,
      browser: json['browser'] as String?,
      operatingSystem: json['operating_system'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      deviceType: json['device_type'] as String?,
      type: json['type'] as String? ?? 'pageview',
    );
  }

  /// Display label for the event type.
  String get displayType {
    if (type == 'custom_event' && eventName.isNotEmpty) return eventName;
    return switch (type) {
      'pageview' => pathname ?? 'Pageview',
      'custom_event' => eventName.isEmpty ? 'Custom Event' : eventName,
      'outbound' => 'Outbound Link',
      'button_click' => 'Button Click',
      'form_submit' => 'Form Submit',
      'input_change' => 'Input Change',
      'copy' => 'Copy',
      _ => type,
    };
  }
}

/// Cursor info for paginated event responses.
class EventCursor {
  final bool hasMore;
  final String? oldestTimestamp;

  const EventCursor({this.hasMore = false, this.oldestTimestamp});

  factory EventCursor.fromJson(Map<String, dynamic> json) {
    return EventCursor(
      hasMore: json['hasMore'] as bool? ?? false,
      oldestTimestamp: json['oldestTimestamp'] as String?,
    );
  }
}

/// Response from the raw events endpoint.
class RawEventsResponse {
  final List<RawEvent> data;
  final EventCursor? cursor;

  const RawEventsResponse({required this.data, this.cursor});

  factory RawEventsResponse.fromJson(Map<String, dynamic> json) {
    final dataList = (json['data'] as List?)
            ?.map((e) => RawEvent.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [];
    final cursorJson = json['cursor'] as Map<String, dynamic>?;
    return RawEventsResponse(
      data: dataList,
      cursor: cursorJson != null ? EventCursor.fromJson(cursorJson) : null,
    );
  }
}
