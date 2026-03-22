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
