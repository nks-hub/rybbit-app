class ErrorNameItem {
  final String value;
  final String errorName;
  final int count;
  final int sessionCount;
  final double percentage;

  const ErrorNameItem({
    required this.value,
    required this.errorName,
    required this.count,
    required this.sessionCount,
    required this.percentage,
  });

  factory ErrorNameItem.fromJson(Map<String, dynamic> json) {
    return ErrorNameItem(
      value: json['value'] as String? ?? '',
      errorName: json['errorName'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      sessionCount: (json['sessionCount'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class ErrorEventItem {
  final String timestamp;
  final String? sessionId;
  final String? pathname;
  final String? hostname;
  final String? pageTitle;
  final String? browser;
  final String? browserVersion;
  final String? operatingSystem;
  final String? deviceType;
  final String? country;
  final String? city;
  final String message;
  final String? stack;

  const ErrorEventItem({
    required this.timestamp,
    this.sessionId,
    this.pathname,
    this.hostname,
    this.pageTitle,
    this.browser,
    this.browserVersion,
    this.operatingSystem,
    this.deviceType,
    this.country,
    this.city,
    required this.message,
    this.stack,
  });

  factory ErrorEventItem.fromJson(Map<String, dynamic> json) {
    return ErrorEventItem(
      timestamp: json['timestamp'] as String? ?? '',
      sessionId: json['session_id'] as String?,
      pathname: json['pathname'] as String?,
      hostname: json['hostname'] as String?,
      pageTitle: json['page_title'] as String?,
      browser: json['browser'] as String?,
      browserVersion: json['browser_version'] as String?,
      operatingSystem: json['operating_system'] as String?,
      deviceType: json['device_type'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      message: json['message'] as String? ?? '',
      stack: json['stack'] as String?,
    );
  }
}
