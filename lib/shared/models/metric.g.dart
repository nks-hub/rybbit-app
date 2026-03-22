// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MetricItem _$MetricItemFromJson(Map<String, dynamic> json) => _MetricItem(
  value: json['value'] as String,
  title: json['title'] as String?,
  pathname: json['pathname'] as String?,
  count: (json['count'] as num?)?.toInt() ?? 0,
  percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
  pageviews: (json['pageviews'] as num?)?.toInt(),
  pageviewsPercentage: (json['pageviews_percentage'] as num?)?.toDouble(),
  timeOnPageSeconds: (json['time_on_page_seconds'] as num?)?.toDouble(),
  bounceRate: (json['bounce_rate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$MetricItemToJson(_MetricItem instance) =>
    <String, dynamic>{
      'value': instance.value,
      'title': instance.title,
      'pathname': instance.pathname,
      'count': instance.count,
      'percentage': instance.percentage,
      'pageviews': instance.pageviews,
      'pageviews_percentage': instance.pageviewsPercentage,
      'time_on_page_seconds': instance.timeOnPageSeconds,
      'bounce_rate': instance.bounceRate,
    };

_MetricResponse _$MetricResponseFromJson(Map<String, dynamic> json) =>
    _MetricResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => MetricItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$MetricResponseToJson(_MetricResponse instance) =>
    <String, dynamic>{'data': instance.data, 'totalCount': instance.totalCount};
