// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventNameImpl _$$EventNameImplFromJson(Map<String, dynamic> json) =>
    _$EventNameImpl(
      eventName: json['event_name'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$EventNameImplToJson(_$EventNameImpl instance) =>
    <String, dynamic>{
      'event_name': instance.eventName,
      'count': instance.count,
    };
