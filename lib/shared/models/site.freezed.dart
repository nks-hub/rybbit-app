// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'site.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Site {

 String get id;@JsonKey(name: 'site_id') int get siteId; String get name; String get domain;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'organization_id') String? get organizationId;@JsonKey(name: 'public') bool get public;@JsonKey(name: 'session_replay') bool get sessionReplay;@JsonKey(name: 'web_vitals') bool get webVitals;@JsonKey(name: 'track_errors') bool get trackErrors;@JsonKey(name: 'track_outbound') bool get trackOutbound;@JsonKey(name: 'is_owner') bool get isOwner;@JsonKey(name: 'sessions_last_24_hours') int? get sessionsLast24Hours; String get type; List<String>? get tags;
/// Create a copy of Site
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SiteCopyWith<Site> get copyWith => _$SiteCopyWithImpl<Site>(this as Site, _$identity);

  /// Serializes this Site to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Site&&(identical(other.id, id) || other.id == id)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.public, public) || other.public == public)&&(identical(other.sessionReplay, sessionReplay) || other.sessionReplay == sessionReplay)&&(identical(other.webVitals, webVitals) || other.webVitals == webVitals)&&(identical(other.trackErrors, trackErrors) || other.trackErrors == trackErrors)&&(identical(other.trackOutbound, trackOutbound) || other.trackOutbound == trackOutbound)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.sessionsLast24Hours, sessionsLast24Hours) || other.sessionsLast24Hours == sessionsLast24Hours)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,siteId,name,domain,createdAt,organizationId,public,sessionReplay,webVitals,trackErrors,trackOutbound,isOwner,sessionsLast24Hours,type,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Site(id: $id, siteId: $siteId, name: $name, domain: $domain, createdAt: $createdAt, organizationId: $organizationId, public: $public, sessionReplay: $sessionReplay, webVitals: $webVitals, trackErrors: $trackErrors, trackOutbound: $trackOutbound, isOwner: $isOwner, sessionsLast24Hours: $sessionsLast24Hours, type: $type, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $SiteCopyWith<$Res>  {
  factory $SiteCopyWith(Site value, $Res Function(Site) _then) = _$SiteCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'site_id') int siteId, String name, String domain,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'public') bool public,@JsonKey(name: 'session_replay') bool sessionReplay,@JsonKey(name: 'web_vitals') bool webVitals,@JsonKey(name: 'track_errors') bool trackErrors,@JsonKey(name: 'track_outbound') bool trackOutbound,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'sessions_last_24_hours') int? sessionsLast24Hours, String type, List<String>? tags
});




}
/// @nodoc
class _$SiteCopyWithImpl<$Res>
    implements $SiteCopyWith<$Res> {
  _$SiteCopyWithImpl(this._self, this._then);

  final Site _self;
  final $Res Function(Site) _then;

/// Create a copy of Site
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? siteId = null,Object? name = null,Object? domain = null,Object? createdAt = null,Object? organizationId = freezed,Object? public = null,Object? sessionReplay = null,Object? webVitals = null,Object? trackErrors = null,Object? trackOutbound = null,Object? isOwner = null,Object? sessionsLast24Hours = freezed,Object? type = null,Object? tags = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,public: null == public ? _self.public : public // ignore: cast_nullable_to_non_nullable
as bool,sessionReplay: null == sessionReplay ? _self.sessionReplay : sessionReplay // ignore: cast_nullable_to_non_nullable
as bool,webVitals: null == webVitals ? _self.webVitals : webVitals // ignore: cast_nullable_to_non_nullable
as bool,trackErrors: null == trackErrors ? _self.trackErrors : trackErrors // ignore: cast_nullable_to_non_nullable
as bool,trackOutbound: null == trackOutbound ? _self.trackOutbound : trackOutbound // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,sessionsLast24Hours: freezed == sessionsLast24Hours ? _self.sessionsLast24Hours : sessionsLast24Hours // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Site].
extension SitePatterns on Site {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Site value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Site() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Site value)  $default,){
final _that = this;
switch (_that) {
case _Site():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Site value)?  $default,){
final _that = this;
switch (_that) {
case _Site() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'site_id')  int siteId,  String name,  String domain, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'public')  bool public, @JsonKey(name: 'session_replay')  bool sessionReplay, @JsonKey(name: 'web_vitals')  bool webVitals, @JsonKey(name: 'track_errors')  bool trackErrors, @JsonKey(name: 'track_outbound')  bool trackOutbound, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'sessions_last_24_hours')  int? sessionsLast24Hours,  String type,  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Site() when $default != null:
return $default(_that.id,_that.siteId,_that.name,_that.domain,_that.createdAt,_that.organizationId,_that.public,_that.sessionReplay,_that.webVitals,_that.trackErrors,_that.trackOutbound,_that.isOwner,_that.sessionsLast24Hours,_that.type,_that.tags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'site_id')  int siteId,  String name,  String domain, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'public')  bool public, @JsonKey(name: 'session_replay')  bool sessionReplay, @JsonKey(name: 'web_vitals')  bool webVitals, @JsonKey(name: 'track_errors')  bool trackErrors, @JsonKey(name: 'track_outbound')  bool trackOutbound, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'sessions_last_24_hours')  int? sessionsLast24Hours,  String type,  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _Site():
return $default(_that.id,_that.siteId,_that.name,_that.domain,_that.createdAt,_that.organizationId,_that.public,_that.sessionReplay,_that.webVitals,_that.trackErrors,_that.trackOutbound,_that.isOwner,_that.sessionsLast24Hours,_that.type,_that.tags);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'site_id')  int siteId,  String name,  String domain, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'organization_id')  String? organizationId, @JsonKey(name: 'public')  bool public, @JsonKey(name: 'session_replay')  bool sessionReplay, @JsonKey(name: 'web_vitals')  bool webVitals, @JsonKey(name: 'track_errors')  bool trackErrors, @JsonKey(name: 'track_outbound')  bool trackOutbound, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'sessions_last_24_hours')  int? sessionsLast24Hours,  String type,  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _Site() when $default != null:
return $default(_that.id,_that.siteId,_that.name,_that.domain,_that.createdAt,_that.organizationId,_that.public,_that.sessionReplay,_that.webVitals,_that.trackErrors,_that.trackOutbound,_that.isOwner,_that.sessionsLast24Hours,_that.type,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Site implements Site {
  const _Site({required this.id, @JsonKey(name: 'site_id') required this.siteId, required this.name, required this.domain, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'organization_id') this.organizationId, @JsonKey(name: 'public') this.public = false, @JsonKey(name: 'session_replay') this.sessionReplay = false, @JsonKey(name: 'web_vitals') this.webVitals = false, @JsonKey(name: 'track_errors') this.trackErrors = false, @JsonKey(name: 'track_outbound') this.trackOutbound = false, @JsonKey(name: 'is_owner') this.isOwner = false, @JsonKey(name: 'sessions_last_24_hours') this.sessionsLast24Hours, this.type = 'web', final  List<String>? tags}): _tags = tags;
  factory _Site.fromJson(Map<String, dynamic> json) => _$SiteFromJson(json);

@override final  String id;
@override@JsonKey(name: 'site_id') final  int siteId;
@override final  String name;
@override final  String domain;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'organization_id') final  String? organizationId;
@override@JsonKey(name: 'public') final  bool public;
@override@JsonKey(name: 'session_replay') final  bool sessionReplay;
@override@JsonKey(name: 'web_vitals') final  bool webVitals;
@override@JsonKey(name: 'track_errors') final  bool trackErrors;
@override@JsonKey(name: 'track_outbound') final  bool trackOutbound;
@override@JsonKey(name: 'is_owner') final  bool isOwner;
@override@JsonKey(name: 'sessions_last_24_hours') final  int? sessionsLast24Hours;
@override@JsonKey() final  String type;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Site
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SiteCopyWith<_Site> get copyWith => __$SiteCopyWithImpl<_Site>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SiteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Site&&(identical(other.id, id) || other.id == id)&&(identical(other.siteId, siteId) || other.siteId == siteId)&&(identical(other.name, name) || other.name == name)&&(identical(other.domain, domain) || other.domain == domain)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.organizationId, organizationId) || other.organizationId == organizationId)&&(identical(other.public, public) || other.public == public)&&(identical(other.sessionReplay, sessionReplay) || other.sessionReplay == sessionReplay)&&(identical(other.webVitals, webVitals) || other.webVitals == webVitals)&&(identical(other.trackErrors, trackErrors) || other.trackErrors == trackErrors)&&(identical(other.trackOutbound, trackOutbound) || other.trackOutbound == trackOutbound)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.sessionsLast24Hours, sessionsLast24Hours) || other.sessionsLast24Hours == sessionsLast24Hours)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,siteId,name,domain,createdAt,organizationId,public,sessionReplay,webVitals,trackErrors,trackOutbound,isOwner,sessionsLast24Hours,type,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Site(id: $id, siteId: $siteId, name: $name, domain: $domain, createdAt: $createdAt, organizationId: $organizationId, public: $public, sessionReplay: $sessionReplay, webVitals: $webVitals, trackErrors: $trackErrors, trackOutbound: $trackOutbound, isOwner: $isOwner, sessionsLast24Hours: $sessionsLast24Hours, type: $type, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$SiteCopyWith<$Res> implements $SiteCopyWith<$Res> {
  factory _$SiteCopyWith(_Site value, $Res Function(_Site) _then) = __$SiteCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'site_id') int siteId, String name, String domain,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'organization_id') String? organizationId,@JsonKey(name: 'public') bool public,@JsonKey(name: 'session_replay') bool sessionReplay,@JsonKey(name: 'web_vitals') bool webVitals,@JsonKey(name: 'track_errors') bool trackErrors,@JsonKey(name: 'track_outbound') bool trackOutbound,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'sessions_last_24_hours') int? sessionsLast24Hours, String type, List<String>? tags
});




}
/// @nodoc
class __$SiteCopyWithImpl<$Res>
    implements _$SiteCopyWith<$Res> {
  __$SiteCopyWithImpl(this._self, this._then);

  final _Site _self;
  final $Res Function(_Site) _then;

/// Create a copy of Site
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? siteId = null,Object? name = null,Object? domain = null,Object? createdAt = null,Object? organizationId = freezed,Object? public = null,Object? sessionReplay = null,Object? webVitals = null,Object? trackErrors = null,Object? trackOutbound = null,Object? isOwner = null,Object? sessionsLast24Hours = freezed,Object? type = null,Object? tags = freezed,}) {
  return _then(_Site(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,siteId: null == siteId ? _self.siteId : siteId // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,domain: null == domain ? _self.domain : domain // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,organizationId: freezed == organizationId ? _self.organizationId : organizationId // ignore: cast_nullable_to_non_nullable
as String?,public: null == public ? _self.public : public // ignore: cast_nullable_to_non_nullable
as bool,sessionReplay: null == sessionReplay ? _self.sessionReplay : sessionReplay // ignore: cast_nullable_to_non_nullable
as bool,webVitals: null == webVitals ? _self.webVitals : webVitals // ignore: cast_nullable_to_non_nullable
as bool,trackErrors: null == trackErrors ? _self.trackErrors : trackErrors // ignore: cast_nullable_to_non_nullable
as bool,trackOutbound: null == trackOutbound ? _self.trackOutbound : trackOutbound // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,sessionsLast24Hours: freezed == sessionsLast24Hours ? _self.sessionsLast24Hours : sessionsLast24Hours // ignore: cast_nullable_to_non_nullable
as int?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
