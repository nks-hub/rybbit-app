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
                  icon: Icon(Icons.home_outlined, size: 20, semanticLabel: l10n.dashboard),
                  selectedIcon: Icon(Icons.home, size: 20, semanticLabel: l10n.dashboard),
                  label: Text(l10n.dashboard, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bar_chart_outlined, size: 20, semanticLabel: l10n.analytics),
                  selectedIcon: Icon(Icons.bar_chart, size: 20, semanticLabel: l10n.analytics),
                  label: Text(l10n.analytics, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.people_outlined, size: 20, semanticLabel: l10n.sessions),
                  selectedIcon: Icon(Icons.people, size: 20, semanticLabel: l10n.sessions),
                  label: Text(l10n.sessions, style: const TextStyle(fontSize: 11)),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.settings_outlined, size: 20, semanticLabel: l10n.settings),
                  selectedIcon: Icon(Icons.settings, size: 20, semanticLabel: l10n.settings),
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

    return PopScope(
      canPop: widget.navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          widget.navigationShell.goBranch(0);
        }
      },
      child: Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: _onDestinationSelected,
        backgroundColor: theme.scaffoldBackgroundColor,
        indicatorColor: theme.colorScheme.primary.withValues(alpha: 0.15),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, semanticLabel: l10n.dashboard),
            selectedIcon: Icon(Icons.home, semanticLabel: l10n.dashboard),
            label: l10n.dashboard,
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined, semanticLabel: l10n.analytics),
            selectedIcon: Icon(Icons.bar_chart, semanticLabel: l10n.analytics),
            label: l10n.analytics,
          ),
          NavigationDestination(
            icon: Icon(Icons.people_outlined, semanticLabel: l10n.sessions),
            selectedIcon: Icon(Icons.people, semanticLabel: l10n.sessions),
            label: l10n.sessions,
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined, semanticLabel: l10n.settings),
            selectedIcon: Icon(Icons.settings, semanticLabel: l10n.settings),
            label: l10n.settings,
          ),
        ],
      ),
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
