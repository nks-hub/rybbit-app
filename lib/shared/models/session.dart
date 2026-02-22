import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

String? _toStringOrNull(dynamic value) => value?.toString();
String _toStringRequired(dynamic value) => value?.toString() ?? '';

@freezed
class AnalyticsSession with _$AnalyticsSession {
  const factory AnalyticsSession({
    @JsonKey(name: 'session_id', fromJson: _toStringRequired) required String sessionId,
    @JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? userId,
    @JsonKey(fromJson: _toStringOrNull) String? country,
    @JsonKey(fromJson: _toStringOrNull) String? region,
    @JsonKey(fromJson: _toStringOrNull) String? city,
    @JsonKey(fromJson: _toStringOrNull) String? language,
    @JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? deviceType,
    @JsonKey(fromJson: _toStringOrNull) String? browser,
    @JsonKey(name: 'browser_version', fromJson: _toStringOrNull) String? browserVersion,
    @JsonKey(name: 'operating_system', fromJson: _toStringOrNull) String? operatingSystem,
    @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) String? osVersion,
    @JsonKey(fromJson: _toStringOrNull) String? referrer,
    @JsonKey(fromJson: _toStringOrNull) String? channel,
    @JsonKey(fromJson: _toStringOrNull) String? hostname,
    @JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? entryPage,
    @JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? exitPage,
    @JsonKey(name: 'session_start', fromJson: _toStringOrNull) String? sessionStart,
    @JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? sessionEnd,
    @JsonKey(name: 'session_duration') @Default(0) num sessionDuration,
    @Default(0) int pageviews,
    @Default(0) int events,
    @Default(0) int errors,
    @JsonKey(name: 'has_replay') @Default(0) int hasReplay,
    @JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? utmSource,
    @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? utmMedium,
    @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) String? utmCampaign,
  }) = _AnalyticsSession;

  factory AnalyticsSession.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsSessionFromJson(json);
}
