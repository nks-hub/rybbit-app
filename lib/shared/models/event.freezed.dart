// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EventName _$EventNameFromJson(Map<String, dynamic> json) {
  return _EventName.fromJson(json);
}

/// @nodoc
mixin _$EventName {
  @JsonKey(name: 'event_name')
  String get eventName => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  /// Serializes this EventName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventNameCopyWith<EventName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventNameCopyWith<$Res> {
  factory $EventNameCopyWith(EventName value, $Res Function(EventName) then) =
      _$EventNameCopyWithImpl<$Res, EventName>;
  @useResult
  $Res call({@JsonKey(name: 'event_name') String eventName, int count});
}

/// @nodoc
class _$EventNameCopyWithImpl<$Res, $Val extends EventName>
    implements $EventNameCopyWith<$Res> {
  _$EventNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? eventName = null, Object? count = null}) {
    return _then(
      _value.copyWith(
            eventName: null == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String,
            count: null == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EventNameImplCopyWith<$Res>
    implements $EventNameCopyWith<$Res> {
  factory _$$EventNameImplCopyWith(
    _$EventNameImpl value,
    $Res Function(_$EventNameImpl) then,
  ) = __$$EventNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'event_name') String eventName, int count});
}

/// @nodoc
class __$$EventNameImplCopyWithImpl<$Res>
    extends _$EventNameCopyWithImpl<$Res, _$EventNameImpl>
    implements _$$EventNameImplCopyWith<$Res> {
  __$$EventNameImplCopyWithImpl(
    _$EventNameImpl _value,
    $Res Function(_$EventNameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EventName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? eventName = null, Object? count = null}) {
    return _then(
      _$EventNameImpl(
        eventName: null == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String,
        count: null == count
            ? _value.count
            : count // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EventNameImpl implements _EventName {
  const _$EventNameImpl({
    @JsonKey(name: 'event_name') this.eventName = '',
    this.count = 0,
  });

  factory _$EventNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventNameImplFromJson(json);

  @override
  @JsonKey(name: 'event_name')
  final String eventName;
  @override
  @JsonKey()
  final int count;

  @override
  String toString() {
    return 'EventName(eventName: $eventName, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventNameImpl &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eventName, count);

  /// Create a copy of EventName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventNameImplCopyWith<_$EventNameImpl> get copyWith =>
      __$$EventNameImplCopyWithImpl<_$EventNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventNameImplToJson(this);
  }
}

abstract class _EventName implements EventName {
  const factory _EventName({
    @JsonKey(name: 'event_name') final String eventName,
    final int count,
  }) = _$EventNameImpl;

  factory _EventName.fromJson(Map<String, dynamic> json) =
      _$EventNameImpl.fromJson;

  @override
  @JsonKey(name: 'event_name')
  String get eventName;
  @override
  int get count;

  /// Create a copy of EventName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventNameImplCopyWith<_$EventNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
