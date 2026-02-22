// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'performance_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PerformanceOverviewImpl _$$PerformanceOverviewImplFromJson(
  Map<String, dynamic> json,
) => _$PerformanceOverviewImpl(
  lcp: (json['lcp'] as num?)?.toDouble() ?? 0,
  fid: (json['fid'] as num?)?.toDouble() ?? 0,
  cls: (json['cls'] as num?)?.toDouble() ?? 0,
  fcp: (json['fcp'] as num?)?.toDouble() ?? 0,
  ttfb: (json['ttfb'] as num?)?.toDouble() ?? 0,
  inp: (json['inp'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$$PerformanceOverviewImplToJson(
  _$PerformanceOverviewImpl instance,
) => <String, dynamic>{
  'lcp': instance.lcp,
  'fid': instance.fid,
  'cls': instance.cls,
  'fcp': instance.fcp,
  'ttfb': instance.ttfb,
  'inp': instance.inp,
};
