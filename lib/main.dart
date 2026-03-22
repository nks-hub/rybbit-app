import 'dart:async';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/network/dio_provider.dart';
import 'core/sentry/sentry_config.dart';
import 'core/storage/storage_service.dart';
import 'features/auth/application/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storageService = StorageServiceImpl();

  // Parallelize independent init tasks
  final (_, appDir) = await (
    storageService.init(),
    getApplicationDocumentsDirectory(),
  ).wait;

  final persistCookieJar =
      PersistCookieJar(storage: FileStorage('${appDir.path}/.cookies/'));

  final container = ProviderContainer(
    overrides: [
      storageServiceProvider.overrideWithValue(storageService),
      cookieJarProvider.overrideWithValue(persistCookieJar),
    ],
  );

  await SentryConfig.init(() {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const RybbitApp(),
      ),
    );
  });

  // Check session after first frame - AuthStatus.unknown shows loading state
  // and the router redirect holds until status is resolved.
  unawaited(container.read(authControllerProvider.notifier).checkSession());
}
