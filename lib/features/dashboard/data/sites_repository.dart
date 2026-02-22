import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/site.dart';

class SitesRepository {
  final Dio _dio;

  SitesRepository(this._dio);

  /// Fetches all organizations with their sites for the current user.
  /// GET /organizations returns a list of orgs, each containing a sites array.
  Future<List<Map<String, dynamic>>> getOrganizations() async {
    final response = await _dio.get('/organizations');
    final data = response.data;
    if (data is List) {
      return data.cast<Map<String, dynamic>>();
    }
    return [];
  }

  /// Fetches sites for a specific organization.
  /// GET /organizations/:orgId/sites returns { organization, sites, subscription }
  Future<Map<String, dynamic>> getOrgSites(String orgId) async {
    final response = await _dio.get('/organizations/$orgId/sites');
    return response.data as Map<String, dynamic>;
  }

  /// Fetches live user count for a specific site.
  /// GET /api/sites/:siteId/live-user-count returns { count }
  Future<int> getLiveUserCount(String siteId) async {
    try {
      final response = await _dio.get('/api/sites/$siteId/live-user-count');
      final data = response.data;
      if (data is Map<String, dynamic>) {
        return (data['count'] as num?)?.toInt() ?? 0;
      }
      if (data is int) return data;
      return 0;
    } catch (_) {
      return 0;
    }
  }

  /// Extracts Site objects from the organizations response.
  List<Site> parseSitesFromOrganizations(
      List<Map<String, dynamic>> organizations) {
    final sites = <Site>[];
    for (final org in organizations) {
      final orgSites = org['sites'] as List<dynamic>? ?? [];
      for (final siteJson in orgSites) {
        final siteMap = siteJson as Map<String, dynamic>;
        // The API returns 'id' as a string (siteId number), normalize it
        final siteId = siteMap['siteId'] ?? siteMap['id'];
        sites.add(Site(
          id: siteMap['id']?.toString() ?? '',
          siteId: siteId is int ? siteId : int.tryParse(siteId.toString()) ?? 0,
          name: siteMap['name']?.toString() ?? '',
          domain: siteMap['domain']?.toString() ?? '',
          createdAt: siteMap['createdAt']?.toString() ?? '',
          organizationId: siteMap['organizationId']?.toString(),
          public: siteMap['public'] == true,
        ));
      }
    }
    return sites;
  }
}

final sitesRepositoryProvider = Provider<SitesRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SitesRepository(dio);
});
