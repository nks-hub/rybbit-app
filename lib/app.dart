import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/storage/storage_service.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/presentation/settings_screen.dart';
import 'l10n/app_localizations.dart';

/// Supported locale codes matching the backend.
const supportedLocaleCodes = [
  'en', 'de', 'fr', 'zh', 'es', 'pl', 'it', 'ko', 'pt', 'ja', 'cs',
];

/// Maps locale code to display name.
const localeDisplayNames = {
  'en': 'English',
  'de': 'Deutsch',
  'fr': 'Français',
  'zh': '中文',
  'es': 'Español',
  'pl': 'Polski',
  'it': 'Italiano',
  'ko': '한국어',
  'pt': 'Português',
  'ja': '日本語',
  'cs': 'Čeština',
};

/// Locale provider persisted to SharedPreferences. Defaults to system locale.
final localeProvider = StateProvider<Locale?>((ref) {
  final saved = ref.read(storageServiceProvider).readSetting('locale') as String?;
  if (saved != null && supportedLocaleCodes.contains(saved)) {
    return Locale(saved);
  }
  return null; // null = follow system
});

class RybbitApp extends ConsumerWidget {
  const RybbitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeModeProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Rybbit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (locale != null) return locale;
        if (deviceLocale != null) {
          for (final supported in supportedLocales) {
            if (supported.languageCode == deviceLocale.languageCode) {
              return supported;
            }
          }
        }
        return const Locale('en');
      },
    );
  }
}
