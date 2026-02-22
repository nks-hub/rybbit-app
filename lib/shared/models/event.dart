import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class EventName with _$EventName {
  const factory EventName({
    @JsonKey(name: 'event_name') required String eventName,
    @Default(0) int count,
  }) = _EventName;

  factory EventName.fromJson(Map<String, dynamic> json) =>
      _$EventNameFromJson(json);
}
