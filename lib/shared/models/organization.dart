import 'package:freezed_annotation/freezed_annotation.dart';

part 'organization.freezed.dart';
part 'organization.g.dart';

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String slug,
    String? logo,
  }) = _Organization;

  factory Organization.fromJson(Map<String, dynamic> json) =>
      _$OrganizationFromJson(json);
}

@freezed
abstract class OrgWithSites with _$OrgWithSites {
  const factory OrgWithSites({
    required Organization organization,
    required List<dynamic> sites,
  }) = _OrgWithSites;

  factory OrgWithSites.fromJson(Map<String, dynamic> json) =>
      _$OrgWithSitesFromJson(json);
}
