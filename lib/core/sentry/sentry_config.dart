import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

const _dsn =
    'SENTRY_DSN_REMOVED';

class SentryConfig {
  static Future<void> init(FutureOr<void> Function() appRunner) async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = '${packageInfo.version}+${packageInfo.buildNumber}';

    await SentryFlutter.init(
      (options) {
        options.dsn = _dsn;
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
