import 'package:riverpod/riverpod.dart';
import '../storage/storage_service.dart';

const _siteIdKey = 'current_site_id';
const _siteDomainKey = 'current_site_domain';
const _siteTypeKey = 'current_site_type';

class CurrentSiteIdNotifier extends Notifier<String?> {
  @override
  String? build() {
    return StorageService.readSetting(_siteIdKey) as String?;
  }

  void set(String? siteId) {
    state = siteId;
    if (siteId != null) {
      StorageService.saveSetting(_siteIdKey, siteId);
    } else {
      StorageService.deleteSetting(_siteIdKey);
    }
  }
}

class CurrentSiteDomainNotifier extends Notifier<String?> {
  @override
  String? build() {
    return StorageService.readSetting(_siteDomainKey) as String?;
  }

  void set(String? domain) {
    state = domain;
    if (domain != null) {
      StorageService.saveSetting(_siteDomainKey, domain);
    } else {
      StorageService.deleteSetting(_siteDomainKey);
    }
  }
}

class CurrentSiteTypeNotifier extends Notifier<String> {
  @override
  String build() {
    return StorageService.readSetting(_siteTypeKey) as String? ?? 'web';
  }

  void set(String type) {
    state = type;
    StorageService.saveSetting(_siteTypeKey, type);
  }
}

/// Holds the currently selected site ID.
/// Persisted to local storage so it survives app restarts.
final currentSiteIdProvider =
    NotifierProvider<CurrentSiteIdNotifier, String?>(
        CurrentSiteIdNotifier.new);

/// Holds the currently selected site domain name for display purposes.
/// Persisted to local storage so it survives app restarts.
final currentSiteDomainProvider =
    NotifierProvider<CurrentSiteDomainNotifier, String?>(
        CurrentSiteDomainNotifier.new);

/// Holds the currently selected site type ('web', 'mobile', 'desktop').
/// Persisted to local storage so it survives app restarts.
final currentSiteTypeProvider =
    NotifierProvider<CurrentSiteTypeNotifier, String>(
        CurrentSiteTypeNotifier.new);

/// Whether the current site is a mobile or desktop app (not web).
final currentSiteIsMobileProvider = Provider<bool>((ref) {
  final siteType = ref.watch(currentSiteTypeProvider);
  return siteType == 'mobile' || siteType == 'desktop';
});
