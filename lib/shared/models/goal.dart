class Goal {
  final int goalId;
  final String name;
  final String goalType;
  final String? pathPattern;
  final String? eventName;
  final String? eventPropertyKey;
  final String? eventPropertyValue;
  final int totalConversions;
  final int totalSessions;
  final double conversionRate;

  const Goal({
    required this.goalId,
    required this.name,
    required this.goalType,
    this.pathPattern,
    this.eventName,
    this.eventPropertyKey,
    this.eventPropertyValue,
    this.totalConversions = 0,
    this.totalSessions = 0,
    this.conversionRate = 0,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    final config = json['config'] as Map<String, dynamic>? ?? {};

    return Goal(
      goalId: (json['goalId'] as num?)?.toInt() ??
          (json['goal_id'] as num?)?.toInt() ??
          0,
      name: json['name'] as String? ?? '',
      goalType: json['goalType'] as String? ??
          json['goal_type'] as String? ??
          '',
      pathPattern: config['pathPattern'] as String? ??
          json['pathPattern'] as String? ??
          json['path_pattern'] as String?,
      eventName: config['eventName'] as String? ??
          json['eventName'] as String? ??
          json['event_name'] as String?,
      eventPropertyKey: config['eventPropertyKey'] as String? ??
          json['eventPropertyKey'] as String? ??
          json['event_property_key'] as String?,
      eventPropertyValue: config['eventPropertyValue']?.toString() ??
          json['eventPropertyValue']?.toString() ??
          json['event_property_value']?.toString(),
      totalConversions:
          (json['total_conversions'] as num?)?.toInt() ??
          (json['totalConversions'] as num?)?.toInt() ??
          0,
      totalSessions:
          (json['total_sessions'] as num?)?.toInt() ??
          (json['totalSessions'] as num?)?.toInt() ??
          0,
      conversionRate:
          (json['conversion_rate'] as num?)?.toDouble() ??
          (json['conversionRate'] as num?)?.toDouble() ??
          0,
    );
  }
}
