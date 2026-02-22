// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Site _$SiteFromJson(Map<String, dynamic> json) {
  return _Site.fromJson(json);
}

/// @nodoc
mixin _$Site {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id')
  int get siteId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get domain => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'organization_id')
  String? get organizationId => throw _privateConstructorUsedError;
  @JsonKey(name: 'public')
  bool get public => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_replay')
  bool get sessionReplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'web_vitals')
  bool get webVitals => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_errors')
  bool get trackErrors => throw _privateConstructorUsedError;
  @JsonKey(name: 'track_outbound')
  bool get trackOutbound => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_owner')
  bool get isOwner => throw _privateConstructorUsedError;
  @JsonKey(name: 'sessions_last_24_hours')
  int? get sessionsLast24Hours => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;

  /// Serializes this Site to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Site
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteCopyWith<Site> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteCopyWith<$Res> {
  factory $SiteCopyWith(Site value, $Res Function(Site) then) =
      _$SiteCopyWithImpl<$Res, Site>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'site_id') int siteId,
    String name,
    String domain,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'public') bool public,
    @JsonKey(name: 'session_replay') bool sessionReplay,
    @JsonKey(name: 'web_vitals') bool webVitals,
    @JsonKey(name: 'track_errors') bool trackErrors,
    @JsonKey(name: 'track_outbound') bool trackOutbound,
    @JsonKey(name: 'is_owner') bool isOwner,
    @JsonKey(name: 'sessions_last_24_hours') int? sessionsLast24Hours,
    List<String>? tags,
  });
}

/// @nodoc
class _$SiteCopyWithImpl<$Res, $Val extends Site>
    implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Site
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? siteId = null,
    Object? name = null,
    Object? domain = null,
    Object? createdAt = null,
    Object? organizationId = freezed,
    Object? public = null,
    Object? sessionReplay = null,
    Object? webVitals = null,
    Object? trackErrors = null,
    Object? trackOutbound = null,
    Object? isOwner = null,
    Object? sessionsLast24Hours = freezed,
    Object? tags = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            siteId: null == siteId
                ? _value.siteId
                : siteId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            domain: null == domain
                ? _value.domain
                : domain // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            organizationId: freezed == organizationId
                ? _value.organizationId
                : organizationId // ignore: cast_nullable_to_non_nullable
                      as String?,
            public: null == public
                ? _value.public
                : public // ignore: cast_nullable_to_non_nullable
                      as bool,
            sessionReplay: null == sessionReplay
                ? _value.sessionReplay
                : sessionReplay // ignore: cast_nullable_to_non_nullable
                      as bool,
            webVitals: null == webVitals
                ? _value.webVitals
                : webVitals // ignore: cast_nullable_to_non_nullable
                      as bool,
            trackErrors: null == trackErrors
                ? _value.trackErrors
                : trackErrors // ignore: cast_nullable_to_non_nullable
                      as bool,
            trackOutbound: null == trackOutbound
                ? _value.trackOutbound
                : trackOutbound // ignore: cast_nullable_to_non_nullable
                      as bool,
            isOwner: null == isOwner
                ? _value.isOwner
                : isOwner // ignore: cast_nullable_to_non_nullable
                      as bool,
            sessionsLast24Hours: freezed == sessionsLast24Hours
                ? _value.sessionsLast24Hours
                : sessionsLast24Hours // ignore: cast_nullable_to_non_nullable
                      as int?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SiteImplCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$$SiteImplCopyWith(
    _$SiteImpl value,
    $Res Function(_$SiteImpl) then,
  ) = __$$SiteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'site_id') int siteId,
    String name,
    String domain,
    @JsonKey(name: 'created_at') String createdAt,
    @JsonKey(name: 'organization_id') String? organizationId,
    @JsonKey(name: 'public') bool public,
    @JsonKey(name: 'session_replay') bool sessionReplay,
    @JsonKey(name: 'web_vitals') bool webVitals,
    @JsonKey(name: 'track_errors') bool trackErrors,
    @JsonKey(name: 'track_outbound') bool trackOutbound,
    @JsonKey(name: 'is_owner') bool isOwner,
    @JsonKey(name: 'sessions_last_24_hours') int? sessionsLast24Hours,
    List<String>? tags,
  });
}

/// @nodoc
class __$$SiteImplCopyWithImpl<$Res>
    extends _$SiteCopyWithImpl<$Res, _$SiteImpl>
    implements _$$SiteImplCopyWith<$Res> {
  __$$SiteImplCopyWithImpl(_$SiteImpl _value, $Res Function(_$SiteImpl) _then)
    : super(_value, _then);

  /// Create a copy of Site
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? siteId = null,
    Object? name = null,
    Object? domain = null,
    Object? createdAt = null,
    Object? organizationId = freezed,
    Object? public = null,
    Object? sessionReplay = null,
    Object? webVitals = null,
    Object? trackErrors = null,
    Object? trackOutbound = null,
    Object? isOwner = null,
    Object? sessionsLast24Hours = freezed,
    Object? tags = freezed,
  }) {
    return _then(
      _$SiteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        siteId: null == siteId
            ? _value.siteId
            : siteId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        domain: null == domain
            ? _value.domain
            : domain // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: freezed == organizationId
            ? _value.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        public: null == public
            ? _value.public
            : public // ignore: cast_nullable_to_non_nullable
                  as bool,
        sessionReplay: null == sessionReplay
            ? _value.sessionReplay
            : sessionReplay // ignore: cast_nullable_to_non_nullable
                  as bool,
        webVitals: null == webVitals
            ? _value.webVitals
            : webVitals // ignore: cast_nullable_to_non_nullable
                  as bool,
        trackErrors: null == trackErrors
            ? _value.trackErrors
            : trackErrors // ignore: cast_nullable_to_non_nullable
                  as bool,
        trackOutbound: null == trackOutbound
            ? _value.trackOutbound
            : trackOutbound // ignore: cast_nullable_to_non_nullable
                  as bool,
        isOwner: null == isOwner
            ? _value.isOwner
            : isOwner // ignore: cast_nullable_to_non_nullable
                  as bool,
        sessionsLast24Hours: freezed == sessionsLast24Hours
            ? _value.sessionsLast24Hours
            : sessionsLast24Hours // ignore: cast_nullable_to_non_nullable
                  as int?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteImpl implements _Site {
  const _$SiteImpl({
    required this.id,
    @JsonKey(name: 'site_id') required this.siteId,
    required this.name,
    required this.domain,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'organization_id') this.organizationId,
    @JsonKey(name: 'public') this.public = false,
    @JsonKey(name: 'session_replay') this.sessionReplay = false,
    @JsonKey(name: 'web_vitals') this.webVitals = false,
    @JsonKey(name: 'track_errors') this.trackErrors = false,
    @JsonKey(name: 'track_outbound') this.trackOutbound = false,
    @JsonKey(name: 'is_owner') this.isOwner = false,
    @JsonKey(name: 'sessions_last_24_hours') this.sessionsLast24Hours,
    final List<String>? tags,
  }) : _tags = tags;

  factory _$SiteImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'site_id')
  final int siteId;
  @override
  final String name;
  @override
  final String domain;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'organization_id')
  final String? organizationId;
  @override
  @JsonKey(name: 'public')
  final bool public;
  @override
  @JsonKey(name: 'session_replay')
  final bool sessionReplay;
  @override
  @JsonKey(name: 'web_vitals')
  final bool webVitals;
  @override
  @JsonKey(name: 'track_errors')
  final bool trackErrors;
  @override
  @JsonKey(name: 'track_outbound')
  final bool trackOutbound;
  @override
  @JsonKey(name: 'is_owner')
  final bool isOwner;
  @override
  @JsonKey(name: 'sessions_last_24_hours')
  final int? sessionsLast24Hours;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Site(id: $id, siteId: $siteId, name: $name, domain: $domain, createdAt: $createdAt, organizationId: $organizationId, public: $public, sessionReplay: $sessionReplay, webVitals: $webVitals, trackErrors: $trackErrors, trackOutbound: $trackOutbound, isOwner: $isOwner, sessionsLast24Hours: $sessionsLast24Hours, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.domain, domain) || other.domain == domain) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.public, public) || other.public == public) &&
            (identical(other.sessionReplay, sessionReplay) ||
                other.sessionReplay == sessionReplay) &&
            (identical(other.webVitals, webVitals) ||
                other.webVitals == webVitals) &&
            (identical(other.trackErrors, trackErrors) ||
                other.trackErrors == trackErrors) &&
            (identical(other.trackOutbound, trackOutbound) ||
                other.trackOutbound == trackOutbound) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.sessionsLast24Hours, sessionsLast24Hours) ||
                other.sessionsLast24Hours == sessionsLast24Hours) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    siteId,
    name,
    domain,
    createdAt,
    organizationId,
    public,
    sessionReplay,
    webVitals,
    trackErrors,
    trackOutbound,
    isOwner,
    sessionsLast24Hours,
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of Site
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteImplCopyWith<_$SiteImpl> get copyWith =>
      __$$SiteImplCopyWithImpl<_$SiteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteImplToJson(this);
  }
}

abstract class _Site implements Site {
  const factory _Site({
    required final String id,
    @JsonKey(name: 'site_id') required final int siteId,
    required final String name,
    required final String domain,
    @JsonKey(name: 'created_at') required final String createdAt,
    @JsonKey(name: 'organization_id') final String? organizationId,
    @JsonKey(name: 'public') final bool public,
    @JsonKey(name: 'session_replay') final bool sessionReplay,
    @JsonKey(name: 'web_vitals') final bool webVitals,
    @JsonKey(name: 'track_errors') final bool trackErrors,
    @JsonKey(name: 'track_outbound') final bool trackOutbound,
    @JsonKey(name: 'is_owner') final bool isOwner,
    @JsonKey(name: 'sessions_last_24_hours') final int? sessionsLast24Hours,
    final List<String>? tags,
  }) = _$SiteImpl;

  factory _Site.fromJson(Map<String, dynamic> json) = _$SiteImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'site_id')
  int get siteId;
  @override
  String get name;
  @override
  String get domain;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'organization_id')
  String? get organizationId;
  @override
  @JsonKey(name: 'public')
  bool get public;
  @override
  @JsonKey(name: 'session_replay')
  bool get sessionReplay;
  @override
  @JsonKey(name: 'web_vitals')
  bool get webVitals;
  @override
  @JsonKey(name: 'track_errors')
  bool get trackErrors;
  @override
  @JsonKey(name: 'track_outbound')
  bool get trackOutbound;
  @override
  @JsonKey(name: 'is_owner')
  bool get isOwner;
  @override
  @JsonKey(name: 'sessions_last_24_hours')
  int? get sessionsLast24Hours;
  @override
  List<String>? get tags;

  /// Create a copy of Site
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteImplCopyWith<_$SiteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
