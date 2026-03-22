// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalyticsSession _$AnalyticsSessionFromJson(Map<String, dynamic> json) =>
    _AnalyticsSession(
      sessionId: _toStringRequired(json['session_id']),
      userId: _toStringOrNull(json['user_id']),
      country: _toStringOrNull(json['country']),
      region: _toStringOrNull(json['region']),
      city: _toStringOrNull(json['city']),
      language: _toStringOrNull(json['language']),
      deviceType: _toStringOrNull(json['device_type']),
      browser: _toStringOrNull(json['browser']),
      browserVersion: _toStringOrNull(json['browser_version']),
      operatingSystem: _toStringOrNull(json['operating_system']),
      osVersion: _toStringOrNull(json['operating_system_version']),
      referrer: _toStringOrNull(json['referrer']),
      channel: _toStringOrNull(json['channel']),
      hostname: _toStringOrNull(json['hostname']),
      entryPage: _toStringOrNull(json['entry_page']),
      exitPage: _toStringOrNull(json['exit_page']),
      sessionStart: _toStringOrNull(json['session_start']),
      sessionEnd: _toStringOrNull(json['session_end']),
      sessionDuration: json['session_duration'] as num? ?? 0,
      pageviews: (json['pageviews'] as num?)?.toInt() ?? 0,
      events: (json['events'] as num?)?.toInt() ?? 0,
      errors: (json['errors'] as num?)?.toInt() ?? 0,
      hasReplay: (json['has_replay'] as num?)?.toInt() ?? 0,
      utmSource: _toStringOrNull(json['utm_source']),
      utmMedium: _toStringOrNull(json['utm_medium']),
      utmCampaign: _toStringOrNull(json['utm_campaign']),
      identifiedUserId: _toStringOrNull(json['identified_user_id']),
      traits: _traitsFromJson(json['traits']),
      appVersion: _toStringOrNull(json['app_version']),
      deviceModel: _toStringOrNull(json['device_model']),
    );

Map<String, dynamic> _$AnalyticsSessionToJson(_AnalyticsSession instance) =>
    <String, dynamic>{
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
      'identified_user_id': instance.identifiedUserId,
      'traits': instance.traits,
      'app_version': instance.appVersion,
      'device_model': instance.deviceModel,
    };
