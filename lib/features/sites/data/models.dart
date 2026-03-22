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
