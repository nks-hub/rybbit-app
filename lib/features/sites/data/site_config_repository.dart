import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import '../../../core/network/dio_provider.dart';
import '../../../shared/models/site.dart';

class SiteConfig {
  final Site site;
  final List<String> excludedIps;
  final List<String> excludedCountries;

  const SiteConfig({
    required this.site,
    this.excludedIps = const [],
    this.excludedCountries = const [],
  });

  factory SiteConfig.fromJson(Map<String, dynamic> json) {
    final siteJson = json['site'] as Map<String, dynamic>? ?? json;

    return SiteConfig(
      site: Site.fromJson(siteJson),
      excludedIps: (json['excludedIps'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          (json['excluded_ips'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      excludedCountries: (json['excludedCountries'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          (json['excluded_countries'] as List?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}

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
