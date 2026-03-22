import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';

class _QuickLinkItem {
  final String label;
  final IconData icon;
  final String route;

  const _QuickLinkItem({
    required this.label,
    required this.icon,
    required this.route,
  });
}

class AnalyticsQuickLinks extends StatelessWidget {
  final String siteId;
  final bool isMobile;

  const AnalyticsQuickLinks({
    super.key,
    required this.siteId,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isWide = MediaQuery.of(context).size.width > 500;

    Widget sectionTitle(String title) => Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 6, top: 12),
          child: Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        );

    Widget linkCard(_QuickLinkItem item) => Card(
          child: InkWell(
            onTap: () => context.push(item.route),
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Row(
                children: [
                  Icon(item.icon, size: 18, color: theme.colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item.label,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: theme.textTheme.bodySmall?.color,
                  ),
                ],
              ),
            ),
          ),
        );

    Widget grid(List<_QuickLinkItem> items) => GridView.count(
          crossAxisCount: isWide ? 3 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 6,
          crossAxisSpacing: 6,
          childAspectRatio: isWide ? 4.0 : 3.2,
          children: items.map(linkCard).toList(),
        );

    final metricsItems = [
      _QuickLinkItem(
        label: isMobile ? l10n.screens : l10n.pages,
        icon: Icons.article_outlined,
        route: '/analytics/$siteId/metrics/pathname',
      ),
      _QuickLinkItem(
        label: l10n.pageTitles,
        icon: Icons.title,
        route: '/analytics/$siteId/metrics/page_title',
      ),
      _QuickLinkItem(
        label: isMobile ? l10n.entryScreens : l10n.entryPages,
        icon: Icons.login,
        route: '/analytics/$siteId/metrics/entry_page',
      ),
      _QuickLinkItem(
        label: isMobile ? l10n.exitScreens : l10n.exitPages,
        icon: Icons.logout,
        route: '/analytics/$siteId/metrics/exit_page',
      ),
    ];

    final webSourceItems = [
      _QuickLinkItem(
        label: l10n.referrers,
        icon: Icons.link,
        route: '/analytics/$siteId/metrics/referrer',
      ),
      _QuickLinkItem(
        label: l10n.channel,
        icon: Icons.trending_up,
        route: '/analytics/$siteId/metrics/channel',
      ),
      _QuickLinkItem(
        label: l10n.utmSource,
        icon: Icons.campaign,
        route: '/analytics/$siteId/metrics/utm_source',
      ),
      _QuickLinkItem(
        label: l10n.countries,
        icon: Icons.public,
        route: '/analytics/$siteId/metrics/country',
      ),
    ];

    final mobileSourceItems = [
      _QuickLinkItem(
        label: l10n.countries,
        icon: Icons.public,
        route: '/analytics/$siteId/metrics/country',
      ),
    ];

    final webDeviceItems = [
      _QuickLinkItem(
        label: l10n.devices,
        icon: Icons.devices,
        route: '/analytics/$siteId/metrics/device_type',
      ),
      _QuickLinkItem(
        label: l10n.browsers,
        icon: Icons.web,
        route: '/analytics/$siteId/metrics/browser',
      ),
    ];

    final mobileDeviceItems = [
      _QuickLinkItem(
        label: l10n.devices,
        icon: Icons.smartphone,
        route: '/analytics/$siteId/metrics/device_model',
      ),
      _QuickLinkItem(
        label: l10n.appVersions,
        icon: Icons.label_outlined,
        route: '/analytics/$siteId/metrics/app_version',
      ),
    ];

    final deviceSharedItems = [
      _QuickLinkItem(
        label: l10n.operatingSystems,
        icon: Icons.computer,
        route: '/analytics/$siteId/metrics/operating_system',
      ),
      _QuickLinkItem(
        label: l10n.locations,
        icon: Icons.place,
        route: '/analytics/$siteId/locations',
      ),
    ];

    final coreFeaturesItems = [
      _QuickLinkItem(
        label: l10n.liveView,
        icon: Icons.sensors,
        route: '/analytics/$siteId/live',
      ),
      _QuickLinkItem(
        label: l10n.sessions,
        icon: Icons.people_outline,
        route: '/analytics/$siteId/sessions',
      ),
      _QuickLinkItem(
        label: l10n.events,
        icon: Icons.bolt,
        route: '/analytics/$siteId/events',
      ),
      _QuickLinkItem(
        label: l10n.errors,
        icon: Icons.error_outline,
        route: '/analytics/$siteId/errors',
      ),
    ];

    final insightsItems = [
      _QuickLinkItem(
        label: l10n.retention,
        icon: Icons.group,
        route: '/analytics/$siteId/retention',
      ),
      _QuickLinkItem(
        label: l10n.journeys,
        icon: Icons.route,
        route: '/analytics/$siteId/journeys',
      ),
      _QuickLinkItem(
        label: l10n.activityHeatmap,
        icon: Icons.grid_view,
        route: '/analytics/$siteId/heatmap',
      ),
      _QuickLinkItem(
        label: l10n.eventLog,
        icon: Icons.list_alt,
        route: '/analytics/$siteId/event-log',
      ),
    ];

    final toolsItems = [
      if (!isMobile)
        _QuickLinkItem(
          label: l10n.performance,
          icon: Icons.speed,
          route: '/analytics/$siteId/performance',
        ),
      _QuickLinkItem(
        label: l10n.goals,
        icon: Icons.flag_outlined,
        route: '/analytics/$siteId/goals',
      ),
      _QuickLinkItem(
        label: l10n.funnels,
        icon: Icons.filter_alt_outlined,
        route: '/analytics/$siteId/funnels',
      ),
      _QuickLinkItem(
        label: l10n.users,
        icon: Icons.person_outline,
        route: '/analytics/$siteId/users',
      ),
    ];

    final moreItems = [
      _QuickLinkItem(
        label: l10n.userTraits,
        icon: Icons.label_outlined,
        route: '/analytics/$siteId/user-traits',
      ),
      if (!isMobile)
        _QuickLinkItem(
          label: l10n.replay,
          icon: Icons.videocam_outlined,
          route: '/analytics/$siteId/replay',
        ),
      _QuickLinkItem(
        label: l10n.config,
        icon: Icons.settings_outlined,
        route: '/analytics/$siteId/config',
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sectionTitle(l10n.metrics.toUpperCase()),
          grid(metricsItems),

          sectionTitle(l10n.sources.toUpperCase()),
          grid(isMobile ? mobileSourceItems : webSourceItems),

          sectionTitle(l10n.devices.toUpperCase()),
          grid([
            ...(isMobile ? mobileDeviceItems : webDeviceItems),
            ...deviceSharedItems,
          ]),

          sectionTitle(l10n.coreFeatures.toUpperCase()),
          grid(coreFeaturesItems),

          sectionTitle(l10n.insights.toUpperCase()),
          grid(insightsItems),

          sectionTitle(l10n.tools.toUpperCase()),
          grid(toolsItems),

          grid(moreItems),
        ],
      ),
    );
  }
}
