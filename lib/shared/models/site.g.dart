// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Site _$SiteFromJson(Map<String, dynamic> json) => _Site(
  id: json['id'] as String,
  siteId: (json['site_id'] as num).toInt(),
  name: json['name'] as String,
  domain: json['domain'] as String,
  createdAt: json['created_at'] as String,
  organizationId: json['organization_id'] as String?,
  public: json['public'] as bool? ?? false,
  sessionReplay: json['session_replay'] as bool? ?? false,
  webVitals: json['web_vitals'] as bool? ?? false,
  trackErrors: json['track_errors'] as bool? ?? false,
  trackOutbound: json['track_outbound'] as bool? ?? false,
  isOwner: json['is_owner'] as bool? ?? false,
  sessionsLast24Hours: (json['sessions_last_24_hours'] as num?)?.toInt(),
  type: json['type'] as String? ?? 'web',
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$SiteToJson(_Site instance) => <String, dynamic>{
  'id': instance.id,
  'site_id': instance.siteId,
  'name': instance.name,
  'domain': instance.domain,
  'created_at': instance.createdAt,
  'organization_id': instance.organizationId,
  'public': instance.public,
  'session_replay': instance.sessionReplay,
  'web_vitals': instance.webVitals,
  'track_errors': instance.trackErrors,
  'track_outbound': instance.trackOutbound,
  'is_owner': instance.isOwner,
  'sessions_last_24_hours': instance.sessionsLast24Hours,
  'type': instance.type,
  'tags': instance.tags,
};
