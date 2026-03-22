// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimeRange {

 TimeMode get mode; DateTime get startDate; DateTime get endDate; String get timeZone; TimeBucket get bucket; int? get pastMinutesStart; int? get pastMinutesEnd;
/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeRangeCopyWith<TimeRange> get copyWith => _$TimeRangeCopyWithImpl<TimeRange>(this as TimeRange, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeRange&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.pastMinutesStart, pastMinutesStart) || other.pastMinutesStart == pastMinutesStart)&&(identical(other.pastMinutesEnd, pastMinutesEnd) || other.pastMinutesEnd == pastMinutesEnd));
}


@override
int get hashCode => Object.hash(runtimeType,mode,startDate,endDate,timeZone,bucket,pastMinutesStart,pastMinutesEnd);

@override
String toString() {
  return 'TimeRange(mode: $mode, startDate: $startDate, endDate: $endDate, timeZone: $timeZone, bucket: $bucket, pastMinutesStart: $pastMinutesStart, pastMinutesEnd: $pastMinutesEnd)';
}


}

/// @nodoc
abstract mixin class $TimeRangeCopyWith<$Res>  {
  factory $TimeRangeCopyWith(TimeRange value, $Res Function(TimeRange) _then) = _$TimeRangeCopyWithImpl;
@useResult
$Res call({
 TimeMode mode, DateTime startDate, DateTime endDate, String timeZone, TimeBucket bucket, int? pastMinutesStart, int? pastMinutesEnd
});




}
/// @nodoc
class _$TimeRangeCopyWithImpl<$Res>
    implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._self, this._then);

  final TimeRange _self;
  final $Res Function(TimeRange) _then;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? startDate = null,Object? endDate = null,Object? timeZone = null,Object? bucket = null,Object? pastMinutesStart = freezed,Object? pastMinutesEnd = freezed,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TimeMode,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as TimeBucket,pastMinutesStart: freezed == pastMinutesStart ? _self.pastMinutesStart : pastMinutesStart // ignore: cast_nullable_to_non_nullable
as int?,pastMinutesEnd: freezed == pastMinutesEnd ? _self.pastMinutesEnd : pastMinutesEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimeRange].
extension TimeRangePatterns on TimeRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeRange value)  $default,){
final _that = this;
switch (_that) {
case _TimeRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeRange value)?  $default,){
final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimeMode mode,  DateTime startDate,  DateTime endDate,  String timeZone,  TimeBucket bucket,  int? pastMinutesStart,  int? pastMinutesEnd)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
return $default(_that.mode,_that.startDate,_that.endDate,_that.timeZone,_that.bucket,_that.pastMinutesStart,_that.pastMinutesEnd);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimeMode mode,  DateTime startDate,  DateTime endDate,  String timeZone,  TimeBucket bucket,  int? pastMinutesStart,  int? pastMinutesEnd)  $default,) {final _that = this;
switch (_that) {
case _TimeRange():
return $default(_that.mode,_that.startDate,_that.endDate,_that.timeZone,_that.bucket,_that.pastMinutesStart,_that.pastMinutesEnd);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimeMode mode,  DateTime startDate,  DateTime endDate,  String timeZone,  TimeBucket bucket,  int? pastMinutesStart,  int? pastMinutesEnd)?  $default,) {final _that = this;
switch (_that) {
case _TimeRange() when $default != null:
return $default(_that.mode,_that.startDate,_that.endDate,_that.timeZone,_that.bucket,_that.pastMinutesStart,_that.pastMinutesEnd);case _:
  return null;

}
}

}

/// @nodoc


class _TimeRange extends TimeRange {
  const _TimeRange({required this.mode, required this.startDate, required this.endDate, required this.timeZone, this.bucket = TimeBucket.hour, this.pastMinutesStart, this.pastMinutesEnd}): super._();
  

@override final  TimeMode mode;
@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String timeZone;
@override@JsonKey() final  TimeBucket bucket;
@override final  int? pastMinutesStart;
@override final  int? pastMinutesEnd;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeRangeCopyWith<_TimeRange> get copyWith => __$TimeRangeCopyWithImpl<_TimeRange>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeRange&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone)&&(identical(other.bucket, bucket) || other.bucket == bucket)&&(identical(other.pastMinutesStart, pastMinutesStart) || other.pastMinutesStart == pastMinutesStart)&&(identical(other.pastMinutesEnd, pastMinutesEnd) || other.pastMinutesEnd == pastMinutesEnd));
}


@override
int get hashCode => Object.hash(runtimeType,mode,startDate,endDate,timeZone,bucket,pastMinutesStart,pastMinutesEnd);

@override
String toString() {
  return 'TimeRange(mode: $mode, startDate: $startDate, endDate: $endDate, timeZone: $timeZone, bucket: $bucket, pastMinutesStart: $pastMinutesStart, pastMinutesEnd: $pastMinutesEnd)';
}


}

/// @nodoc
abstract mixin class _$TimeRangeCopyWith<$Res> implements $TimeRangeCopyWith<$Res> {
  factory _$TimeRangeCopyWith(_TimeRange value, $Res Function(_TimeRange) _then) = __$TimeRangeCopyWithImpl;
@override @useResult
$Res call({
 TimeMode mode, DateTime startDate, DateTime endDate, String timeZone, TimeBucket bucket, int? pastMinutesStart, int? pastMinutesEnd
});




}
/// @nodoc
class __$TimeRangeCopyWithImpl<$Res>
    implements _$TimeRangeCopyWith<$Res> {
  __$TimeRangeCopyWithImpl(this._self, this._then);

  final _TimeRange _self;
  final $Res Function(_TimeRange) _then;

/// Create a copy of TimeRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? startDate = null,Object? endDate = null,Object? timeZone = null,Object? bucket = null,Object? pastMinutesStart = freezed,Object? pastMinutesEnd = freezed,}) {
  return _then(_TimeRange(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as TimeMode,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,timeZone: null == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String,bucket: null == bucket ? _self.bucket : bucket // ignore: cast_nullable_to_non_nullable
as TimeBucket,pastMinutesStart: freezed == pastMinutesStart ? _self.pastMinutesStart : pastMinutesStart // ignore: cast_nullable_to_non_nullable
as int?,pastMinutesEnd: freezed == pastMinutesEnd ? _self.pastMinutesEnd : pastMinutesEnd // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
