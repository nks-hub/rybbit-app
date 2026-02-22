// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_range.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TimeRange {
  TimeMode get mode => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  String get timeZone => throw _privateConstructorUsedError;
  TimeBucket get bucket => throw _privateConstructorUsedError;
  int? get pastMinutesStart => throw _privateConstructorUsedError;
  int? get pastMinutesEnd => throw _privateConstructorUsedError;

  /// Create a copy of TimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeRangeCopyWith<TimeRange> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRangeCopyWith<$Res> {
  factory $TimeRangeCopyWith(TimeRange value, $Res Function(TimeRange) then) =
      _$TimeRangeCopyWithImpl<$Res, TimeRange>;
  @useResult
  $Res call({
    TimeMode mode,
    DateTime startDate,
    DateTime endDate,
    String timeZone,
    TimeBucket bucket,
    int? pastMinutesStart,
    int? pastMinutesEnd,
  });
}

/// @nodoc
class _$TimeRangeCopyWithImpl<$Res, $Val extends TimeRange>
    implements $TimeRangeCopyWith<$Res> {
  _$TimeRangeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? timeZone = null,
    Object? bucket = null,
    Object? pastMinutesStart = freezed,
    Object? pastMinutesEnd = freezed,
  }) {
    return _then(
      _value.copyWith(
            mode: null == mode
                ? _value.mode
                : mode // ignore: cast_nullable_to_non_nullable
                      as TimeMode,
            startDate: null == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            endDate: null == endDate
                ? _value.endDate
                : endDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            timeZone: null == timeZone
                ? _value.timeZone
                : timeZone // ignore: cast_nullable_to_non_nullable
                      as String,
            bucket: null == bucket
                ? _value.bucket
                : bucket // ignore: cast_nullable_to_non_nullable
                      as TimeBucket,
            pastMinutesStart: freezed == pastMinutesStart
                ? _value.pastMinutesStart
                : pastMinutesStart // ignore: cast_nullable_to_non_nullable
                      as int?,
            pastMinutesEnd: freezed == pastMinutesEnd
                ? _value.pastMinutesEnd
                : pastMinutesEnd // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimeRangeImplCopyWith<$Res>
    implements $TimeRangeCopyWith<$Res> {
  factory _$$TimeRangeImplCopyWith(
    _$TimeRangeImpl value,
    $Res Function(_$TimeRangeImpl) then,
  ) = __$$TimeRangeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    TimeMode mode,
    DateTime startDate,
    DateTime endDate,
    String timeZone,
    TimeBucket bucket,
    int? pastMinutesStart,
    int? pastMinutesEnd,
  });
}

/// @nodoc
class __$$TimeRangeImplCopyWithImpl<$Res>
    extends _$TimeRangeCopyWithImpl<$Res, _$TimeRangeImpl>
    implements _$$TimeRangeImplCopyWith<$Res> {
  __$$TimeRangeImplCopyWithImpl(
    _$TimeRangeImpl _value,
    $Res Function(_$TimeRangeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimeRange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mode = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? timeZone = null,
    Object? bucket = null,
    Object? pastMinutesStart = freezed,
    Object? pastMinutesEnd = freezed,
  }) {
    return _then(
      _$TimeRangeImpl(
        mode: null == mode
            ? _value.mode
            : mode // ignore: cast_nullable_to_non_nullable
                  as TimeMode,
        startDate: null == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        endDate: null == endDate
            ? _value.endDate
            : endDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        timeZone: null == timeZone
            ? _value.timeZone
            : timeZone // ignore: cast_nullable_to_non_nullable
                  as String,
        bucket: null == bucket
            ? _value.bucket
            : bucket // ignore: cast_nullable_to_non_nullable
                  as TimeBucket,
        pastMinutesStart: freezed == pastMinutesStart
            ? _value.pastMinutesStart
            : pastMinutesStart // ignore: cast_nullable_to_non_nullable
                  as int?,
        pastMinutesEnd: freezed == pastMinutesEnd
            ? _value.pastMinutesEnd
            : pastMinutesEnd // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc

class _$TimeRangeImpl extends _TimeRange {
  const _$TimeRangeImpl({
    required this.mode,
    required this.startDate,
    required this.endDate,
    required this.timeZone,
    this.bucket = TimeBucket.hour,
    this.pastMinutesStart,
    this.pastMinutesEnd,
  }) : super._();

  @override
  final TimeMode mode;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final String timeZone;
  @override
  @JsonKey()
  final TimeBucket bucket;
  @override
  final int? pastMinutesStart;
  @override
  final int? pastMinutesEnd;

  @override
  String toString() {
    return 'TimeRange(mode: $mode, startDate: $startDate, endDate: $endDate, timeZone: $timeZone, bucket: $bucket, pastMinutesStart: $pastMinutesStart, pastMinutesEnd: $pastMinutesEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRangeImpl &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.bucket, bucket) || other.bucket == bucket) &&
            (identical(other.pastMinutesStart, pastMinutesStart) ||
                other.pastMinutesStart == pastMinutesStart) &&
            (identical(other.pastMinutesEnd, pastMinutesEnd) ||
                other.pastMinutesEnd == pastMinutesEnd));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    mode,
    startDate,
    endDate,
    timeZone,
    bucket,
    pastMinutesStart,
    pastMinutesEnd,
  );

  /// Create a copy of TimeRange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRangeImplCopyWith<_$TimeRangeImpl> get copyWith =>
      __$$TimeRangeImplCopyWithImpl<_$TimeRangeImpl>(this, _$identity);
}

abstract class _TimeRange extends TimeRange {
  const factory _TimeRange({
    required final TimeMode mode,
    required final DateTime startDate,
    required final DateTime endDate,
    required final String timeZone,
    final TimeBucket bucket,
    final int? pastMinutesStart,
    final int? pastMinutesEnd,
  }) = _$TimeRangeImpl;
  const _TimeRange._() : super._();

  @override
  TimeMode get mode;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  String get timeZone;
  @override
  TimeBucket get bucket;
  @override
  int? get pastMinutesStart;
  @override
  int? get pastMinutesEnd;

  /// Create a copy of TimeRange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeRangeImplCopyWith<_$TimeRangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
