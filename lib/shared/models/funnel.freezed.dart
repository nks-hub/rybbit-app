// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'funnel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Funnel _$FunnelFromJson(Map<String, dynamic> json) {
  return _Funnel.fromJson(json);
}

/// @nodoc
mixin _$Funnel {
  @JsonKey(name: 'funnel_id')
  int get funnelId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;

  /// Serializes this Funnel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Funnel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FunnelCopyWith<Funnel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FunnelCopyWith<$Res> {
  factory $FunnelCopyWith(Funnel value, $Res Function(Funnel) then) =
      _$FunnelCopyWithImpl<$Res, Funnel>;
  @useResult
  $Res call({
    @JsonKey(name: 'funnel_id') int funnelId,
    String name,
    dynamic data,
  });
}

/// @nodoc
class _$FunnelCopyWithImpl<$Res, $Val extends Funnel>
    implements $FunnelCopyWith<$Res> {
  _$FunnelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Funnel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? funnelId = null,
    Object? name = null,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            funnelId: null == funnelId
                ? _value.funnelId
                : funnelId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as dynamic,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FunnelImplCopyWith<$Res> implements $FunnelCopyWith<$Res> {
  factory _$$FunnelImplCopyWith(
    _$FunnelImpl value,
    $Res Function(_$FunnelImpl) then,
  ) = __$$FunnelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'funnel_id') int funnelId,
    String name,
    dynamic data,
  });
}

/// @nodoc
class __$$FunnelImplCopyWithImpl<$Res>
    extends _$FunnelCopyWithImpl<$Res, _$FunnelImpl>
    implements _$$FunnelImplCopyWith<$Res> {
  __$$FunnelImplCopyWithImpl(
    _$FunnelImpl _value,
    $Res Function(_$FunnelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Funnel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? funnelId = null,
    Object? name = null,
    Object? data = freezed,
  }) {
    return _then(
      _$FunnelImpl(
        funnelId: null == funnelId
            ? _value.funnelId
            : funnelId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as dynamic,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FunnelImpl implements _Funnel {
  const _$FunnelImpl({
    @JsonKey(name: 'funnel_id') required this.funnelId,
    required this.name,
    this.data,
  });

  factory _$FunnelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FunnelImplFromJson(json);

  @override
  @JsonKey(name: 'funnel_id')
  final int funnelId;
  @override
  final String name;
  @override
  final dynamic data;

  @override
  String toString() {
    return 'Funnel(funnelId: $funnelId, name: $name, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FunnelImpl &&
            (identical(other.funnelId, funnelId) ||
                other.funnelId == funnelId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    funnelId,
    name,
    const DeepCollectionEquality().hash(data),
  );

  /// Create a copy of Funnel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FunnelImplCopyWith<_$FunnelImpl> get copyWith =>
      __$$FunnelImplCopyWithImpl<_$FunnelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FunnelImplToJson(this);
  }
}

abstract class _Funnel implements Funnel {
  const factory _Funnel({
    @JsonKey(name: 'funnel_id') required final int funnelId,
    required final String name,
    final dynamic data,
  }) = _$FunnelImpl;

  factory _Funnel.fromJson(Map<String, dynamic> json) = _$FunnelImpl.fromJson;

  @override
  @JsonKey(name: 'funnel_id')
  int get funnelId;
  @override
  String get name;
  @override
  dynamic get data;

  /// Create a copy of Funnel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FunnelImplCopyWith<_$FunnelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
