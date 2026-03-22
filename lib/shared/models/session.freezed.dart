// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AnalyticsSession {

@JsonKey(name: 'session_id', fromJson: _toStringRequired) String get sessionId;@JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? get userId;@JsonKey(fromJson: _toStringOrNull) String? get country;@JsonKey(fromJson: _toStringOrNull) String? get region;@JsonKey(fromJson: _toStringOrNull) String? get city;@JsonKey(fromJson: _toStringOrNull) String? get language;@JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? get deviceType;@JsonKey(fromJson: _toStringOrNull) String? get browser;@JsonKey(name: 'browser_version', fromJson: _toStringOrNull) String? get browserVersion;@JsonKey(name: 'operating_system', fromJson: _toStringOrNull) String? get operatingSystem;@JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) String? get osVersion;@JsonKey(fromJson: _toStringOrNull) String? get referrer;@JsonKey(fromJson: _toStringOrNull) String? get channel;@JsonKey(fromJson: _toStringOrNull) String? get hostname;@JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? get entryPage;@JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? get exitPage;@JsonKey(name: 'session_start', fromJson: _toStringOrNull) String? get sessionStart;@JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? get sessionEnd;@JsonKey(name: 'session_duration') num get sessionDuration; int get pageviews; int get events; int get errors;@JsonKey(name: 'has_replay') int get hasReplay;@JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? get utmSource;@JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? get utmMedium;@JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) String? get utmCampaign;@JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull) String? get identifiedUserId;@JsonKey(fromJson: _traitsFromJson) Map<String, dynamic>? get traits;@JsonKey(name: 'app_version', fromJson: _toStringOrNull) String? get appVersion;@JsonKey(name: 'device_model', fromJson: _toStringOrNull) String? get deviceModel;
/// Create a copy of AnalyticsSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnalyticsSessionCopyWith<AnalyticsSession> get copyWith => _$AnalyticsSessionCopyWithImpl<AnalyticsSession>(this as AnalyticsSession, _$identity);

  /// Serializes this AnalyticsSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnalyticsSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.language, language) || other.language == language)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.browser, browser) || other.browser == browser)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.referrer, referrer) || other.referrer == referrer)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.entryPage, entryPage) || other.entryPage == entryPage)&&(identical(other.exitPage, exitPage) || other.exitPage == exitPage)&&(identical(other.sessionStart, sessionStart) || other.sessionStart == sessionStart)&&(identical(other.sessionEnd, sessionEnd) || other.sessionEnd == sessionEnd)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.events, events) || other.events == events)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.hasReplay, hasReplay) || other.hasReplay == hasReplay)&&(identical(other.utmSource, utmSource) || other.utmSource == utmSource)&&(identical(other.utmMedium, utmMedium) || other.utmMedium == utmMedium)&&(identical(other.utmCampaign, utmCampaign) || other.utmCampaign == utmCampaign)&&(identical(other.identifiedUserId, identifiedUserId) || other.identifiedUserId == identifiedUserId)&&const DeepCollectionEquality().equals(other.traits, traits)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,sessionId,userId,country,region,city,language,deviceType,browser,browserVersion,operatingSystem,osVersion,referrer,channel,hostname,entryPage,exitPage,sessionStart,sessionEnd,sessionDuration,pageviews,events,errors,hasReplay,utmSource,utmMedium,utmCampaign,identifiedUserId,const DeepCollectionEquality().hash(traits),appVersion,deviceModel]);

@override
String toString() {
  return 'AnalyticsSession(sessionId: $sessionId, userId: $userId, country: $country, region: $region, city: $city, language: $language, deviceType: $deviceType, browser: $browser, browserVersion: $browserVersion, operatingSystem: $operatingSystem, osVersion: $osVersion, referrer: $referrer, channel: $channel, hostname: $hostname, entryPage: $entryPage, exitPage: $exitPage, sessionStart: $sessionStart, sessionEnd: $sessionEnd, sessionDuration: $sessionDuration, pageviews: $pageviews, events: $events, errors: $errors, hasReplay: $hasReplay, utmSource: $utmSource, utmMedium: $utmMedium, utmCampaign: $utmCampaign, identifiedUserId: $identifiedUserId, traits: $traits, appVersion: $appVersion, deviceModel: $deviceModel)';
}


}

/// @nodoc
abstract mixin class $AnalyticsSessionCopyWith<$Res>  {
  factory $AnalyticsSessionCopyWith(AnalyticsSession value, $Res Function(AnalyticsSession) _then) = _$AnalyticsSessionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id', fromJson: _toStringRequired) String sessionId,@JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? userId,@JsonKey(fromJson: _toStringOrNull) String? country,@JsonKey(fromJson: _toStringOrNull) String? region,@JsonKey(fromJson: _toStringOrNull) String? city,@JsonKey(fromJson: _toStringOrNull) String? language,@JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? deviceType,@JsonKey(fromJson: _toStringOrNull) String? browser,@JsonKey(name: 'browser_version', fromJson: _toStringOrNull) String? browserVersion,@JsonKey(name: 'operating_system', fromJson: _toStringOrNull) String? operatingSystem,@JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) String? osVersion,@JsonKey(fromJson: _toStringOrNull) String? referrer,@JsonKey(fromJson: _toStringOrNull) String? channel,@JsonKey(fromJson: _toStringOrNull) String? hostname,@JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? entryPage,@JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? exitPage,@JsonKey(name: 'session_start', fromJson: _toStringOrNull) String? sessionStart,@JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? sessionEnd,@JsonKey(name: 'session_duration') num sessionDuration, int pageviews, int events, int errors,@JsonKey(name: 'has_replay') int hasReplay,@JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? utmSource,@JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? utmMedium,@JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) String? utmCampaign,@JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull) String? identifiedUserId,@JsonKey(fromJson: _traitsFromJson) Map<String, dynamic>? traits,@JsonKey(name: 'app_version', fromJson: _toStringOrNull) String? appVersion,@JsonKey(name: 'device_model', fromJson: _toStringOrNull) String? deviceModel
});




}
/// @nodoc
class _$AnalyticsSessionCopyWithImpl<$Res>
    implements $AnalyticsSessionCopyWith<$Res> {
  _$AnalyticsSessionCopyWithImpl(this._self, this._then);

  final AnalyticsSession _self;
  final $Res Function(AnalyticsSession) _then;

/// Create a copy of AnalyticsSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? userId = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? language = freezed,Object? deviceType = freezed,Object? browser = freezed,Object? browserVersion = freezed,Object? operatingSystem = freezed,Object? osVersion = freezed,Object? referrer = freezed,Object? channel = freezed,Object? hostname = freezed,Object? entryPage = freezed,Object? exitPage = freezed,Object? sessionStart = freezed,Object? sessionEnd = freezed,Object? sessionDuration = null,Object? pageviews = null,Object? events = null,Object? errors = null,Object? hasReplay = null,Object? utmSource = freezed,Object? utmMedium = freezed,Object? utmCampaign = freezed,Object? identifiedUserId = freezed,Object? traits = freezed,Object? appVersion = freezed,Object? deviceModel = freezed,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,browser: freezed == browser ? _self.browser : browser // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,operatingSystem: freezed == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,referrer: freezed == referrer ? _self.referrer : referrer // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,hostname: freezed == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String?,entryPage: freezed == entryPage ? _self.entryPage : entryPage // ignore: cast_nullable_to_non_nullable
as String?,exitPage: freezed == exitPage ? _self.exitPage : exitPage // ignore: cast_nullable_to_non_nullable
as String?,sessionStart: freezed == sessionStart ? _self.sessionStart : sessionStart // ignore: cast_nullable_to_non_nullable
as String?,sessionEnd: freezed == sessionEnd ? _self.sessionEnd : sessionEnd // ignore: cast_nullable_to_non_nullable
as String?,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as num,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as int,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as int,hasReplay: null == hasReplay ? _self.hasReplay : hasReplay // ignore: cast_nullable_to_non_nullable
as int,utmSource: freezed == utmSource ? _self.utmSource : utmSource // ignore: cast_nullable_to_non_nullable
as String?,utmMedium: freezed == utmMedium ? _self.utmMedium : utmMedium // ignore: cast_nullable_to_non_nullable
as String?,utmCampaign: freezed == utmCampaign ? _self.utmCampaign : utmCampaign // ignore: cast_nullable_to_non_nullable
as String?,identifiedUserId: freezed == identifiedUserId ? _self.identifiedUserId : identifiedUserId // ignore: cast_nullable_to_non_nullable
as String?,traits: freezed == traits ? _self.traits : traits // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AnalyticsSession].
extension AnalyticsSessionPatterns on AnalyticsSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AnalyticsSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AnalyticsSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AnalyticsSession value)  $default,){
final _that = this;
switch (_that) {
case _AnalyticsSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AnalyticsSession value)?  $default,){
final _that = this;
switch (_that) {
case _AnalyticsSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id', fromJson: _toStringRequired)  String sessionId, @JsonKey(name: 'user_id', fromJson: _toStringOrNull)  String? userId, @JsonKey(fromJson: _toStringOrNull)  String? country, @JsonKey(fromJson: _toStringOrNull)  String? region, @JsonKey(fromJson: _toStringOrNull)  String? city, @JsonKey(fromJson: _toStringOrNull)  String? language, @JsonKey(name: 'device_type', fromJson: _toStringOrNull)  String? deviceType, @JsonKey(fromJson: _toStringOrNull)  String? browser, @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)  String? browserVersion, @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)  String? operatingSystem, @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)  String? osVersion, @JsonKey(fromJson: _toStringOrNull)  String? referrer, @JsonKey(fromJson: _toStringOrNull)  String? channel, @JsonKey(fromJson: _toStringOrNull)  String? hostname, @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)  String? entryPage, @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)  String? exitPage, @JsonKey(name: 'session_start', fromJson: _toStringOrNull)  String? sessionStart, @JsonKey(name: 'session_end', fromJson: _toStringOrNull)  String? sessionEnd, @JsonKey(name: 'session_duration')  num sessionDuration,  int pageviews,  int events,  int errors, @JsonKey(name: 'has_replay')  int hasReplay, @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)  String? utmSource, @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)  String? utmMedium, @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)  String? utmCampaign, @JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull)  String? identifiedUserId, @JsonKey(fromJson: _traitsFromJson)  Map<String, dynamic>? traits, @JsonKey(name: 'app_version', fromJson: _toStringOrNull)  String? appVersion, @JsonKey(name: 'device_model', fromJson: _toStringOrNull)  String? deviceModel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AnalyticsSession() when $default != null:
return $default(_that.sessionId,_that.userId,_that.country,_that.region,_that.city,_that.language,_that.deviceType,_that.browser,_that.browserVersion,_that.operatingSystem,_that.osVersion,_that.referrer,_that.channel,_that.hostname,_that.entryPage,_that.exitPage,_that.sessionStart,_that.sessionEnd,_that.sessionDuration,_that.pageviews,_that.events,_that.errors,_that.hasReplay,_that.utmSource,_that.utmMedium,_that.utmCampaign,_that.identifiedUserId,_that.traits,_that.appVersion,_that.deviceModel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id', fromJson: _toStringRequired)  String sessionId, @JsonKey(name: 'user_id', fromJson: _toStringOrNull)  String? userId, @JsonKey(fromJson: _toStringOrNull)  String? country, @JsonKey(fromJson: _toStringOrNull)  String? region, @JsonKey(fromJson: _toStringOrNull)  String? city, @JsonKey(fromJson: _toStringOrNull)  String? language, @JsonKey(name: 'device_type', fromJson: _toStringOrNull)  String? deviceType, @JsonKey(fromJson: _toStringOrNull)  String? browser, @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)  String? browserVersion, @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)  String? operatingSystem, @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)  String? osVersion, @JsonKey(fromJson: _toStringOrNull)  String? referrer, @JsonKey(fromJson: _toStringOrNull)  String? channel, @JsonKey(fromJson: _toStringOrNull)  String? hostname, @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)  String? entryPage, @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)  String? exitPage, @JsonKey(name: 'session_start', fromJson: _toStringOrNull)  String? sessionStart, @JsonKey(name: 'session_end', fromJson: _toStringOrNull)  String? sessionEnd, @JsonKey(name: 'session_duration')  num sessionDuration,  int pageviews,  int events,  int errors, @JsonKey(name: 'has_replay')  int hasReplay, @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)  String? utmSource, @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)  String? utmMedium, @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)  String? utmCampaign, @JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull)  String? identifiedUserId, @JsonKey(fromJson: _traitsFromJson)  Map<String, dynamic>? traits, @JsonKey(name: 'app_version', fromJson: _toStringOrNull)  String? appVersion, @JsonKey(name: 'device_model', fromJson: _toStringOrNull)  String? deviceModel)  $default,) {final _that = this;
switch (_that) {
case _AnalyticsSession():
return $default(_that.sessionId,_that.userId,_that.country,_that.region,_that.city,_that.language,_that.deviceType,_that.browser,_that.browserVersion,_that.operatingSystem,_that.osVersion,_that.referrer,_that.channel,_that.hostname,_that.entryPage,_that.exitPage,_that.sessionStart,_that.sessionEnd,_that.sessionDuration,_that.pageviews,_that.events,_that.errors,_that.hasReplay,_that.utmSource,_that.utmMedium,_that.utmCampaign,_that.identifiedUserId,_that.traits,_that.appVersion,_that.deviceModel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id', fromJson: _toStringRequired)  String sessionId, @JsonKey(name: 'user_id', fromJson: _toStringOrNull)  String? userId, @JsonKey(fromJson: _toStringOrNull)  String? country, @JsonKey(fromJson: _toStringOrNull)  String? region, @JsonKey(fromJson: _toStringOrNull)  String? city, @JsonKey(fromJson: _toStringOrNull)  String? language, @JsonKey(name: 'device_type', fromJson: _toStringOrNull)  String? deviceType, @JsonKey(fromJson: _toStringOrNull)  String? browser, @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)  String? browserVersion, @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)  String? operatingSystem, @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)  String? osVersion, @JsonKey(fromJson: _toStringOrNull)  String? referrer, @JsonKey(fromJson: _toStringOrNull)  String? channel, @JsonKey(fromJson: _toStringOrNull)  String? hostname, @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)  String? entryPage, @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)  String? exitPage, @JsonKey(name: 'session_start', fromJson: _toStringOrNull)  String? sessionStart, @JsonKey(name: 'session_end', fromJson: _toStringOrNull)  String? sessionEnd, @JsonKey(name: 'session_duration')  num sessionDuration,  int pageviews,  int events,  int errors, @JsonKey(name: 'has_replay')  int hasReplay, @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)  String? utmSource, @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)  String? utmMedium, @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)  String? utmCampaign, @JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull)  String? identifiedUserId, @JsonKey(fromJson: _traitsFromJson)  Map<String, dynamic>? traits, @JsonKey(name: 'app_version', fromJson: _toStringOrNull)  String? appVersion, @JsonKey(name: 'device_model', fromJson: _toStringOrNull)  String? deviceModel)?  $default,) {final _that = this;
switch (_that) {
case _AnalyticsSession() when $default != null:
return $default(_that.sessionId,_that.userId,_that.country,_that.region,_that.city,_that.language,_that.deviceType,_that.browser,_that.browserVersion,_that.operatingSystem,_that.osVersion,_that.referrer,_that.channel,_that.hostname,_that.entryPage,_that.exitPage,_that.sessionStart,_that.sessionEnd,_that.sessionDuration,_that.pageviews,_that.events,_that.errors,_that.hasReplay,_that.utmSource,_that.utmMedium,_that.utmCampaign,_that.identifiedUserId,_that.traits,_that.appVersion,_that.deviceModel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AnalyticsSession implements AnalyticsSession {
  const _AnalyticsSession({@JsonKey(name: 'session_id', fromJson: _toStringRequired) required this.sessionId, @JsonKey(name: 'user_id', fromJson: _toStringOrNull) this.userId, @JsonKey(fromJson: _toStringOrNull) this.country, @JsonKey(fromJson: _toStringOrNull) this.region, @JsonKey(fromJson: _toStringOrNull) this.city, @JsonKey(fromJson: _toStringOrNull) this.language, @JsonKey(name: 'device_type', fromJson: _toStringOrNull) this.deviceType, @JsonKey(fromJson: _toStringOrNull) this.browser, @JsonKey(name: 'browser_version', fromJson: _toStringOrNull) this.browserVersion, @JsonKey(name: 'operating_system', fromJson: _toStringOrNull) this.operatingSystem, @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) this.osVersion, @JsonKey(fromJson: _toStringOrNull) this.referrer, @JsonKey(fromJson: _toStringOrNull) this.channel, @JsonKey(fromJson: _toStringOrNull) this.hostname, @JsonKey(name: 'entry_page', fromJson: _toStringOrNull) this.entryPage, @JsonKey(name: 'exit_page', fromJson: _toStringOrNull) this.exitPage, @JsonKey(name: 'session_start', fromJson: _toStringOrNull) this.sessionStart, @JsonKey(name: 'session_end', fromJson: _toStringOrNull) this.sessionEnd, @JsonKey(name: 'session_duration') this.sessionDuration = 0, this.pageviews = 0, this.events = 0, this.errors = 0, @JsonKey(name: 'has_replay') this.hasReplay = 0, @JsonKey(name: 'utm_source', fromJson: _toStringOrNull) this.utmSource, @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) this.utmMedium, @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) this.utmCampaign, @JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull) this.identifiedUserId, @JsonKey(fromJson: _traitsFromJson) final  Map<String, dynamic>? traits, @JsonKey(name: 'app_version', fromJson: _toStringOrNull) this.appVersion, @JsonKey(name: 'device_model', fromJson: _toStringOrNull) this.deviceModel}): _traits = traits;
  factory _AnalyticsSession.fromJson(Map<String, dynamic> json) => _$AnalyticsSessionFromJson(json);

@override@JsonKey(name: 'session_id', fromJson: _toStringRequired) final  String sessionId;
@override@JsonKey(name: 'user_id', fromJson: _toStringOrNull) final  String? userId;
@override@JsonKey(fromJson: _toStringOrNull) final  String? country;
@override@JsonKey(fromJson: _toStringOrNull) final  String? region;
@override@JsonKey(fromJson: _toStringOrNull) final  String? city;
@override@JsonKey(fromJson: _toStringOrNull) final  String? language;
@override@JsonKey(name: 'device_type', fromJson: _toStringOrNull) final  String? deviceType;
@override@JsonKey(fromJson: _toStringOrNull) final  String? browser;
@override@JsonKey(name: 'browser_version', fromJson: _toStringOrNull) final  String? browserVersion;
@override@JsonKey(name: 'operating_system', fromJson: _toStringOrNull) final  String? operatingSystem;
@override@JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) final  String? osVersion;
@override@JsonKey(fromJson: _toStringOrNull) final  String? referrer;
@override@JsonKey(fromJson: _toStringOrNull) final  String? channel;
@override@JsonKey(fromJson: _toStringOrNull) final  String? hostname;
@override@JsonKey(name: 'entry_page', fromJson: _toStringOrNull) final  String? entryPage;
@override@JsonKey(name: 'exit_page', fromJson: _toStringOrNull) final  String? exitPage;
@override@JsonKey(name: 'session_start', fromJson: _toStringOrNull) final  String? sessionStart;
@override@JsonKey(name: 'session_end', fromJson: _toStringOrNull) final  String? sessionEnd;
@override@JsonKey(name: 'session_duration') final  num sessionDuration;
@override@JsonKey() final  int pageviews;
@override@JsonKey() final  int events;
@override@JsonKey() final  int errors;
@override@JsonKey(name: 'has_replay') final  int hasReplay;
@override@JsonKey(name: 'utm_source', fromJson: _toStringOrNull) final  String? utmSource;
@override@JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) final  String? utmMedium;
@override@JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) final  String? utmCampaign;
@override@JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull) final  String? identifiedUserId;
 final  Map<String, dynamic>? _traits;
@override@JsonKey(fromJson: _traitsFromJson) Map<String, dynamic>? get traits {
  final value = _traits;
  if (value == null) return null;
  if (_traits is EqualUnmodifiableMapView) return _traits;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'app_version', fromJson: _toStringOrNull) final  String? appVersion;
@override@JsonKey(name: 'device_model', fromJson: _toStringOrNull) final  String? deviceModel;

/// Create a copy of AnalyticsSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnalyticsSessionCopyWith<_AnalyticsSession> get copyWith => __$AnalyticsSessionCopyWithImpl<_AnalyticsSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnalyticsSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AnalyticsSession&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.language, language) || other.language == language)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType)&&(identical(other.browser, browser) || other.browser == browser)&&(identical(other.browserVersion, browserVersion) || other.browserVersion == browserVersion)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.referrer, referrer) || other.referrer == referrer)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.hostname, hostname) || other.hostname == hostname)&&(identical(other.entryPage, entryPage) || other.entryPage == entryPage)&&(identical(other.exitPage, exitPage) || other.exitPage == exitPage)&&(identical(other.sessionStart, sessionStart) || other.sessionStart == sessionStart)&&(identical(other.sessionEnd, sessionEnd) || other.sessionEnd == sessionEnd)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.events, events) || other.events == events)&&(identical(other.errors, errors) || other.errors == errors)&&(identical(other.hasReplay, hasReplay) || other.hasReplay == hasReplay)&&(identical(other.utmSource, utmSource) || other.utmSource == utmSource)&&(identical(other.utmMedium, utmMedium) || other.utmMedium == utmMedium)&&(identical(other.utmCampaign, utmCampaign) || other.utmCampaign == utmCampaign)&&(identical(other.identifiedUserId, identifiedUserId) || other.identifiedUserId == identifiedUserId)&&const DeepCollectionEquality().equals(other._traits, _traits)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,sessionId,userId,country,region,city,language,deviceType,browser,browserVersion,operatingSystem,osVersion,referrer,channel,hostname,entryPage,exitPage,sessionStart,sessionEnd,sessionDuration,pageviews,events,errors,hasReplay,utmSource,utmMedium,utmCampaign,identifiedUserId,const DeepCollectionEquality().hash(_traits),appVersion,deviceModel]);

@override
String toString() {
  return 'AnalyticsSession(sessionId: $sessionId, userId: $userId, country: $country, region: $region, city: $city, language: $language, deviceType: $deviceType, browser: $browser, browserVersion: $browserVersion, operatingSystem: $operatingSystem, osVersion: $osVersion, referrer: $referrer, channel: $channel, hostname: $hostname, entryPage: $entryPage, exitPage: $exitPage, sessionStart: $sessionStart, sessionEnd: $sessionEnd, sessionDuration: $sessionDuration, pageviews: $pageviews, events: $events, errors: $errors, hasReplay: $hasReplay, utmSource: $utmSource, utmMedium: $utmMedium, utmCampaign: $utmCampaign, identifiedUserId: $identifiedUserId, traits: $traits, appVersion: $appVersion, deviceModel: $deviceModel)';
}


}

/// @nodoc
abstract mixin class _$AnalyticsSessionCopyWith<$Res> implements $AnalyticsSessionCopyWith<$Res> {
  factory _$AnalyticsSessionCopyWith(_AnalyticsSession value, $Res Function(_AnalyticsSession) _then) = __$AnalyticsSessionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id', fromJson: _toStringRequired) String sessionId,@JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? userId,@JsonKey(fromJson: _toStringOrNull) String? country,@JsonKey(fromJson: _toStringOrNull) String? region,@JsonKey(fromJson: _toStringOrNull) String? city,@JsonKey(fromJson: _toStringOrNull) String? language,@JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? deviceType,@JsonKey(fromJson: _toStringOrNull) String? browser,@JsonKey(name: 'browser_version', fromJson: _toStringOrNull) String? browserVersion,@JsonKey(name: 'operating_system', fromJson: _toStringOrNull) String? operatingSystem,@JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull) String? osVersion,@JsonKey(fromJson: _toStringOrNull) String? referrer,@JsonKey(fromJson: _toStringOrNull) String? channel,@JsonKey(fromJson: _toStringOrNull) String? hostname,@JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? entryPage,@JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? exitPage,@JsonKey(name: 'session_start', fromJson: _toStringOrNull) String? sessionStart,@JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? sessionEnd,@JsonKey(name: 'session_duration') num sessionDuration, int pageviews, int events, int errors,@JsonKey(name: 'has_replay') int hasReplay,@JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? utmSource,@JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? utmMedium,@JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) String? utmCampaign,@JsonKey(name: 'identified_user_id', fromJson: _toStringOrNull) String? identifiedUserId,@JsonKey(fromJson: _traitsFromJson) Map<String, dynamic>? traits,@JsonKey(name: 'app_version', fromJson: _toStringOrNull) String? appVersion,@JsonKey(name: 'device_model', fromJson: _toStringOrNull) String? deviceModel
});




}
/// @nodoc
class __$AnalyticsSessionCopyWithImpl<$Res>
    implements _$AnalyticsSessionCopyWith<$Res> {
  __$AnalyticsSessionCopyWithImpl(this._self, this._then);

  final _AnalyticsSession _self;
  final $Res Function(_AnalyticsSession) _then;

/// Create a copy of AnalyticsSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? userId = freezed,Object? country = freezed,Object? region = freezed,Object? city = freezed,Object? language = freezed,Object? deviceType = freezed,Object? browser = freezed,Object? browserVersion = freezed,Object? operatingSystem = freezed,Object? osVersion = freezed,Object? referrer = freezed,Object? channel = freezed,Object? hostname = freezed,Object? entryPage = freezed,Object? exitPage = freezed,Object? sessionStart = freezed,Object? sessionEnd = freezed,Object? sessionDuration = null,Object? pageviews = null,Object? events = null,Object? errors = null,Object? hasReplay = null,Object? utmSource = freezed,Object? utmMedium = freezed,Object? utmCampaign = freezed,Object? identifiedUserId = freezed,Object? traits = freezed,Object? appVersion = freezed,Object? deviceModel = freezed,}) {
  return _then(_AnalyticsSession(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,deviceType: freezed == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String?,browser: freezed == browser ? _self.browser : browser // ignore: cast_nullable_to_non_nullable
as String?,browserVersion: freezed == browserVersion ? _self.browserVersion : browserVersion // ignore: cast_nullable_to_non_nullable
as String?,operatingSystem: freezed == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as String?,osVersion: freezed == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String?,referrer: freezed == referrer ? _self.referrer : referrer // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String?,hostname: freezed == hostname ? _self.hostname : hostname // ignore: cast_nullable_to_non_nullable
as String?,entryPage: freezed == entryPage ? _self.entryPage : entryPage // ignore: cast_nullable_to_non_nullable
as String?,exitPage: freezed == exitPage ? _self.exitPage : exitPage // ignore: cast_nullable_to_non_nullable
as String?,sessionStart: freezed == sessionStart ? _self.sessionStart : sessionStart // ignore: cast_nullable_to_non_nullable
as String?,sessionEnd: freezed == sessionEnd ? _self.sessionEnd : sessionEnd // ignore: cast_nullable_to_non_nullable
as String?,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as num,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,events: null == events ? _self.events : events // ignore: cast_nullable_to_non_nullable
as int,errors: null == errors ? _self.errors : errors // ignore: cast_nullable_to_non_nullable
as int,hasReplay: null == hasReplay ? _self.hasReplay : hasReplay // ignore: cast_nullable_to_non_nullable
as int,utmSource: freezed == utmSource ? _self.utmSource : utmSource // ignore: cast_nullable_to_non_nullable
as String?,utmMedium: freezed == utmMedium ? _self.utmMedium : utmMedium // ignore: cast_nullable_to_non_nullable
as String?,utmCampaign: freezed == utmCampaign ? _self.utmCampaign : utmCampaign // ignore: cast_nullable_to_non_nullable
as String?,identifiedUserId: freezed == identifiedUserId ? _self.identifiedUserId : identifiedUserId // ignore: cast_nullable_to_non_nullable
as String?,traits: freezed == traits ? _self._traits : traits // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,appVersion: freezed == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String?,deviceModel: freezed == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
