import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'core/sentry/sentry_config.dart';
import 'core/storage/storage_service.dart';
import 'features/auth/application/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  final container = ProviderContainer();
  container.read(authControllerProvider.notifier).checkSession();

  await SentryConfig.init(() {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const RybbitApp(),
      ),
    );
  });

  // Capture Flutter errors
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (!kDebugMode) {
      Sentry.captureException(
        details.exception,
        stackTrace: details.stack,
      );
    }
  };
}
