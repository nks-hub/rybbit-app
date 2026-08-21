import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rybbit_flutter_sdk/rybbit_flutter_sdk.dart';

import '../storage/storage_service.dart';

/// Rybbit instance this app reports its own usage to. Unrelated to the server
/// the user connects to — that one belongs to them and never receives our
/// telemetry.
const _analyticsHost = 'https://tel.nks-hub.cz';
const _analyticsSiteId = '3e8bc21a64e9';

/// SharedPreferences key backing [analyticsEnabledProvider].
const analyticsEnabledKey = 'analytics_enabled';

/// Usage reporting is on unless the user turns it off in Settings.
class AnalyticsEnabledNotifier extends Notifier<bool> {
  @override
  bool build() =>
      ref.read(storageServiceProvider).readSetting(analyticsEnabledKey,
          defaultValue: true) as bool;

  Future<void> set(bool enabled) async {
    if (enabled == state) return;
    state = enabled;
    await ref
        .read(storageServiceProvider)
        .saveSetting(analyticsEnabledKey, enabled);
    if (enabled) {
      await initAnalytics();
    } else {
      // Drops the queued events and the stored anonymous id, so turning
      // tracking back on later starts a new, unlinkable identity.
      await Rybbit.reset();
    }
  }
}

final analyticsEnabledProvider =
    NotifierProvider<AnalyticsEnabledNotifier, bool>(
        AnalyticsEnabledNotifier.new);

/// Starts usage reporting. Touches the network, so callers should not await it
/// on the startup path — every [AppAnalytics] call is a no-op until it lands.
Future<void> initAnalytics() async {
  try {
    await Rybbit.init(
      host: _analyticsHost,
      siteId: _analyticsSiteId,
      autoTrackLifecycle: true,
      debug: kDebugMode,
    );
  } catch (e) {
    // Analytics must never be the reason the app fails to start.
    debugPrint('Rybbit analytics not available: $e');
  }
}

/// Usage events sent to our own Rybbit instance.
///
/// Deliberately anonymous: this app is a client for servers we do not own, so
/// nothing identifying the user or their instance — no account id, e-mail,
/// server URL, site domain or site id — is ever sent. `identify()` is
/// therefore not used at all, unlike in our first-party apps.
class AppAnalytics {
  const AppAnalytics._();

  static void _send(String name, [Map<String, dynamic>? properties]) {
    if (!Rybbit.isInitialized) return;
    Rybbit.instance.event(name, properties: properties ?? const {});
  }

  /// [connection] is `cloud` or `self_hosted`; [method] is `password` or
  /// `api_key`. Which flavour of Rybbit people connect to is the one thing
  /// worth counting here — the address they connect to is not.
  static void loginSucceeded({
    required String connection,
    required String method,
  }) =>
      _send('login', {'connection': connection, 'method': method});

  static void loginFailed(String reason) => _send('login_failed', {
        'reason': reason,
      });

  static void logout() => _send('logout');

  /// Counts which analytics screens actually get used, so dead ones can go.
  static void featureOpened(String feature) =>
      _send('feature_opened', {'feature': feature});
}
