import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/storage/storage_service.dart';
import 'features/auth/application/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();

  final container = ProviderContainer();
  container.read(authControllerProvider.notifier).checkSession();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const RybbitApp(),
    ),
  );
}
