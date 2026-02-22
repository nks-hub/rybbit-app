import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class AnalyticsSession with _$AnalyticsSession {
  const factory AnalyticsSession({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'user_id') String? userId,
    String? country,
    String? region,
    String? city,
    String? language,
    @JsonKey(name: 'device_type') String? deviceType,
    String? browser,
    @JsonKey(name: 'browser_version') String? browserVersion,
    @JsonKey(name: 'operating_system') String? operatingSystem,
    @JsonKey(name: 'operating_system_version') String? osVersion,
    String? referrer,
    String? channel,
    String? hostname,
    @JsonKey(name: 'entry_page') String? entryPage,
    @JsonKey(name: 'exit_page') String? exitPage,
    @JsonKey(name: 'session_start') String? sessionStart,
    @JsonKey(name: 'session_end') String? sessionEnd,
    @JsonKey(name: 'session_duration') @Default(0) num sessionDuration,
    @Default(0) int pageviews,
    @Default(0) int events,
    @Default(0) int errors,
    @JsonKey(name: 'has_replay') @Default(0) int hasReplay,
    @JsonKey(name: 'utm_source') String? utmSource,
    @JsonKey(name: 'utm_medium') String? utmMedium,
    @JsonKey(name: 'utm_campaign') String? utmCampaign,
  }) = _AnalyticsSession;

  factory AnalyticsSession.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSessionFromJson(json);
}
