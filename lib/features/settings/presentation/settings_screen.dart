import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app.dart';
import '../../../core/config/app_config.dart';
import '../../../core/storage/storage_service.dart';
import '../../../l10n/app_localizations.dart';
import '../../auth/application/auth_controller.dart';

/// Theme mode provider persisted to Hive.
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final saved = StorageService.readSetting('theme_mode', defaultValue: 'dark');
  return switch (saved) {
    'light' => ThemeMode.light,
    'system' => ThemeMode.system,
    _ => ThemeMode.dark,
  };
});

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final config = ref.watch(appConfigNotifierProvider);
    final authState = ref.watch(authControllerProvider);
    final themeMode = ref.watch(themeModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings, style: const TextStyle(fontSize: 18)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          // Server section
          _SectionHeader(title: l10n.connection),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.dns_outlined),
                  title: Text(l10n.serverUrl),
                  subtitle: Text(
                    config.serverUrl.isNotEmpty
                        ? config.serverUrl
                        : l10n.notConfigured,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.vpn_key_outlined),
                  title: Text(l10n.authMethod),
                  subtitle: Text(
                    config.hasApiKey ? l10n.apiKey : l10n.sessionCookie,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                if (authState.user != null) ...[
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.person_outline),
                    title: Text(l10n.loggedInAs),
                    subtitle: Text(
                      authState.user?['email'] as String? ??
                          authState.user?['name'] as String? ??
                          l10n.unknown,
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Appearance section
          _SectionHeader(title: l10n.appearance),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.dark_mode_outlined, size: 24),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Text(l10n.theme, style: theme.textTheme.bodyLarge),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: SegmentedButton<ThemeMode>(
                          expandedInsets: EdgeInsets.zero,
                          segments: [
                            ButtonSegment(
                              value: ThemeMode.dark,
                              label: Text(l10n.dark),
                            ),
                            ButtonSegment(
                              value: ThemeMode.light,
                              label: Text(l10n.light),
                            ),
                            ButtonSegment(
                              value: ThemeMode.system,
                              label: Text(l10n.auto),
                            ),
                          ],
                          selected: {themeMode},
                          onSelectionChanged: (selected) {
                            final mode = selected.first;
                            ref.read(themeModeProvider.notifier).state = mode;
                            final modeStr = switch (mode) {
                              ThemeMode.light => 'light',
                              ThemeMode.system => 'system',
                              _ => 'dark',
                            };
                            StorageService.saveSetting('theme_mode', modeStr);
                          },
                          style: const ButtonStyle(
                            visualDensity: VisualDensity.compact,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(l10n.language),
                  subtitle: Text(
                    _currentLanguageName(ref),
                    style: theme.textTheme.bodySmall,
                  ),
                  onTap: () => _showLanguagePicker(context, ref),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // About section
          _SectionHeader(title: l10n.about),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l10n.appVersion),
                  subtitle: const Text('0.1.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.code),
                  title: Text(l10n.appName),
                  subtitle: Text(
                    l10n.openSourceAnalytics,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Logout
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton.icon(
              onPressed: () => _confirmLogout(context, ref),
              icon: Icon(Icons.logout, color: theme.colorScheme.error),
              label: Text(
                l10n.logout,
                style: TextStyle(color: theme.colorScheme.error),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: theme.colorScheme.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  String _currentLanguageName(WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    if (locale == null) return 'Auto';
    return localeDisplayNames[locale.languageCode] ?? locale.languageCode;
  }

  Future<void> _showLanguagePicker(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.read(localeProvider);

    final selected = await showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        final theme = Theme.of(ctx);
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (ctx, scrollController) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      l10n.selectLanguage,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView(
                      controller: scrollController,
                      children: [
                        ListTile(
                          title: Text(l10n.auto),
                          leading: Icon(
                            currentLocale == null
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            color: currentLocale == null
                                ? theme.colorScheme.primary
                                : theme.textTheme.bodySmall?.color,
                          ),
                          selected: currentLocale == null,
                          selectedColor: theme.colorScheme.primary,
                          onTap: () => Navigator.pop(ctx, '__auto__'),
                        ),
                        ...supportedLocaleCodes.map((code) {
                          final isSelected =
                              currentLocale?.languageCode == code;
                          return ListTile(
                            title: Text(localeDisplayNames[code] ?? code),
                            leading: Icon(
                              isSelected
                                  ? Icons.radio_button_checked
                                  : Icons.radio_button_off,
                              color: isSelected
                                  ? theme.colorScheme.primary
                                  : theme.textTheme.bodySmall?.color,
                            ),
                            selected: isSelected,
                            selectedColor: theme.colorScheme.primary,
                            onTap: () => Navigator.pop(ctx, code),
                          );
                        }),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );

    if (selected == null) return;

    if (selected == '__auto__') {
      ref.read(localeProvider.notifier).state = null;
      StorageService.deleteSetting('locale');
    } else {
      ref.read(localeProvider.notifier).state = Locale(selected);
      StorageService.saveSetting('locale', selected);
    }
  }

  Future<void> _confirmLogout(BuildContext context, WidgetRef ref) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.logout),
        content: Text(l10n.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.logout,
                style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      ref.read(authControllerProvider.notifier).logout();
    }
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 0.5,
            ),
      ),
    );
  }
}
