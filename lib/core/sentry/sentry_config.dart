import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Sentry DSN injected at build time via --dart-define=SENTRY_DSN=...
/// If not provided, Sentry is disabled (no-op).
const _sentryDsn = String.fromEnvironment('SENTRY_DSN');

class SentryConfig {
  static Future<void> init(FutureOr<void> Function() appRunner) async {
    if (_sentryDsn.isEmpty) {
      // No DSN configured - run app without Sentry
      appRunner();
      return;
    }

    final packageInfo = await PackageInfo.fromPlatform();
    final version = '${packageInfo.version}+${packageInfo.buildNumber}';

    await SentryFlutter.init(
      (options) {
        options.dsn = _sentryDsn;
        options.tracesSampleRate = kDebugMode ? 1.0 : 0.2;
        options.release = version;
        options.environment = kDebugMode ? 'debug' : 'production';
        options.attachScreenshot = true;
        options.attachViewHierarchy = true;
        options.sendDefaultPii = false;
      },
      appRunner: appRunner,
    );
  }
}
