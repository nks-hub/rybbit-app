// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrganizationImpl _$$OrganizationImplFromJson(Map<String, dynamic> json) =>
    _$OrganizationImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$OrganizationImplToJson(_$OrganizationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
    };

_$OrgWithSitesImpl _$$OrgWithSitesImplFromJson(Map<String, dynamic> json) =>
    _$OrgWithSitesImpl(
      organization: Organization.fromJson(
        json['organization'] as Map<String, dynamic>,
      ),
      sites: json['sites'] as List<dynamic>,
    );

Map<String, dynamic> _$$OrgWithSitesImplToJson(_$OrgWithSitesImpl instance) =>
    <String, dynamic>{
      'organization': instance.organization,
      'sites': instance.sites,
    };
