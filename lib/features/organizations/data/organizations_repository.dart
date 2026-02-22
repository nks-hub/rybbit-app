import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/organization.dart';

class OrgMember {
  final String userId;
  final String? email;
  final String? name;
  final String role;

  const OrgMember({
    required this.userId,
    this.email,
    this.name,
    required this.role,
  });

  factory OrgMember.fromJson(Map<String, dynamic> json) {
    return OrgMember(
      userId: json['user_id'] as String? ??
          json['userId'] as String? ??
          json['id'] as String? ??
          '',
      email: json['email'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String? ?? 'member',
    );
  }
}

class OrganizationsRepository {
  final Dio _dio;

  OrganizationsRepository(this._dio);

  /// Fetches all organizations.
  Future<List<Organization>> getOrganizations() async {
    final response = await _dio.get('/organizations');
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
    final response = await _dio.get('/organizations/$orgId/members');
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
