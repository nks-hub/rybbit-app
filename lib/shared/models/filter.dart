import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter.freezed.dart';
part 'filter.g.dart';

@JsonEnum(valueField: 'value')
enum FilterType {
  equals('equals'),
  notEquals('not_equals'),
  contains('contains'),
  notContains('not_contains'),
  regex('regex'),
  notRegex('not_regex'),
  greaterThan('greater_than'),
  lessThan('less_than');

  const FilterType(this.value);
  final String value;
}

@JsonEnum(valueField: 'value')
enum FilterParameter {
  browser('browser'),
  operatingSystem('operating_system'),
  language('language'),
  country('country'),
  region('region'),
  city('city'),
  deviceType('device_type'),
  referrer('referrer'),
  hostname('hostname'),
  pathname('pathname'),
  pageTitle('page_title'),
  querystring('querystring'),
  eventName('event_name'),
  channel('channel'),
  utmSource('utm_source'),
  utmMedium('utm_medium'),
  utmCampaign('utm_campaign'),
  utmTerm('utm_term'),
  utmContent('utm_content'),
  entryPage('entry_page'),
  exitPage('exit_page'),
  deviceModel('device_model'),
  appVersion('app_version');

  const FilterParameter(this.value);
  final String value;

  /// Whether this filter is only relevant for web sites.
  bool get isWebOnly => const {
    FilterParameter.referrer,
    FilterParameter.hostname,
    FilterParameter.channel,
    FilterParameter.querystring,
    FilterParameter.utmSource,
    FilterParameter.utmMedium,
    FilterParameter.utmCampaign,
    FilterParameter.utmTerm,
    FilterParameter.utmContent,
  }.contains(this);

  /// Whether this filter is only relevant for mobile/desktop sites.
  bool get isMobileOnly => const {
    FilterParameter.deviceModel,
    FilterParameter.appVersion,
  }.contains(this);
}

@freezed
abstract class Filter with _$Filter {
  const factory Filter({
    required FilterParameter parameter,
    required FilterType type,
    required List<String> value,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
