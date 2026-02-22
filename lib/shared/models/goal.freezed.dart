// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Goal _$GoalFromJson(Map<String, dynamic> json) {
  return _Goal.fromJson(json);
}

/// @nodoc
mixin _$Goal {
  @JsonKey(name: 'goal_id')
  int get goalId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'goal_type')
  String get goalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'path_pattern')
  String? get pathPattern => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_name')
  String? get eventName => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_property_key')
  String? get eventPropertyKey => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_property_value')
  String? get eventPropertyValue => throw _privateConstructorUsedError;

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalCopyWith<Goal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalCopyWith<$Res> {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) then) =
      _$GoalCopyWithImpl<$Res, Goal>;
  @useResult
  $Res call({
    @JsonKey(name: 'goal_id') int goalId,
    String name,
    @JsonKey(name: 'goal_type') String goalType,
    @JsonKey(name: 'path_pattern') String? pathPattern,
    @JsonKey(name: 'event_name') String? eventName,
    @JsonKey(name: 'event_property_key') String? eventPropertyKey,
    @JsonKey(name: 'event_property_value') String? eventPropertyValue,
  });
}

/// @nodoc
class _$GoalCopyWithImpl<$Res, $Val extends Goal>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalId = null,
    Object? name = null,
    Object? goalType = null,
    Object? pathPattern = freezed,
    Object? eventName = freezed,
    Object? eventPropertyKey = freezed,
    Object? eventPropertyValue = freezed,
  }) {
    return _then(
      _value.copyWith(
            goalId: null == goalId
                ? _value.goalId
                : goalId // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            goalType: null == goalType
                ? _value.goalType
                : goalType // ignore: cast_nullable_to_non_nullable
                      as String,
            pathPattern: freezed == pathPattern
                ? _value.pathPattern
                : pathPattern // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventName: freezed == eventName
                ? _value.eventName
                : eventName // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventPropertyKey: freezed == eventPropertyKey
                ? _value.eventPropertyKey
                : eventPropertyKey // ignore: cast_nullable_to_non_nullable
                      as String?,
            eventPropertyValue: freezed == eventPropertyValue
                ? _value.eventPropertyValue
                : eventPropertyValue // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalImplCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$$GoalImplCopyWith(
    _$GoalImpl value,
    $Res Function(_$GoalImpl) then,
  ) = __$$GoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'goal_id') int goalId,
    String name,
    @JsonKey(name: 'goal_type') String goalType,
    @JsonKey(name: 'path_pattern') String? pathPattern,
    @JsonKey(name: 'event_name') String? eventName,
    @JsonKey(name: 'event_property_key') String? eventPropertyKey,
    @JsonKey(name: 'event_property_value') String? eventPropertyValue,
  });
}

/// @nodoc
class __$$GoalImplCopyWithImpl<$Res>
    extends _$GoalCopyWithImpl<$Res, _$GoalImpl>
    implements _$$GoalImplCopyWith<$Res> {
  __$$GoalImplCopyWithImpl(_$GoalImpl _value, $Res Function(_$GoalImpl) _then)
    : super(_value, _then);

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalId = null,
    Object? name = null,
    Object? goalType = null,
    Object? pathPattern = freezed,
    Object? eventName = freezed,
    Object? eventPropertyKey = freezed,
    Object? eventPropertyValue = freezed,
  }) {
    return _then(
      _$GoalImpl(
        goalId: null == goalId
            ? _value.goalId
            : goalId // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        goalType: null == goalType
            ? _value.goalType
            : goalType // ignore: cast_nullable_to_non_nullable
                  as String,
        pathPattern: freezed == pathPattern
            ? _value.pathPattern
            : pathPattern // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventName: freezed == eventName
            ? _value.eventName
            : eventName // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventPropertyKey: freezed == eventPropertyKey
            ? _value.eventPropertyKey
            : eventPropertyKey // ignore: cast_nullable_to_non_nullable
                  as String?,
        eventPropertyValue: freezed == eventPropertyValue
            ? _value.eventPropertyValue
            : eventPropertyValue // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalImpl implements _Goal {
  const _$GoalImpl({
    @JsonKey(name: 'goal_id') required this.goalId,
    required this.name,
    @JsonKey(name: 'goal_type') required this.goalType,
    @JsonKey(name: 'path_pattern') this.pathPattern,
    @JsonKey(name: 'event_name') this.eventName,
    @JsonKey(name: 'event_property_key') this.eventPropertyKey,
    @JsonKey(name: 'event_property_value') this.eventPropertyValue,
  });

  factory _$GoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalImplFromJson(json);

  @override
  @JsonKey(name: 'goal_id')
  final int goalId;
  @override
  final String name;
  @override
  @JsonKey(name: 'goal_type')
  final String goalType;
  @override
  @JsonKey(name: 'path_pattern')
  final String? pathPattern;
  @override
  @JsonKey(name: 'event_name')
  final String? eventName;
  @override
  @JsonKey(name: 'event_property_key')
  final String? eventPropertyKey;
  @override
  @JsonKey(name: 'event_property_value')
  final String? eventPropertyValue;

  @override
  String toString() {
    return 'Goal(goalId: $goalId, name: $name, goalType: $goalType, pathPattern: $pathPattern, eventName: $eventName, eventPropertyKey: $eventPropertyKey, eventPropertyValue: $eventPropertyValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalImpl &&
            (identical(other.goalId, goalId) || other.goalId == goalId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.goalType, goalType) ||
                other.goalType == goalType) &&
            (identical(other.pathPattern, pathPattern) ||
                other.pathPattern == pathPattern) &&
            (identical(other.eventName, eventName) ||
                other.eventName == eventName) &&
            (identical(other.eventPropertyKey, eventPropertyKey) ||
                other.eventPropertyKey == eventPropertyKey) &&
            (identical(other.eventPropertyValue, eventPropertyValue) ||
                other.eventPropertyValue == eventPropertyValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    goalId,
    name,
    goalType,
    pathPattern,
    eventName,
    eventPropertyKey,
    eventPropertyValue,
  );

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      __$$GoalImplCopyWithImpl<_$GoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalImplToJson(this);
  }
}

abstract class _Goal implements Goal {
  const factory _Goal({
    @JsonKey(name: 'goal_id') required final int goalId,
    required final String name,
    @JsonKey(name: 'goal_type') required final String goalType,
    @JsonKey(name: 'path_pattern') final String? pathPattern,
    @JsonKey(name: 'event_name') final String? eventName,
    @JsonKey(name: 'event_property_key') final String? eventPropertyKey,
    @JsonKey(name: 'event_property_value') final String? eventPropertyValue,
  }) = _$GoalImpl;

  factory _Goal.fromJson(Map<String, dynamic> json) = _$GoalImpl.fromJson;

  @override
  @JsonKey(name: 'goal_id')
  int get goalId;
  @override
  String get name;
  @override
  @JsonKey(name: 'goal_type')
  String get goalType;
  @override
  @JsonKey(name: 'path_pattern')
  String? get pathPattern;
  @override
  @JsonKey(name: 'event_name')
  String? get eventName;
  @override
  @JsonKey(name: 'event_property_key')
  String? get eventPropertyKey;
  @override
  @JsonKey(name: 'event_property_value')
  String? get eventPropertyValue;

  /// Create a copy of Goal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalImplCopyWith<_$GoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
