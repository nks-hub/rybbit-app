// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FilterImpl _$$FilterImplFromJson(Map<String, dynamic> json) => _$FilterImpl(
  parameter: $enumDecode(_$FilterParameterEnumMap, json['parameter']),
  type: $enumDecode(_$FilterTypeEnumMap, json['type']),
  value: (json['value'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$$FilterImplToJson(_$FilterImpl instance) =>
    <String, dynamic>{
      'parameter': _$FilterParameterEnumMap[instance.parameter]!,
      'type': _$FilterTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

const _$FilterParameterEnumMap = {
  FilterParameter.browser: 'browser',
  FilterParameter.operatingSystem: 'operating_system',
  FilterParameter.language: 'language',
  FilterParameter.country: 'country',
  FilterParameter.region: 'region',
  FilterParameter.city: 'city',
  FilterParameter.deviceType: 'device_type',
  FilterParameter.referrer: 'referrer',
  FilterParameter.hostname: 'hostname',
  FilterParameter.pathname: 'pathname',
  FilterParameter.pageTitle: 'page_title',
  FilterParameter.querystring: 'querystring',
  FilterParameter.eventName: 'event_name',
  FilterParameter.channel: 'channel',
  FilterParameter.utmSource: 'utm_source',
  FilterParameter.utmMedium: 'utm_medium',
  FilterParameter.utmCampaign: 'utm_campaign',
  FilterParameter.utmTerm: 'utm_term',
  FilterParameter.utmContent: 'utm_content',
  FilterParameter.entryPage: 'entry_page',
  FilterParameter.exitPage: 'exit_page',
  FilterParameter.deviceModel: 'device_model',
  FilterParameter.appVersion: 'app_version',
};

const _$FilterTypeEnumMap = {
  FilterType.equals: 'equals',
  FilterType.notEquals: 'not_equals',
  FilterType.contains: 'contains',
  FilterType.notContains: 'not_contains',
  FilterType.regex: 'regex',
  FilterType.notRegex: 'not_regex',
  FilterType.greaterThan: 'greater_than',
  FilterType.lessThan: 'less_than',
};
