import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal.freezed.dart';
part 'goal.g.dart';

@freezed
class Goal with _$Goal {
  const factory Goal({
    @JsonKey(name: 'goal_id') required int goalId,
    required String name,
    @JsonKey(name: 'goal_type') required String goalType,
    @JsonKey(name: 'path_pattern') String? pathPattern,
    @JsonKey(name: 'event_name') String? eventName,
    @JsonKey(name: 'event_property_key') String? eventPropertyKey,
    @JsonKey(name: 'event_property_value') String? eventPropertyValue,
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);
}
