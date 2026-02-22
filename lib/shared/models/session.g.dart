// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsSessionImpl _$$AnalyticsSessionImplFromJson(
  Map<String, dynamic> json,
) => _$AnalyticsSessionImpl(
  sessionId: json['session_id'] as String,
  userId: json['user_id'] as String?,
  country: json['country'] as String?,
  region: json['region'] as String?,
  city: json['city'] as String?,
  language: json['language'] as String?,
  deviceType: json['device_type'] as String?,
  browser: json['browser'] as String?,
  browserVersion: json['browser_version'] as String?,
  operatingSystem: json['operating_system'] as String?,
  osVersion: json['operating_system_version'] as String?,
  referrer: json['referrer'] as String?,
  channel: json['channel'] as String?,
  hostname: json['hostname'] as String?,
  entryPage: json['entry_page'] as String?,
  exitPage: json['exit_page'] as String?,
  sessionStart: json['session_start'] as String?,
  sessionEnd: json['session_end'] as String?,
  sessionDuration: json['session_duration'] as num? ?? 0,
  pageviews: (json['pageviews'] as num?)?.toInt() ?? 0,
  events: (json['events'] as num?)?.toInt() ?? 0,
  errors: (json['errors'] as num?)?.toInt() ?? 0,
  hasReplay: (json['has_replay'] as num?)?.toInt() ?? 0,
  utmSource: json['utm_source'] as String?,
  utmMedium: json['utm_medium'] as String?,
  utmCampaign: json['utm_campaign'] as String?,
);

Map<String, dynamic> _$$AnalyticsSessionImplToJson(
  _$AnalyticsSessionImpl instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'user_id': instance.userId,
  'country': instance.country,
  'region': instance.region,
  'city': instance.city,
  'language': instance.language,
  'device_type': instance.deviceType,
  'browser': instance.browser,
  'browser_version': instance.browserVersion,
  'operating_system': instance.operatingSystem,
  'operating_system_version': instance.osVersion,
  'referrer': instance.referrer,
  'channel': instance.channel,
  'hostname': instance.hostname,
  'entry_page': instance.entryPage,
  'exit_page': instance.exitPage,
  'session_start': instance.sessionStart,
  'session_end': instance.sessionEnd,
  'session_duration': instance.sessionDuration,
  'pageviews': instance.pageviews,
  'events': instance.events,
  'errors': instance.errors,
  'has_replay': instance.hasReplay,
  'utm_source': instance.utmSource,
  'utm_medium': instance.utmMedium,
  'utm_campaign': instance.utmCampaign,
};
