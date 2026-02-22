import 'package:freezed_annotation/freezed_annotation.dart';

part 'funnel.freezed.dart';
part 'funnel.g.dart';

@freezed
class Funnel with _$Funnel {
  const factory Funnel({
    @JsonKey(name: 'funnel_id') required int funnelId,
    required String name,
    dynamic data,
  }) = _Funnel;

  factory Funnel.fromJson(Map<String, dynamic> json) =>
      _$FunnelFromJson(json);
}
