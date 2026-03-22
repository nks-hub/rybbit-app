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
  await StorageService.init();

  // Initialize persistent cookie jar
  final appDir = await getApplicationDocumentsDirectory();
  final persistCookieJar =
      PersistCookieJar(storage: FileStorage('${appDir.path}/.cookies/'));

  final container = ProviderContainer(
    overrides: [
      cookieJarProvider.overrideWithValue(persistCookieJar),
    ],
  );
  await container.read(authControllerProvider.notifier).checkSession();

  await SentryConfig.init(() {
    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const RybbitApp(),
      ),
    );
  });
}
