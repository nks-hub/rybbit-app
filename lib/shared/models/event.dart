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
