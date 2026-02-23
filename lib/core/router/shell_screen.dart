import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/app_localizations.dart';
import '../state/current_site_provider.dart';

/// Shell widget that wraps main routes with a BottomNavigationBar.
/// Maintains state per tab so switching tabs does not rebuild content.
class ShellScreen extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ShellScreen({super.key, required this.navigationShell});

  @override
  ConsumerState<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends ConsumerState<ShellScreen> {
  void _onDestinationSelected(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(currentSiteIdProvider);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    if (isLandscape) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: widget.navigationShell.currentIndex,
              onDestinationSelected: _onDestinationSelected,
              backgroundColor: theme.scaffoldBackgroundColor,
              indicatorColor:
                  theme.colorScheme.primary.withValues(alpha: 0.15),
              labelType: NavigationRailLabelType.all,
              destinations: [
                NavigationRailDestination(
                  icon: const Icon(Icons.home_outlined, size: 20),
                  selectedIcon: const Icon(Icons.home, size: 20),
                  label: Text(l10n.dashboard, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.bar_chart_outlined, size: 20),
                  selectedIcon: const Icon(Icons.bar_chart, size: 20),
                  label: Text(l10n.analytics, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.people_outlined, size: 20),
                  selectedIcon: const Icon(Icons.people, size: 20),
                  label: Text(l10n.sessions, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.settings_outlined, size: 20),
                  selectedIcon: const Icon(Icons.settings, size: 20),
                  label: Text(l10n.settings, style: const TextStyle(fontSize: 11)),
                ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(child: widget.navigationShell),
          ],
        ),
      );
    }

    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
        backgroundColor: theme.scaffoldBackgroundColor,
        indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.15),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined, semanticLabel: ''),
            selectedIcon: const Icon(Icons.home, semanticLabel: ''),
            label: l10n.dashboard,
          ),
          NavigationDestination(
            icon: const Icon(Icons.bar_chart_outlined, semanticLabel: ''),
            selectedIcon: const Icon(Icons.bar_chart, semanticLabel: ''),
            label: l10n.analytics,
          ),
          NavigationDestination(
            icon: const Icon(Icons.people_outlined, semanticLabel: ''),
            selectedIcon: const Icon(Icons.people, semanticLabel: ''),
            label: l10n.sessions,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined, semanticLabel: ''),
            selectedIcon: const Icon(Icons.settings, semanticLabel: ''),
            label: l10n.settings,
          ),
        ],
      ),
    );
  }
}

/// Placeholder screen shown when no site is selected for Analytics/Sessions tabs.
class SiteSelectorPlaceholder extends StatelessWidget {
  final String tabName;

  const SiteSelectorPlaceholder({super.key, required this.tabName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(tabName, style: const TextStyle(fontSize: 18)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.language,
                size: 64,
                color: theme.textTheme.bodySmall?.color,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.noSiteSelected,
                style: theme.textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.selectSiteFromDashboard(tabName),
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: Text(l10n.goToDashboard),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
