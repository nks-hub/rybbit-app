import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/organization.dart';
import 'models.dart';

class OrganizationsRepository {
  final Dio _dio;

  OrganizationsRepository(this._dio);

  /// Fetches all organizations.
  Future<List<Organization>> getOrganizations() async {
    final response = await _dio.get('/api/organizations');
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  /// Fetches members for an organization.
  Future<List<OrgMember>> getMembers(String orgId) async {
    final response = await _dio.get('/api/organizations/$orgId/members');
    final data = response.data;
    if (data is List) {
      return data
          .map((e) => OrgMember.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    if (data is Map<String, dynamic> && data['data'] is List) {
      return (data['data'] as List)
          .map((e) => OrgMember.fromJson(e as Map<String, dynamic>))
          .toList();
    }
    return [];
  }
}

final organizationsRepositoryProvider =
    Provider<OrganizationsRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return OrganizationsRepository(dio);
});
