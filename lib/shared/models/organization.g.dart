// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };

_OrgWithSites _$OrgWithSitesFromJson(Map<String, dynamic> json) =>
    _OrgWithSites(
      organization: Organization.fromJson(
        json['organization'] as Map<String, dynamic>,
      ),
      sites: json['sites'] as List<dynamic>,
    );

Map<String, dynamic> _$OrgWithSitesToJson(_OrgWithSites instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'sites': instance.sites,
    };
