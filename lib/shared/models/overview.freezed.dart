// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Overview {

 int get sessions; int get pageviews; int get users;@JsonKey(name: 'pages_per_session') double get pagesPerSession;@JsonKey(name: 'bounce_rate') double get bounceRate;@JsonKey(name: 'session_duration') double get sessionDuration;
/// Create a copy of Overview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverviewCopyWith<Overview> get copyWith => _$OverviewCopyWithImpl<Overview>(this as Overview, _$identity);

  /// Serializes this Overview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Overview&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.users, users) || other.users == users)&&(identical(other.pagesPerSession, pagesPerSession) || other.pagesPerSession == pagesPerSession)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessions,pageviews,users,pagesPerSession,bounceRate,sessionDuration);

@override
String toString() {
  return 'Overview(sessions: $sessions, pageviews: $pageviews, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class $OverviewCopyWith<$Res>  {
  factory $OverviewCopyWith(Overview value, $Res Function(Overview) _then) = _$OverviewCopyWithImpl;
@useResult
$Res call({
 int sessions, int pageviews, int users,@JsonKey(name: 'pages_per_session') double pagesPerSession,@JsonKey(name: 'bounce_rate') double bounceRate,@JsonKey(name: 'session_duration') double sessionDuration
});




}
/// @nodoc
class _$OverviewCopyWithImpl<$Res>
    implements $OverviewCopyWith<$Res> {
  _$OverviewCopyWithImpl(this._self, this._then);

  final Overview _self;
  final $Res Function(Overview) _then;

/// Create a copy of Overview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessions = null,Object? pageviews = null,Object? users = null,Object? pagesPerSession = null,Object? bounceRate = null,Object? sessionDuration = null,}) {
  return _then(_self.copyWith(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,pagesPerSession: null == pagesPerSession ? _self.pagesPerSession : pagesPerSession // ignore: cast_nullable_to_non_nullable
as double,bounceRate: null == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Overview].
extension OverviewPatterns on Overview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Overview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Overview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Overview value)  $default,){
final _that = this;
switch (_that) {
case _Overview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Overview value)?  $default,){
final _that = this;
switch (_that) {
case _Overview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sessions,  int pageviews,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Overview() when $default != null:
return $default(_that.sessions,_that.pageviews,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sessions,  int pageviews,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)  $default,) {final _that = this;
switch (_that) {
case _Overview():
return $default(_that.sessions,_that.pageviews,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sessions,  int pageviews,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)?  $default,) {final _that = this;
switch (_that) {
case _Overview() when $default != null:
return $default(_that.sessions,_that.pageviews,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Overview implements Overview {
  const _Overview({this.sessions = 0, this.pageviews = 0, this.users = 0, @JsonKey(name: 'pages_per_session') this.pagesPerSession = 0, @JsonKey(name: 'bounce_rate') this.bounceRate = 0, @JsonKey(name: 'session_duration') this.sessionDuration = 0});
  factory _Overview.fromJson(Map<String, dynamic> json) => _$OverviewFromJson(json);

@override@JsonKey() final  int sessions;
@override@JsonKey() final  int pageviews;
@override@JsonKey() final  int users;
@override@JsonKey(name: 'pages_per_session') final  double pagesPerSession;
@override@JsonKey(name: 'bounce_rate') final  double bounceRate;
@override@JsonKey(name: 'session_duration') final  double sessionDuration;

/// Create a copy of Overview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverviewCopyWith<_Overview> get copyWith => __$OverviewCopyWithImpl<_Overview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Overview&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.users, users) || other.users == users)&&(identical(other.pagesPerSession, pagesPerSession) || other.pagesPerSession == pagesPerSession)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessions,pageviews,users,pagesPerSession,bounceRate,sessionDuration);

@override
String toString() {
  return 'Overview(sessions: $sessions, pageviews: $pageviews, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class _$OverviewCopyWith<$Res> implements $OverviewCopyWith<$Res> {
  factory _$OverviewCopyWith(_Overview value, $Res Function(_Overview) _then) = __$OverviewCopyWithImpl;
@override @useResult
$Res call({
 int sessions, int pageviews, int users,@JsonKey(name: 'pages_per_session') double pagesPerSession,@JsonKey(name: 'bounce_rate') double bounceRate,@JsonKey(name: 'session_duration') double sessionDuration
});




}
/// @nodoc
class __$OverviewCopyWithImpl<$Res>
    implements _$OverviewCopyWith<$Res> {
  __$OverviewCopyWithImpl(this._self, this._then);

  final _Overview _self;
  final $Res Function(_Overview) _then;

/// Create a copy of Overview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessions = null,Object? pageviews = null,Object? users = null,Object? pagesPerSession = null,Object? bounceRate = null,Object? sessionDuration = null,}) {
  return _then(_Overview(
sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,pagesPerSession: null == pagesPerSession ? _self.pagesPerSession : pagesPerSession // ignore: cast_nullable_to_non_nullable
as double,bounceRate: null == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$OverviewBucket {

 String get time; int get pageviews; int get sessions; int get users;@JsonKey(name: 'pages_per_session') double get pagesPerSession;@JsonKey(name: 'bounce_rate') double get bounceRate;@JsonKey(name: 'session_duration') double get sessionDuration;
/// Create a copy of OverviewBucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OverviewBucketCopyWith<OverviewBucket> get copyWith => _$OverviewBucketCopyWithImpl<OverviewBucket>(this as OverviewBucket, _$identity);

  /// Serializes this OverviewBucket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OverviewBucket&&(identical(other.time, time) || other.time == time)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.users, users) || other.users == users)&&(identical(other.pagesPerSession, pagesPerSession) || other.pagesPerSession == pagesPerSession)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,pageviews,sessions,users,pagesPerSession,bounceRate,sessionDuration);

@override
String toString() {
  return 'OverviewBucket(time: $time, pageviews: $pageviews, sessions: $sessions, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class $OverviewBucketCopyWith<$Res>  {
  factory $OverviewBucketCopyWith(OverviewBucket value, $Res Function(OverviewBucket) _then) = _$OverviewBucketCopyWithImpl;
@useResult
$Res call({
 String time, int pageviews, int sessions, int users,@JsonKey(name: 'pages_per_session') double pagesPerSession,@JsonKey(name: 'bounce_rate') double bounceRate,@JsonKey(name: 'session_duration') double sessionDuration
});




}
/// @nodoc
class _$OverviewBucketCopyWithImpl<$Res>
    implements $OverviewBucketCopyWith<$Res> {
  _$OverviewBucketCopyWithImpl(this._self, this._then);

  final OverviewBucket _self;
  final $Res Function(OverviewBucket) _then;

/// Create a copy of OverviewBucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? pageviews = null,Object? sessions = null,Object? users = null,Object? pagesPerSession = null,Object? bounceRate = null,Object? sessionDuration = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,pagesPerSession: null == pagesPerSession ? _self.pagesPerSession : pagesPerSession // ignore: cast_nullable_to_non_nullable
as double,bounceRate: null == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OverviewBucket].
extension OverviewBucketPatterns on OverviewBucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OverviewBucket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OverviewBucket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OverviewBucket value)  $default,){
final _that = this;
switch (_that) {
case _OverviewBucket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OverviewBucket value)?  $default,){
final _that = this;
switch (_that) {
case _OverviewBucket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String time,  int pageviews,  int sessions,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OverviewBucket() when $default != null:
return $default(_that.time,_that.pageviews,_that.sessions,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String time,  int pageviews,  int sessions,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)  $default,) {final _that = this;
switch (_that) {
case _OverviewBucket():
return $default(_that.time,_that.pageviews,_that.sessions,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String time,  int pageviews,  int sessions,  int users, @JsonKey(name: 'pages_per_session')  double pagesPerSession, @JsonKey(name: 'bounce_rate')  double bounceRate, @JsonKey(name: 'session_duration')  double sessionDuration)?  $default,) {final _that = this;
switch (_that) {
case _OverviewBucket() when $default != null:
return $default(_that.time,_that.pageviews,_that.sessions,_that.users,_that.pagesPerSession,_that.bounceRate,_that.sessionDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OverviewBucket implements OverviewBucket {
  const _OverviewBucket({this.time = '', this.pageviews = 0, this.sessions = 0, this.users = 0, @JsonKey(name: 'pages_per_session') this.pagesPerSession = 0, @JsonKey(name: 'bounce_rate') this.bounceRate = 0, @JsonKey(name: 'session_duration') this.sessionDuration = 0});
  factory _OverviewBucket.fromJson(Map<String, dynamic> json) => _$OverviewBucketFromJson(json);

@override@JsonKey() final  String time;
@override@JsonKey() final  int pageviews;
@override@JsonKey() final  int sessions;
@override@JsonKey() final  int users;
@override@JsonKey(name: 'pages_per_session') final  double pagesPerSession;
@override@JsonKey(name: 'bounce_rate') final  double bounceRate;
@override@JsonKey(name: 'session_duration') final  double sessionDuration;

/// Create a copy of OverviewBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OverviewBucketCopyWith<_OverviewBucket> get copyWith => __$OverviewBucketCopyWithImpl<_OverviewBucket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OverviewBucketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OverviewBucket&&(identical(other.time, time) || other.time == time)&&(identical(other.pageviews, pageviews) || other.pageviews == pageviews)&&(identical(other.sessions, sessions) || other.sessions == sessions)&&(identical(other.users, users) || other.users == users)&&(identical(other.pagesPerSession, pagesPerSession) || other.pagesPerSession == pagesPerSession)&&(identical(other.bounceRate, bounceRate) || other.bounceRate == bounceRate)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,pageviews,sessions,users,pagesPerSession,bounceRate,sessionDuration);

@override
String toString() {
  return 'OverviewBucket(time: $time, pageviews: $pageviews, sessions: $sessions, users: $users, pagesPerSession: $pagesPerSession, bounceRate: $bounceRate, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class _$OverviewBucketCopyWith<$Res> implements $OverviewBucketCopyWith<$Res> {
  factory _$OverviewBucketCopyWith(_OverviewBucket value, $Res Function(_OverviewBucket) _then) = __$OverviewBucketCopyWithImpl;
@override @useResult
$Res call({
 String time, int pageviews, int sessions, int users,@JsonKey(name: 'pages_per_session') double pagesPerSession,@JsonKey(name: 'bounce_rate') double bounceRate,@JsonKey(name: 'session_duration') double sessionDuration
});




}
/// @nodoc
class __$OverviewBucketCopyWithImpl<$Res>
    implements _$OverviewBucketCopyWith<$Res> {
  __$OverviewBucketCopyWithImpl(this._self, this._then);

  final _OverviewBucket _self;
  final $Res Function(_OverviewBucket) _then;

/// Create a copy of OverviewBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? pageviews = null,Object? sessions = null,Object? users = null,Object? pagesPerSession = null,Object? bounceRate = null,Object? sessionDuration = null,}) {
  return _then(_OverviewBucket(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,pageviews: null == pageviews ? _self.pageviews : pageviews // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as int,pagesPerSession: null == pagesPerSession ? _self.pagesPerSession : pagesPerSession // ignore: cast_nullable_to_non_nullable
as double,bounceRate: null == bounceRate ? _self.bounceRate : bounceRate // ignore: cast_nullable_to_non_nullable
as double,sessionDuration: null == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
