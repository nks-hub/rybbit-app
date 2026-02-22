// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OverviewImpl _$$OverviewImplFromJson(Map<String, dynamic> json) =>
    _$OverviewImpl(
      sessions: (json['sessions'] as num?)?.toInt() ?? 0,
      pageviews: (json['pageviews'] as num?)?.toInt() ?? 0,
      users: (json['users'] as num?)?.toInt() ?? 0,
      pagesPerSession: (json['pages_per_session'] as num?)?.toDouble() ?? 0,
      bounceRate: (json['bounce_rate'] as num?)?.toDouble() ?? 0,
      sessionDuration: (json['session_duration'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OverviewImplToJson(_$OverviewImpl instance) =>
    <String, dynamic>{
      'sessions': instance.sessions,
      'pageviews': instance.pageviews,
      'users': instance.users,
      'pages_per_session': instance.pagesPerSession,
      'bounce_rate': instance.bounceRate,
      'session_duration': instance.sessionDuration,
    };

_$OverviewBucketImpl _$$OverviewBucketImplFromJson(Map<String, dynamic> json) =>
    _$OverviewBucketImpl(
      time: json['time'] as String? ?? '',
      pageviews: (json['pageviews'] as num?)?.toInt() ?? 0,
      sessions: (json['sessions'] as num?)?.toInt() ?? 0,
      users: (json['users'] as num?)?.toInt() ?? 0,
      pagesPerSession: (json['pages_per_session'] as num?)?.toDouble() ?? 0,
      bounceRate: (json['bounce_rate'] as num?)?.toDouble() ?? 0,
      sessionDuration: (json['session_duration'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OverviewBucketImplToJson(
  _$OverviewBucketImpl instance,
) => <String, dynamic>{
  'time': instance.time,
  'pageviews': instance.pageviews,
  'sessions': instance.sessions,
  'users': instance.users,
  'pages_per_session': instance.pagesPerSession,
  'bounce_rate': instance.bounceRate,
  'session_duration': instance.sessionDuration,
};
