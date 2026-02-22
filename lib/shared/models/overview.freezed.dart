// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Overview _$OverviewFromJson(Map<String, dynamic> json) {
  return _Overview.fromJson(json);
}

/// @nodoc
mixin _$Overview {
  int get sessions => throw _privateConstructorUsedError;
  int get pageviews => throw _privateConstructorUsedError;
  int get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'pages_per_session')
  double get pagesPerSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'bounce_rate')
  double get bounceRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_duration')
  double get sessionDuration => throw _privateConstructorUsedError;

  /// Serializes this Overview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Overview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OverviewCopyWith<Overview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewCopyWith<$Res> {
  factory $OverviewCopyWith(Overview value, $Res Function(Overview) then) =
      _$OverviewCopyWithImpl<$Res, Overview>;
  @useResult
  $Res call({
    int sessions,
    int pageviews,
    int users,
    @JsonKey(name: 'pages_per_session') double pagesPerSession,
    @JsonKey(name: 'bounce_rate') double bounceRate,
    @JsonKey(name: 'session_duration') double sessionDuration,
  });
}

/// @nodoc
class _$OverviewCopyWithImpl<$Res, $Val extends Overview>
    implements $OverviewCopyWith<$Res> {
  _$OverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Overview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? pageviews = null,
    Object? users = null,
    Object? pagesPerSession = null,
    Object? bounceRate = null,
    Object? sessionDuration = null,
  }) {
    return _then(
      _value.copyWith(
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as int,
            pageviews: null == pageviews
                ? _value.pageviews
                : pageviews // ignore: cast_nullable_to_non_nullable
                      as int,
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as int,
            pagesPerSession: null == pagesPerSession
                ? _value.pagesPerSession
                : pagesPerSession // ignore: cast_nullable_to_non_nullable
                      as double,
            bounceRate: null == bounceRate
                ? _value.bounceRate
                : bounceRate // ignore: cast_nullable_to_non_nullable
                      as double,
            sessionDuration: null == sessionDuration
                ? _value.sessionDuration
                : sessionDuration // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OverviewImplCopyWith<$Res>
    implements $OverviewCopyWith<$Res> {
  factory _$$OverviewImplCopyWith(
    _$OverviewImpl value,
    $Res Function(_$OverviewImpl) then,
  ) = __$$OverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int sessions,
    int pageviews,
    int users,
    @JsonKey(name: 'pages_per_session') double pagesPerSession,
    @JsonKey(name: 'bounce_rate') double bounceRate,
    @JsonKey(name: 'session_duration') double sessionDuration,
  });
}

/// @nodoc
class __$$OverviewImplCopyWithImpl<$Res>
    extends _$OverviewCopyWithImpl<$Res, _$OverviewImpl>
    implements _$$OverviewImplCopyWith<$Res> {
  __$$OverviewImplCopyWithImpl(
    _$OverviewImpl _value,
    $Res Function(_$OverviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Overview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessions = null,
    Object? pageviews = null,
    Object? users = null,
    Object? pagesPerSession = null,
    Object? bounceRate = null,
    Object? sessionDuration = null,
  }) {
    return _then(
      _$OverviewImpl(
        sessions: null == sessions
            ? _value.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as int,
        pageviews: null == pageviews
            ? _value.pageviews
            : pageviews // ignore: cast_nullable_to_non_nullable
                  as int,
        users: null == users
            ? _value.users
            : users // ignore: cast_nullable_to_non_nullable
                  as int,
        pagesPerSession: null == pagesPerSession
            ? _value.pagesPerSession
            : pagesPerSession // ignore: cast_nullable_to_non_nullable
                  as double,
        bounceRate: null == bounceRate
            ? _value.bounceRate
            : bounceRate // ignore: cast_nullable_to_non_nullable
                  as double,
        sessionDuration: null == sessionDuration
            ? _value.sessionDuration
            : sessionDuration // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewImpl implements _Overview {
  const _$OverviewImpl({
    this.sessions = 0,
    this.pageviews = 0,
    this.users = 0,
    @JsonKey(name: 'pages_per_session') this.pagesPerSession = 0,
    @JsonKey(name: 'bounce_rate') this.bounceRate = 0,
    @JsonKey(name: 'session_duration') this.sessionDuration = 0,
  });

  factory _$OverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewImplFromJson(json);

  @override
  @JsonKey()
  final int sessions;
  @override
  @JsonKey()
  final int pageviews;
  @override
  @JsonKey()
  final int users;
  @override
  @JsonKey(name: 'pages_per_session')
  final double pagesPerSession;
  @override
  @JsonKey(name: 'bounce_rate')
  final double bounceRate;
  @override
  @JsonKey(name: 'session_duration')
  final double sessionDuration;

  @override
  String toString() {
    return 'Overview(sessions: $sessions, pageviews: $pageviews, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewImpl &&
            (identical(other.sessions, sessions) ||
                other.sessions == sessions) &&
            (identical(other.pageviews, pageviews) ||
                other.pageviews == pageviews) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.pagesPerSession, pagesPerSession) ||
                other.pagesPerSession == pagesPerSession) &&
            (identical(other.bounceRate, bounceRate) ||
                other.bounceRate == bounceRate) &&
            (identical(other.sessionDuration, sessionDuration) ||
                other.sessionDuration == sessionDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    sessions,
    pageviews,
    users,
    pagesPerSession,
    bounceRate,
    sessionDuration,
  );

  /// Create a copy of Overview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewImplCopyWith<_$OverviewImpl> get copyWith =>
      __$$OverviewImplCopyWithImpl<_$OverviewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewImplToJson(this);
  }
}

abstract class _Overview implements Overview {
  const factory _Overview({
    final int sessions,
    final int pageviews,
    final int users,
    @JsonKey(name: 'pages_per_session') final double pagesPerSession,
    @JsonKey(name: 'bounce_rate') final double bounceRate,
    @JsonKey(name: 'session_duration') final double sessionDuration,
  }) = _$OverviewImpl;

  factory _Overview.fromJson(Map<String, dynamic> json) =
      _$OverviewImpl.fromJson;

  @override
  int get sessions;
  @override
  int get pageviews;
  @override
  int get users;
  @override
  @JsonKey(name: 'pages_per_session')
  double get pagesPerSession;
  @override
  @JsonKey(name: 'bounce_rate')
  double get bounceRate;
  @override
  @JsonKey(name: 'session_duration')
  double get sessionDuration;

  /// Create a copy of Overview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OverviewImplCopyWith<_$OverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OverviewBucket _$OverviewBucketFromJson(Map<String, dynamic> json) {
  return _OverviewBucket.fromJson(json);
}

/// @nodoc
mixin _$OverviewBucket {
  String get time => throw _privateConstructorUsedError;
  int get pageviews => throw _privateConstructorUsedError;
  int get sessions => throw _privateConstructorUsedError;
  int get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'pages_per_session')
  double get pagesPerSession => throw _privateConstructorUsedError;
  @JsonKey(name: 'bounce_rate')
  double get bounceRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_duration')
  double get sessionDuration => throw _privateConstructorUsedError;

  /// Serializes this OverviewBucket to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OverviewBucket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OverviewBucketCopyWith<OverviewBucket> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OverviewBucketCopyWith<$Res> {
  factory $OverviewBucketCopyWith(
    OverviewBucket value,
    $Res Function(OverviewBucket) then,
  ) = _$OverviewBucketCopyWithImpl<$Res, OverviewBucket>;
  @useResult
  $Res call({
    String time,
    int pageviews,
    int sessions,
    int users,
    @JsonKey(name: 'pages_per_session') double pagesPerSession,
    @JsonKey(name: 'bounce_rate') double bounceRate,
    @JsonKey(name: 'session_duration') double sessionDuration,
  });
}

/// @nodoc
class _$OverviewBucketCopyWithImpl<$Res, $Val extends OverviewBucket>
    implements $OverviewBucketCopyWith<$Res> {
  _$OverviewBucketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OverviewBucket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? pageviews = null,
    Object? sessions = null,
    Object? users = null,
    Object? pagesPerSession = null,
    Object? bounceRate = null,
    Object? sessionDuration = null,
  }) {
    return _then(
      _value.copyWith(
            time: null == time
                ? _value.time
                : time // ignore: cast_nullable_to_non_nullable
                      as String,
            pageviews: null == pageviews
                ? _value.pageviews
                : pageviews // ignore: cast_nullable_to_non_nullable
                      as int,
            sessions: null == sessions
                ? _value.sessions
                : sessions // ignore: cast_nullable_to_non_nullable
                      as int,
            users: null == users
                ? _value.users
                : users // ignore: cast_nullable_to_non_nullable
                      as int,
            pagesPerSession: null == pagesPerSession
                ? _value.pagesPerSession
                : pagesPerSession // ignore: cast_nullable_to_non_nullable
                      as double,
            bounceRate: null == bounceRate
                ? _value.bounceRate
                : bounceRate // ignore: cast_nullable_to_non_nullable
                      as double,
            sessionDuration: null == sessionDuration
                ? _value.sessionDuration
                : sessionDuration // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OverviewBucketImplCopyWith<$Res>
    implements $OverviewBucketCopyWith<$Res> {
  factory _$$OverviewBucketImplCopyWith(
    _$OverviewBucketImpl value,
    $Res Function(_$OverviewBucketImpl) then,
  ) = __$$OverviewBucketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String time,
    int pageviews,
    int sessions,
    int users,
    @JsonKey(name: 'pages_per_session') double pagesPerSession,
    @JsonKey(name: 'bounce_rate') double bounceRate,
    @JsonKey(name: 'session_duration') double sessionDuration,
  });
}

/// @nodoc
class __$$OverviewBucketImplCopyWithImpl<$Res>
    extends _$OverviewBucketCopyWithImpl<$Res, _$OverviewBucketImpl>
    implements _$$OverviewBucketImplCopyWith<$Res> {
  __$$OverviewBucketImplCopyWithImpl(
    _$OverviewBucketImpl _value,
    $Res Function(_$OverviewBucketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OverviewBucket
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? pageviews = null,
    Object? sessions = null,
    Object? users = null,
    Object? pagesPerSession = null,
    Object? bounceRate = null,
    Object? sessionDuration = null,
  }) {
    return _then(
      _$OverviewBucketImpl(
        time: null == time
            ? _value.time
            : time // ignore: cast_nullable_to_non_nullable
                  as String,
        pageviews: null == pageviews
            ? _value.pageviews
            : pageviews // ignore: cast_nullable_to_non_nullable
                  as int,
        sessions: null == sessions
            ? _value.sessions
            : sessions // ignore: cast_nullable_to_non_nullable
                  as int,
        users: null == users
            ? _value.users
            : users // ignore: cast_nullable_to_non_nullable
                  as int,
        pagesPerSession: null == pagesPerSession
            ? _value.pagesPerSession
            : pagesPerSession // ignore: cast_nullable_to_non_nullable
                  as double,
        bounceRate: null == bounceRate
            ? _value.bounceRate
            : bounceRate // ignore: cast_nullable_to_non_nullable
                  as double,
        sessionDuration: null == sessionDuration
            ? _value.sessionDuration
            : sessionDuration // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$OverviewBucketImpl implements _OverviewBucket {
  const _$OverviewBucketImpl({
    required this.time,
    this.pageviews = 0,
    this.sessions = 0,
    this.users = 0,
    @JsonKey(name: 'pages_per_session') this.pagesPerSession = 0,
    @JsonKey(name: 'bounce_rate') this.bounceRate = 0,
    @JsonKey(name: 'session_duration') this.sessionDuration = 0,
  });

  factory _$OverviewBucketImpl.fromJson(Map<String, dynamic> json) =>
      _$$OverviewBucketImplFromJson(json);

  @override
  final String time;
  @override
  @JsonKey()
  final int pageviews;
  @override
  @JsonKey()
  final int sessions;
  @override
  @JsonKey()
  final int users;
  @override
  @JsonKey(name: 'pages_per_session')
  final double pagesPerSession;
  @override
  @JsonKey(name: 'bounce_rate')
  final double bounceRate;
  @override
  @JsonKey(name: 'session_duration')
  final double sessionDuration;

  @override
  String toString() {
    return 'OverviewBucket(time: $time, pageviews: $pageviews, sessions: $sessions, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OverviewBucketImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.pageviews, pageviews) ||
                other.pageviews == pageviews) &&
            (identical(other.sessions, sessions) ||
                other.sessions == sessions) &&
            (identical(other.users, users) || other.users == users) &&
            (identical(other.pagesPerSession, pagesPerSession) ||
                other.pagesPerSession == pagesPerSession) &&
            (identical(other.bounceRate, bounceRate) ||
                other.bounceRate == bounceRate) &&
            (identical(other.sessionDuration, sessionDuration) ||
                other.sessionDuration == sessionDuration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    time,
    pageviews,
    sessions,
    users,
    pagesPerSession,
    bounceRate,
    sessionDuration,
  );

  /// Create a copy of OverviewBucket
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OverviewBucketImplCopyWith<_$OverviewBucketImpl> get copyWith =>
      __$$OverviewBucketImplCopyWithImpl<_$OverviewBucketImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$OverviewBucketImplToJson(this);
  }
}

abstract class _OverviewBucket implements OverviewBucket {
  const factory _OverviewBucket({
    required final String time,
    final int pageviews,
    final int sessions,
    final int users,
    @JsonKey(name: 'pages_per_session') final double pagesPerSession,
    @JsonKey(name: 'bounce_rate') final double bounceRate,
    @JsonKey(name: 'session_duration') final double sessionDuration,
  }) = _$OverviewBucketImpl;

  factory _OverviewBucket.fromJson(Map<String, dynamic> json) =
      _$OverviewBucketImpl.fromJson;

  @override
  String get time;
  @override
  int get pageviews;
  @override
  int get sessions;
  @override
  int get users;
  @override
  @JsonKey(name: 'pages_per_session')
  double get pagesPerSession;
  @override
  @JsonKey(name: 'bounce_rate')
  double get bounceRate;
  @override
  @JsonKey(name: 'session_duration')
  double get sessionDuration;

  /// Create a copy of OverviewBucket
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OverviewBucketImplCopyWith<_$OverviewBucketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
