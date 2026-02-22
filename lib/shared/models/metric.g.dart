// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MetricItemImpl _$$MetricItemImplFromJson(Map<String, dynamic> json) =>
    _$MetricItemImpl(
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

Map<String, dynamic> _$$MetricItemImplToJson(_$MetricItemImpl instance) =>
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

_$MetricResponseImpl _$$MetricResponseImplFromJson(Map<String, dynamic> json) =>
    _$MetricResponseImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => MetricItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num).toInt(),
    );

Map<String, dynamic> _$$MetricResponseImplToJson(
  _$MetricResponseImpl instance,
) => <String, dynamic>{
  'data': instance.data,
  'total_count': instance.totalCount,
};
