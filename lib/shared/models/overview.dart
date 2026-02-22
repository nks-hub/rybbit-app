import 'package:freezed_annotation/freezed_annotation.dart';

part 'overview.freezed.dart';
part 'overview.g.dart';

@freezed
class Overview with _$Overview {
  const factory Overview({
    @Default(0) int sessions,
    @Default(0) int pageviews,
    @Default(0) int users,
    @JsonKey(name: 'pages_per_session') @Default(0) double pagesPerSession,
    @JsonKey(name: 'bounce_rate') @Default(0) double bounceRate,
    @JsonKey(name: 'session_duration') @Default(0) double sessionDuration,
  }) = _Overview;

  factory Overview.fromJson(Map<String, dynamic> json) =>
      _$OverviewFromJson(json);
}

@freezed
class OverviewBucket with _$OverviewBucket {
  const factory OverviewBucket({
    @Default('') String time,
    @Default(0) int pageviews,
    @Default(0) int sessions,
    @Default(0) int users,
    @JsonKey(name: 'pages_per_session') @Default(0) double pagesPerSession,
    @JsonKey(name: 'bounce_rate') @Default(0) double bounceRate,
    @JsonKey(name: 'session_duration') @Default(0) double sessionDuration,
  }) = _OverviewBucket;

  factory OverviewBucket.fromJson(Map<String, dynamic> json) =>
      _$OverviewBucketFromJson(json);
}
