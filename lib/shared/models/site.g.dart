// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'site.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Site _$SiteFromJson(Map<String, dynamic> json) => _Site(
  id: json['id'] as String,
  siteId: (_readSiteId(json, 'siteId') as num).toInt(),
  name: json['name'] as String,
  domain: json['domain'] as String,
  createdAt: _readCreatedAt(json, 'createdAt') as String,
  organizationId: _readOrganizationId(json, 'organizationId') as String?,
  public: json['public'] as bool? ?? false,
  sessionReplay: _readSessionReplay(json, 'sessionReplay') as bool? ?? false,
  webVitals: _readWebVitals(json, 'webVitals') as bool? ?? false,
  trackErrors: _readTrackErrors(json, 'trackErrors') as bool? ?? false,
  trackOutbound: _readTrackOutbound(json, 'trackOutbound') as bool? ?? false,
  isOwner: _readIsOwner(json, 'isOwner') as bool? ?? false,
  sessionsLast24Hours:
      (_readSessionsLast24Hours(json, 'sessionsLast24Hours') as num?)?.toInt(),
  type: json['type'] as String? ?? 'web',
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$SiteToJson(_Site instance) => <String, dynamic>{
  'id': instance.id,
  'siteId': instance.siteId,
  'name': instance.name,
  'domain': instance.domain,
  'createdAt': instance.createdAt,
  'organizationId': instance.organizationId,
  'public': instance.public,
  'sessionReplay': instance.sessionReplay,
  'webVitals': instance.webVitals,
  'trackErrors': instance.trackErrors,
  'trackOutbound': instance.trackOutbound,
  'isOwner': instance.isOwner,
  'sessionsLast24Hours': instance.sessionsLast24Hours,
  'type': instance.type,
  'tags': instance.tags,
};
