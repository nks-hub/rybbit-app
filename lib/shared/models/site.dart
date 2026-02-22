import 'package:freezed_annotation/freezed_annotation.dart';

part 'site.freezed.dart';
part 'site.g.dart';

@freezed
class Site with _$Site {
  const factory Site({
    required String id,
    @JsonKey(name: 'site_id') required int siteId,
    required String name,
    required String domain,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'public') @Default(false) bool public,
    @JsonKey(name: 'session_replay') @Default(false) bool sessionReplay,
    @JsonKey(name: 'web_vitals') @Default(false) bool webVitals,
    @JsonKey(name: 'track_errors') @Default(false) bool trackErrors,
    @JsonKey(name: 'track_outbound') @Default(false) bool trackOutbound,
    @JsonKey(name: 'is_owner') @Default(false) bool isOwner,
    @JsonKey(name: 'sessions_last_24_hours') int? sessionsLast24Hours,
    List<String>? tags,
  }) = _Site;

  factory Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);
}
