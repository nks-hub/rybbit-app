// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'performance_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PerformanceOverview _$PerformanceOverviewFromJson(Map<String, dynamic> json) {
  return _PerformanceOverview.fromJson(json);
}

/// @nodoc
mixin _$PerformanceOverview {
  double get lcp => throw _privateConstructorUsedError;
  double get fid => throw _privateConstructorUsedError;
  double get cls => throw _privateConstructorUsedError;
  double get fcp => throw _privateConstructorUsedError;
  double get ttfb => throw _privateConstructorUsedError;
  double get inp => throw _privateConstructorUsedError;

  /// Serializes this PerformanceOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PerformanceOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PerformanceOverviewCopyWith<PerformanceOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PerformanceOverviewCopyWith<$Res> {
  factory $PerformanceOverviewCopyWith(
    PerformanceOverview value,
    $Res Function(PerformanceOverview) then,
  ) = _$PerformanceOverviewCopyWithImpl<$Res, PerformanceOverview>;
  @useResult
  $Res call({
    double lcp,
    double fid,
    double cls,
    double fcp,
    double ttfb,
    double inp,
  });
}

/// @nodoc
class _$PerformanceOverviewCopyWithImpl<$Res, $Val extends PerformanceOverview>
    implements $PerformanceOverviewCopyWith<$Res> {
  _$PerformanceOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PerformanceOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lcp = null,
    Object? fid = null,
    Object? cls = null,
    Object? fcp = null,
    Object? ttfb = null,
    Object? inp = null,
  }) {
    return _then(
      _value.copyWith(
            lcp: null == lcp
                ? _value.lcp
                : lcp // ignore: cast_nullable_to_non_nullable
                      as double,
            fid: null == fid
                ? _value.fid
                : fid // ignore: cast_nullable_to_non_nullable
                      as double,
            cls: null == cls
                ? _value.cls
                : cls // ignore: cast_nullable_to_non_nullable
                      as double,
            fcp: null == fcp
                ? _value.fcp
                : fcp // ignore: cast_nullable_to_non_nullable
                      as double,
            ttfb: null == ttfb
                ? _value.ttfb
                : ttfb // ignore: cast_nullable_to_non_nullable
                      as double,
            inp: null == inp
                ? _value.inp
                : inp // ignore: cast_nullable_to_non_nullable
                      as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PerformanceOverviewImplCopyWith<$Res>
    implements $PerformanceOverviewCopyWith<$Res> {
  factory _$$PerformanceOverviewImplCopyWith(
    _$PerformanceOverviewImpl value,
    $Res Function(_$PerformanceOverviewImpl) then,
  ) = __$$PerformanceOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    double lcp,
    double fid,
    double cls,
    double fcp,
    double ttfb,
    double inp,
  });
}

/// @nodoc
class __$$PerformanceOverviewImplCopyWithImpl<$Res>
    extends _$PerformanceOverviewCopyWithImpl<$Res, _$PerformanceOverviewImpl>
    implements _$$PerformanceOverviewImplCopyWith<$Res> {
  __$$PerformanceOverviewImplCopyWithImpl(
    _$PerformanceOverviewImpl _value,
    $Res Function(_$PerformanceOverviewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PerformanceOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lcp = null,
    Object? fid = null,
    Object? cls = null,
    Object? fcp = null,
    Object? ttfb = null,
    Object? inp = null,
  }) {
    return _then(
      _$PerformanceOverviewImpl(
        lcp: null == lcp
            ? _value.lcp
            : lcp // ignore: cast_nullable_to_non_nullable
                  as double,
        fid: null == fid
            ? _value.fid
            : fid // ignore: cast_nullable_to_non_nullable
                  as double,
        cls: null == cls
            ? _value.cls
            : cls // ignore: cast_nullable_to_non_nullable
                  as double,
        fcp: null == fcp
            ? _value.fcp
            : fcp // ignore: cast_nullable_to_non_nullable
                  as double,
        ttfb: null == ttfb
            ? _value.ttfb
            : ttfb // ignore: cast_nullable_to_non_nullable
                  as double,
        inp: null == inp
            ? _value.inp
            : inp // ignore: cast_nullable_to_non_nullable
                  as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PerformanceOverviewImpl implements _PerformanceOverview {
  const _$PerformanceOverviewImpl({
    this.lcp = 0,
    this.fid = 0,
    this.cls = 0,
    this.fcp = 0,
    this.ttfb = 0,
    this.inp = 0,
  });

  factory _$PerformanceOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$PerformanceOverviewImplFromJson(json);

  @override
  @JsonKey()
  final double lcp;
  @override
  @JsonKey()
  final double fid;
  @override
  @JsonKey()
  final double cls;
  @override
  @JsonKey()
  final double fcp;
  @override
  @JsonKey()
  final double ttfb;
  @override
  @JsonKey()
  final double inp;

  @override
  String toString() {
    return 'PerformanceOverview(lcp: $lcp, fid: $fid, cls: $cls, fcp: $fcp, ttfb: $ttfb, inp: $inp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PerformanceOverviewImpl &&
            (identical(other.lcp, lcp) || other.lcp == lcp) &&
            (identical(other.fid, fid) || other.fid == fid) &&
            (identical(other.cls, cls) || other.cls == cls) &&
            (identical(other.fcp, fcp) || other.fcp == fcp) &&
            (identical(other.ttfb, ttfb) || other.ttfb == ttfb) &&
            (identical(other.inp, inp) || other.inp == inp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lcp, fid, cls, fcp, ttfb, inp);

  /// Create a copy of PerformanceOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PerformanceOverviewImplCopyWith<_$PerformanceOverviewImpl> get copyWith =>
      __$$PerformanceOverviewImplCopyWithImpl<_$PerformanceOverviewImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PerformanceOverviewImplToJson(this);
  }
}

abstract class _PerformanceOverview implements PerformanceOverview {
  const factory _PerformanceOverview({
    final double lcp,
    final double fid,
    final double cls,
    final double fcp,
    final double ttfb,
    final double inp,
  }) = _$PerformanceOverviewImpl;

  factory _PerformanceOverview.fromJson(Map<String, dynamic> json) =
      _$PerformanceOverviewImpl.fromJson;

  @override
  double get lcp;
  @override
  double get fid;
  @override
  double get cls;
  @override
  double get fcp;
  @override
  double get ttfb;
  @override
  double get inp;

  /// Create a copy of PerformanceOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PerformanceOverviewImplCopyWith<_$PerformanceOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
