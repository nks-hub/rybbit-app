// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnalyticsSession _$AnalyticsSessionFromJson(Map<String, dynamic> json) {
  return _AnalyticsSession.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsSession {
  @JsonKey(name: 'session_id', fromJson: _toStringRequired)
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id', fromJson: _toStringOrNull)
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get region => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type', fromJson: _toStringOrNull)
  String? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get browser => throw _privateConstructorUsedError;
  @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
  String? get browserVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
  String? get operatingSystem => throw _privateConstructorUsedError;
  @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
  String? get osVersion => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get referrer => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get channel => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _toStringOrNull)
  String? get hostname => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)
  String? get entryPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)
  String? get exitPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
  String? get sessionStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_end', fromJson: _toStringOrNull)
  String? get sessionEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_duration')
  num get sessionDuration => throw _privateConstructorUsedError;
  int get pageviews => throw _privateConstructorUsedError;
  int get events => throw _privateConstructorUsedError;
  int get errors => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_replay')
  int get hasReplay => throw _privateConstructorUsedError;
  @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)
  String? get utmSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)
  String? get utmMedium => throw _privateConstructorUsedError;
  @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
  String? get utmCampaign => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsSession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsSessionCopyWith<AnalyticsSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsSessionCopyWith<$Res> {
  factory $AnalyticsSessionCopyWith(
    AnalyticsSession value,
    $Res Function(AnalyticsSession) then,
  ) = _$AnalyticsSessionCopyWithImpl<$Res, AnalyticsSession>;
  @useResult
  $Res call({
    @JsonKey(name: 'session_id', fromJson: _toStringRequired) String sessionId,
    @JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? userId,
    @JsonKey(fromJson: _toStringOrNull) String? country,
    @JsonKey(fromJson: _toStringOrNull) String? region,
    @JsonKey(fromJson: _toStringOrNull) String? city,
    @JsonKey(fromJson: _toStringOrNull) String? language,
    @JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? deviceType,
    @JsonKey(fromJson: _toStringOrNull) String? browser,
    @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
    String? browserVersion,
    @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
    String? operatingSystem,
    @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
    String? osVersion,
    @JsonKey(fromJson: _toStringOrNull) String? referrer,
    @JsonKey(fromJson: _toStringOrNull) String? channel,
    @JsonKey(fromJson: _toStringOrNull) String? hostname,
    @JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? entryPage,
    @JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? exitPage,
    @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
    String? sessionStart,
    @JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? sessionEnd,
    @JsonKey(name: 'session_duration') num sessionDuration,
    int pageviews,
    int events,
    int errors,
    @JsonKey(name: 'has_replay') int hasReplay,
    @JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? utmSource,
    @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? utmMedium,
    @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
    String? utmCampaign,
  });
}

/// @nodoc
class _$AnalyticsSessionCopyWithImpl<$Res, $Val extends AnalyticsSession>
    implements $AnalyticsSessionCopyWith<$Res> {
  _$AnalyticsSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? language = freezed,
    Object? deviceType = freezed,
    Object? browser = freezed,
    Object? browserVersion = freezed,
    Object? operatingSystem = freezed,
    Object? osVersion = freezed,
    Object? referrer = freezed,
    Object? channel = freezed,
    Object? hostname = freezed,
    Object? entryPage = freezed,
    Object? exitPage = freezed,
    Object? sessionStart = freezed,
    Object? sessionEnd = freezed,
    Object? sessionDuration = null,
    Object? pageviews = null,
    Object? events = null,
    Object? errors = null,
    Object? hasReplay = null,
    Object? utmSource = freezed,
    Object? utmMedium = freezed,
    Object? utmCampaign = freezed,
  }) {
    return _then(
      _value.copyWith(
            sessionId: null == sessionId
                ? _value.sessionId
                : sessionId // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: freezed == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String?,
            country: freezed == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String?,
            region: freezed == region
                ? _value.region
                : region // ignore: cast_nullable_to_non_nullable
                      as String?,
            city: freezed == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                      as String?,
            language: freezed == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String?,
            deviceType: freezed == deviceType
                ? _value.deviceType
                : deviceType // ignore: cast_nullable_to_non_nullable
                      as String?,
            browser: freezed == browser
                ? _value.browser
                : browser // ignore: cast_nullable_to_non_nullable
                      as String?,
            browserVersion: freezed == browserVersion
                ? _value.browserVersion
                : browserVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            operatingSystem: freezed == operatingSystem
                ? _value.operatingSystem
                : operatingSystem // ignore: cast_nullable_to_non_nullable
                      as String?,
            osVersion: freezed == osVersion
                ? _value.osVersion
                : osVersion // ignore: cast_nullable_to_non_nullable
                      as String?,
            referrer: freezed == referrer
                ? _value.referrer
                : referrer // ignore: cast_nullable_to_non_nullable
                      as String?,
            channel: freezed == channel
                ? _value.channel
                : channel // ignore: cast_nullable_to_non_nullable
                      as String?,
            hostname: freezed == hostname
                ? _value.hostname
                : hostname // ignore: cast_nullable_to_non_nullable
                      as String?,
            entryPage: freezed == entryPage
                ? _value.entryPage
                : entryPage // ignore: cast_nullable_to_non_nullable
                      as String?,
            exitPage: freezed == exitPage
                ? _value.exitPage
                : exitPage // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionStart: freezed == sessionStart
                ? _value.sessionStart
                : sessionStart // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionEnd: freezed == sessionEnd
                ? _value.sessionEnd
                : sessionEnd // ignore: cast_nullable_to_non_nullable
                      as String?,
            sessionDuration: null == sessionDuration
                ? _value.sessionDuration
                : sessionDuration // ignore: cast_nullable_to_non_nullable
                      as num,
            pageviews: null == pageviews
                ? _value.pageviews
                : pageviews // ignore: cast_nullable_to_non_nullable
                      as int,
            events: null == events
                ? _value.events
                : events // ignore: cast_nullable_to_non_nullable
                      as int,
            errors: null == errors
                ? _value.errors
                : errors // ignore: cast_nullable_to_non_nullable
                      as int,
            hasReplay: null == hasReplay
                ? _value.hasReplay
                : hasReplay // ignore: cast_nullable_to_non_nullable
                      as int,
            utmSource: freezed == utmSource
                ? _value.utmSource
                : utmSource // ignore: cast_nullable_to_non_nullable
                      as String?,
            utmMedium: freezed == utmMedium
                ? _value.utmMedium
                : utmMedium // ignore: cast_nullable_to_non_nullable
                      as String?,
            utmCampaign: freezed == utmCampaign
                ? _value.utmCampaign
                : utmCampaign // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnalyticsSessionImplCopyWith<$Res>
    implements $AnalyticsSessionCopyWith<$Res> {
  factory _$$AnalyticsSessionImplCopyWith(
    _$AnalyticsSessionImpl value,
    $Res Function(_$AnalyticsSessionImpl) then,
  ) = __$$AnalyticsSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'session_id', fromJson: _toStringRequired) String sessionId,
    @JsonKey(name: 'user_id', fromJson: _toStringOrNull) String? userId,
    @JsonKey(fromJson: _toStringOrNull) String? country,
    @JsonKey(fromJson: _toStringOrNull) String? region,
    @JsonKey(fromJson: _toStringOrNull) String? city,
    @JsonKey(fromJson: _toStringOrNull) String? language,
    @JsonKey(name: 'device_type', fromJson: _toStringOrNull) String? deviceType,
    @JsonKey(fromJson: _toStringOrNull) String? browser,
    @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
    String? browserVersion,
    @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
    String? operatingSystem,
    @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
    String? osVersion,
    @JsonKey(fromJson: _toStringOrNull) String? referrer,
    @JsonKey(fromJson: _toStringOrNull) String? channel,
    @JsonKey(fromJson: _toStringOrNull) String? hostname,
    @JsonKey(name: 'entry_page', fromJson: _toStringOrNull) String? entryPage,
    @JsonKey(name: 'exit_page', fromJson: _toStringOrNull) String? exitPage,
    @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
    String? sessionStart,
    @JsonKey(name: 'session_end', fromJson: _toStringOrNull) String? sessionEnd,
    @JsonKey(name: 'session_duration') num sessionDuration,
    int pageviews,
    int events,
    int errors,
    @JsonKey(name: 'has_replay') int hasReplay,
    @JsonKey(name: 'utm_source', fromJson: _toStringOrNull) String? utmSource,
    @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) String? utmMedium,
    @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
    String? utmCampaign,
  });
}

/// @nodoc
class __$$AnalyticsSessionImplCopyWithImpl<$Res>
    extends _$AnalyticsSessionCopyWithImpl<$Res, _$AnalyticsSessionImpl>
    implements _$$AnalyticsSessionImplCopyWith<$Res> {
  __$$AnalyticsSessionImplCopyWithImpl(
    _$AnalyticsSessionImpl _value,
    $Res Function(_$AnalyticsSessionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnalyticsSession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionId = null,
    Object? userId = freezed,
    Object? country = freezed,
    Object? region = freezed,
    Object? city = freezed,
    Object? language = freezed,
    Object? deviceType = freezed,
    Object? browser = freezed,
    Object? browserVersion = freezed,
    Object? operatingSystem = freezed,
    Object? osVersion = freezed,
    Object? referrer = freezed,
    Object? channel = freezed,
    Object? hostname = freezed,
    Object? entryPage = freezed,
    Object? exitPage = freezed,
    Object? sessionStart = freezed,
    Object? sessionEnd = freezed,
    Object? sessionDuration = null,
    Object? pageviews = null,
    Object? events = null,
    Object? errors = null,
    Object? hasReplay = null,
    Object? utmSource = freezed,
    Object? utmMedium = freezed,
    Object? utmCampaign = freezed,
  }) {
    return _then(
      _$AnalyticsSessionImpl(
        sessionId: null == sessionId
            ? _value.sessionId
            : sessionId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: freezed == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String?,
        country: freezed == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String?,
        region: freezed == region
            ? _value.region
            : region // ignore: cast_nullable_to_non_nullable
                  as String?,
        city: freezed == city
            ? _value.city
            : city // ignore: cast_nullable_to_non_nullable
                  as String?,
        language: freezed == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String?,
        deviceType: freezed == deviceType
            ? _value.deviceType
            : deviceType // ignore: cast_nullable_to_non_nullable
                  as String?,
        browser: freezed == browser
            ? _value.browser
            : browser // ignore: cast_nullable_to_non_nullable
                  as String?,
        browserVersion: freezed == browserVersion
            ? _value.browserVersion
            : browserVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        operatingSystem: freezed == operatingSystem
            ? _value.operatingSystem
            : operatingSystem // ignore: cast_nullable_to_non_nullable
                  as String?,
        osVersion: freezed == osVersion
            ? _value.osVersion
            : osVersion // ignore: cast_nullable_to_non_nullable
                  as String?,
        referrer: freezed == referrer
            ? _value.referrer
            : referrer // ignore: cast_nullable_to_non_nullable
                  as String?,
        channel: freezed == channel
            ? _value.channel
            : channel // ignore: cast_nullable_to_non_nullable
                  as String?,
        hostname: freezed == hostname
            ? _value.hostname
            : hostname // ignore: cast_nullable_to_non_nullable
                  as String?,
        entryPage: freezed == entryPage
            ? _value.entryPage
            : entryPage // ignore: cast_nullable_to_non_nullable
                  as String?,
        exitPage: freezed == exitPage
            ? _value.exitPage
            : exitPage // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionStart: freezed == sessionStart
            ? _value.sessionStart
            : sessionStart // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionEnd: freezed == sessionEnd
            ? _value.sessionEnd
            : sessionEnd // ignore: cast_nullable_to_non_nullable
                  as String?,
        sessionDuration: null == sessionDuration
            ? _value.sessionDuration
            : sessionDuration // ignore: cast_nullable_to_non_nullable
                  as num,
        pageviews: null == pageviews
            ? _value.pageviews
            : pageviews // ignore: cast_nullable_to_non_nullable
                  as int,
        events: null == events
            ? _value.events
            : events // ignore: cast_nullable_to_non_nullable
                  as int,
        errors: null == errors
            ? _value.errors
            : errors // ignore: cast_nullable_to_non_nullable
                  as int,
        hasReplay: null == hasReplay
            ? _value.hasReplay
            : hasReplay // ignore: cast_nullable_to_non_nullable
                  as int,
        utmSource: freezed == utmSource
            ? _value.utmSource
            : utmSource // ignore: cast_nullable_to_non_nullable
                  as String?,
        utmMedium: freezed == utmMedium
            ? _value.utmMedium
            : utmMedium // ignore: cast_nullable_to_non_nullable
                  as String?,
        utmCampaign: freezed == utmCampaign
            ? _value.utmCampaign
            : utmCampaign // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsSessionImpl implements _AnalyticsSession {
  const _$AnalyticsSessionImpl({
    @JsonKey(name: 'session_id', fromJson: _toStringRequired)
    required this.sessionId,
    @JsonKey(name: 'user_id', fromJson: _toStringOrNull) this.userId,
    @JsonKey(fromJson: _toStringOrNull) this.country,
    @JsonKey(fromJson: _toStringOrNull) this.region,
    @JsonKey(fromJson: _toStringOrNull) this.city,
    @JsonKey(fromJson: _toStringOrNull) this.language,
    @JsonKey(name: 'device_type', fromJson: _toStringOrNull) this.deviceType,
    @JsonKey(fromJson: _toStringOrNull) this.browser,
    @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
    this.browserVersion,
    @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
    this.operatingSystem,
    @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
    this.osVersion,
    @JsonKey(fromJson: _toStringOrNull) this.referrer,
    @JsonKey(fromJson: _toStringOrNull) this.channel,
    @JsonKey(fromJson: _toStringOrNull) this.hostname,
    @JsonKey(name: 'entry_page', fromJson: _toStringOrNull) this.entryPage,
    @JsonKey(name: 'exit_page', fromJson: _toStringOrNull) this.exitPage,
    @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
    this.sessionStart,
    @JsonKey(name: 'session_end', fromJson: _toStringOrNull) this.sessionEnd,
    @JsonKey(name: 'session_duration') this.sessionDuration = 0,
    this.pageviews = 0,
    this.events = 0,
    this.errors = 0,
    @JsonKey(name: 'has_replay') this.hasReplay = 0,
    @JsonKey(name: 'utm_source', fromJson: _toStringOrNull) this.utmSource,
    @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull) this.utmMedium,
    @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull) this.utmCampaign,
  });

  factory _$AnalyticsSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsSessionImplFromJson(json);

  @override
  @JsonKey(name: 'session_id', fromJson: _toStringRequired)
  final String sessionId;
  @override
  @JsonKey(name: 'user_id', fromJson: _toStringOrNull)
  final String? userId;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? country;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? region;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? city;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? language;
  @override
  @JsonKey(name: 'device_type', fromJson: _toStringOrNull)
  final String? deviceType;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? browser;
  @override
  @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
  final String? browserVersion;
  @override
  @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
  final String? operatingSystem;
  @override
  @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
  final String? osVersion;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? referrer;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? channel;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  final String? hostname;
  @override
  @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)
  final String? entryPage;
  @override
  @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)
  final String? exitPage;
  @override
  @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
  final String? sessionStart;
  @override
  @JsonKey(name: 'session_end', fromJson: _toStringOrNull)
  final String? sessionEnd;
  @override
  @JsonKey(name: 'session_duration')
  final num sessionDuration;
  @override
  @JsonKey()
  final int pageviews;
  @override
  @JsonKey()
  final int events;
  @override
  @JsonKey()
  final int errors;
  @override
  @JsonKey(name: 'has_replay')
  final int hasReplay;
  @override
  @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)
  final String? utmSource;
  @override
  @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)
  final String? utmMedium;
  @override
  @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
  final String? utmCampaign;

  @override
  String toString() {
    return 'AnalyticsSession(sessionId: $sessionId, userId: $userId, country: $country, region: $region, city: $city, language: $language, deviceType: $deviceType, browser: $browser, browserVersion: $browserVersion, operatingSystem: $operatingSystem, osVersion: $osVersion, referrer: $referrer, channel: $channel, hostname: $hostname, entryPage: $entryPage, exitPage: $exitPage, sessionStart: $sessionStart, sessionEnd: $sessionEnd, sessionDuration: $sessionDuration, pageviews: $pageviews, events: $events, errors: $errors, hasReplay: $hasReplay, utmSource: $utmSource, utmMedium: $utmMedium, utmCampaign: $utmCampaign)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsSessionImpl &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.browser, browser) || other.browser == browser) &&
            (identical(other.browserVersion, browserVersion) ||
                other.browserVersion == browserVersion) &&
            (identical(other.operatingSystem, operatingSystem) ||
                other.operatingSystem == operatingSystem) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion) &&
            (identical(other.referrer, referrer) ||
                other.referrer == referrer) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.hostname, hostname) ||
                other.hostname == hostname) &&
            (identical(other.entryPage, entryPage) ||
                other.entryPage == entryPage) &&
            (identical(other.exitPage, exitPage) ||
                other.exitPage == exitPage) &&
            (identical(other.sessionStart, sessionStart) ||
                other.sessionStart == sessionStart) &&
            (identical(other.sessionEnd, sessionEnd) ||
                other.sessionEnd == sessionEnd) &&
            (identical(other.sessionDuration, sessionDuration) ||
                other.sessionDuration == sessionDuration) &&
            (identical(other.pageviews, pageviews) ||
                other.pageviews == pageviews) &&
            (identical(other.events, events) || other.events == events) &&
            (identical(other.errors, errors) || other.errors == errors) &&
            (identical(other.hasReplay, hasReplay) ||
                other.hasReplay == hasReplay) &&
            (identical(other.utmSource, utmSource) ||
                other.utmSource == utmSource) &&
            (identical(other.utmMedium, utmMedium) ||
                other.utmMedium == utmMedium) &&
            (identical(other.utmCampaign, utmCampaign) ||
                other.utmCampaign == utmCampaign));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    sessionId,
    userId,
    country,
    region,
    city,
    language,
    deviceType,
    browser,
    browserVersion,
    operatingSystem,
    osVersion,
    referrer,
    channel,
    hostname,
    entryPage,
    exitPage,
    sessionStart,
    sessionEnd,
    sessionDuration,
    pageviews,
    events,
    errors,
    hasReplay,
    utmSource,
    utmMedium,
    utmCampaign,
  ]);

  /// Create a copy of AnalyticsSession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsSessionImplCopyWith<_$AnalyticsSessionImpl> get copyWith =>
      __$$AnalyticsSessionImplCopyWithImpl<_$AnalyticsSessionImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsSessionImplToJson(this);
  }
}

abstract class _AnalyticsSession implements AnalyticsSession {
  const factory _AnalyticsSession({
    @JsonKey(name: 'session_id', fromJson: _toStringRequired)
    required final String sessionId,
    @JsonKey(name: 'user_id', fromJson: _toStringOrNull) final String? userId,
    @JsonKey(fromJson: _toStringOrNull) final String? country,
    @JsonKey(fromJson: _toStringOrNull) final String? region,
    @JsonKey(fromJson: _toStringOrNull) final String? city,
    @JsonKey(fromJson: _toStringOrNull) final String? language,
    @JsonKey(name: 'device_type', fromJson: _toStringOrNull)
    final String? deviceType,
    @JsonKey(fromJson: _toStringOrNull) final String? browser,
    @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
    final String? browserVersion,
    @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
    final String? operatingSystem,
    @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
    final String? osVersion,
    @JsonKey(fromJson: _toStringOrNull) final String? referrer,
    @JsonKey(fromJson: _toStringOrNull) final String? channel,
    @JsonKey(fromJson: _toStringOrNull) final String? hostname,
    @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)
    final String? entryPage,
    @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)
    final String? exitPage,
    @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
    final String? sessionStart,
    @JsonKey(name: 'session_end', fromJson: _toStringOrNull)
    final String? sessionEnd,
    @JsonKey(name: 'session_duration') final num sessionDuration,
    final int pageviews,
    final int events,
    final int errors,
    @JsonKey(name: 'has_replay') final int hasReplay,
    @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)
    final String? utmSource,
    @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)
    final String? utmMedium,
    @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
    final String? utmCampaign,
  }) = _$AnalyticsSessionImpl;

  factory _AnalyticsSession.fromJson(Map<String, dynamic> json) =
      _$AnalyticsSessionImpl.fromJson;

  @override
  @JsonKey(name: 'session_id', fromJson: _toStringRequired)
  String get sessionId;
  @override
  @JsonKey(name: 'user_id', fromJson: _toStringOrNull)
  String? get userId;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get country;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get region;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get city;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get language;
  @override
  @JsonKey(name: 'device_type', fromJson: _toStringOrNull)
  String? get deviceType;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get browser;
  @override
  @JsonKey(name: 'browser_version', fromJson: _toStringOrNull)
  String? get browserVersion;
  @override
  @JsonKey(name: 'operating_system', fromJson: _toStringOrNull)
  String? get operatingSystem;
  @override
  @JsonKey(name: 'operating_system_version', fromJson: _toStringOrNull)
  String? get osVersion;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get referrer;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get channel;
  @override
  @JsonKey(fromJson: _toStringOrNull)
  String? get hostname;
  @override
  @JsonKey(name: 'entry_page', fromJson: _toStringOrNull)
  String? get entryPage;
  @override
  @JsonKey(name: 'exit_page', fromJson: _toStringOrNull)
  String? get exitPage;
  @override
  @JsonKey(name: 'session_start', fromJson: _toStringOrNull)
  String? get sessionStart;
  @override
  @JsonKey(name: 'session_end', fromJson: _toStringOrNull)
  String? get sessionEnd;
  @override
  @JsonKey(name: 'session_duration')
  num get sessionDuration;
  @override
  int get pageviews;
  @override
  int get events;
  @override
  int get errors;
  @override
  @JsonKey(name: 'has_replay')
  int get hasReplay;
  @override
  @JsonKey(name: 'utm_source', fromJson: _toStringOrNull)
  String? get utmSource;
  @override
  @JsonKey(name: 'utm_medium', fromJson: _toStringOrNull)
  String? get utmMedium;
  @override
  @JsonKey(name: 'utm_campaign', fromJson: _toStringOrNull)
  String? get utmCampaign;

  /// Create a copy of AnalyticsSession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsSessionImplCopyWith<_$AnalyticsSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
