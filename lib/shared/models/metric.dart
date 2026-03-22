import 'package:freezed_annotation/freezed_annotation.dart';

part 'metric.freezed.dart';
part 'metric.g.dart';

@freezed
abstract class MetricItem with _$MetricItem {
  const factory MetricItem({
    required String value,
    String? title,
    String? pathname,
    @Default(0) int count,
    @Default(0) double percentage,
    int? pageviews,
    @JsonKey(name: 'pageviews_percentage') double? pageviewsPercentage,
    @JsonKey(name: 'time_on_page_seconds') double? timeOnPageSeconds,
    @JsonKey(name: 'bounce_rate') double? bounceRate,
  }) = _MetricItem;

  factory MetricItem.fromJson(Map<String, dynamic> json) =>
      _$MetricItemFromJson(json);
}

@freezed
abstract class MetricResponse with _$MetricResponse {
  const factory MetricResponse({
    required List<MetricItem> data,
    @JsonKey(name: 'totalCount') @Default(0) int totalCount,
  }) = _MetricResponse;

  factory MetricResponse.fromJson(Map<String, dynamic> json) =>
      _$MetricResponseFromJson(json);
}
