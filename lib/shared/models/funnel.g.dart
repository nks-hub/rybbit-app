// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funnel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FunnelImpl _$$FunnelImplFromJson(Map<String, dynamic> json) => _$FunnelImpl(
  funnelId: (json['funnel_id'] as num).toInt(),
  name: json['name'] as String,
  data: json['data'],
);

Map<String, dynamic> _$$FunnelImplToJson(_$FunnelImpl instance) =>
    <String, dynamic>{
      'funnel_id': instance.funnelId,
      'name': instance.name,
      'data': instance.data,
    };
