// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalImpl _$$GoalImplFromJson(Map<String, dynamic> json) => _$GoalImpl(
  goalId: (json['goal_id'] as num).toInt(),
  name: json['name'] as String,
  goalType: json['goal_type'] as String,
  pathPattern: json['path_pattern'] as String?,
  eventName: json['event_name'] as String?,
  eventPropertyKey: json['event_property_key'] as String?,
  eventPropertyValue: json['event_property_value'] as String?,
);

Map<String, dynamic> _$$GoalImplToJson(_$GoalImpl instance) =>
    <String, dynamic>{
      'goal_id': instance.goalId,
      'name': instance.name,
      'goal_type': instance.goalType,
      'path_pattern': instance.pathPattern,
      'event_name': instance.eventName,
      'event_property_key': instance.eventPropertyKey,
      'event_property_value': instance.eventPropertyValue,
    };
