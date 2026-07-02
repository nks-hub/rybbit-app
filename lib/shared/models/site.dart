import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
abstract class Site with _$Site {
  const factory Site({
    required String id,
    // Rybbit v2.6 returns camelCase keys on /api/sites/:siteId. Accept both the
    // camelCase form (site config endpoint) and the snake_case fallback so the
    // model works regardless of which endpoint produced the JSON.
    @JsonKey(name: 'siteId', readValue: _readSiteId) required int siteId,
    required String name,
    required String domain,
    @JsonKey(name: 'createdAt', readValue: _readCreatedAt)
    required String createdAt,
    @JsonKey(name: 'organizationId', readValue: _readOrganizationId)
    String? organizationId,
    @JsonKey(name: 'public') @Default(false) bool public,
    @JsonKey(name: 'sessionReplay', readValue: _readSessionReplay)
    @Default(false)
    bool sessionReplay,
    @JsonKey(name: 'webVitals', readValue: _readWebVitals)
    @Default(false)
    bool webVitals,
    @JsonKey(name: 'trackErrors', readValue: _readTrackErrors)
    @Default(false)
    bool trackErrors,
    @JsonKey(name: 'trackOutbound', readValue: _readTrackOutbound)
    @Default(false)
    bool trackOutbound,
    @JsonKey(name: 'isOwner', readValue: _readIsOwner)
    @Default(false)
    bool isOwner,
    @JsonKey(name: 'sessionsLast24Hours', readValue: _readSessionsLast24Hours)
    int? sessionsLast24Hours,
    @Default('web') String type,
    List<String>? tags,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}

// Fallback readers: prefer the camelCase key (Rybbit v2.6), fall back to the
// legacy snake_case key so both server shapes deserialize correctly.
Object? _readSiteId(Map json, String key) => json['siteId'] ?? json['site_id'];
Object? _readCreatedAt(Map json, String key) =>
    json['createdAt'] ?? json['created_at'];
Object? _readOrganizationId(Map json, String key) =>
    json['organizationId'] ?? json['organization_id'];
Object? _readSessionReplay(Map json, String key) =>
    json['sessionReplay'] ?? json['session_replay'];
Object? _readWebVitals(Map json, String key) =>
    json['webVitals'] ?? json['web_vitals'];
Object? _readTrackErrors(Map json, String key) =>
    json['trackErrors'] ?? json['track_errors'];
Object? _readTrackOutbound(Map json, String key) =>
    json['trackOutbound'] ?? json['track_outbound'];
Object? _readIsOwner(Map json, String key) =>
    json['isOwner'] ?? json['is_owner'];
Object? _readSessionsLast24Hours(Map json, String key) =>
    json['sessionsLast24Hours'] ?? json['sessions_last_24_hours'];
