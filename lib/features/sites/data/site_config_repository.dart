import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/dio_provider.dart';
import 'models.dart';

class SiteConfigRepository {
  final Dio _dio;

  SiteConfigRepository(this._dio);

  /// Fetches site details.
  Future<SiteConfig> getSiteConfig(String siteId) async {
    final response = await _dio.get('/api/sites/$siteId');
    final data = response.data;
    if (data is Map<String, dynamic>) {
      if (data.containsKey('data') && data['data'] is Map<String, dynamic>) {
        return SiteConfig.fromJson(data['data'] as Map<String, dynamic>);
      }
      return SiteConfig.fromJson(data);
    }
    throw Exception('Invalid site config response');
  }

  /// Updates site configuration.
  Future<void> updateSiteConfig(
    String siteId,
    Map<String, dynamic> config,
  ) async {
    await _dio.put(
      '/api/sites/$siteId/config',
      data: config,
    );
  }
}

final siteConfigRepositoryProvider = Provider<SiteConfigRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return SiteConfigRepository(dio);
});
