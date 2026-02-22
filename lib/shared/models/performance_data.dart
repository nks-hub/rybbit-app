import 'package:freezed_annotation/freezed_annotation.dart';

part 'performance_data.freezed.dart';
part 'performance_data.g.dart';

@freezed
class PerformanceOverview with _$PerformanceOverview {
  const factory PerformanceOverview({
    @Default(0) double lcp,
    @Default(0) double fid,
    @Default(0) double cls,
    @Default(0) double fcp,
    @Default(0) double ttfb,
    @Default(0) double inp,
  }) = _PerformanceOverview;

  factory PerformanceOverview.fromJson(Map<String, dynamic> json) =>
      _$PerformanceOverviewFromJson(json);
}
