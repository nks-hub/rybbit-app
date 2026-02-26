import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../application/metrics_controller.dart';
import 'widgets/metric_list_item.dart';

enum MetricType {
  pathname('pathname', Icons.article_outlined),
  pageTitle('page_title', Icons.title),
  referrer('referrer', Icons.link),
  country('country', Icons.public),
  city('city', Icons.location_city),
  browser('browser', Icons.web),
  browserVersion('browser_version', Icons.web),
  operatingSystem('operating_system', Icons.computer),
  osVersion('os_version', Icons.computer),
  deviceType('device_type', Icons.devices),
  dimensions('dimensions', Icons.aspect_ratio),
  language('language', Icons.translate),
  entryPage('entry_page', Icons.login),
  exitPage('exit_page', Icons.logout),
  utmSource('utm_source', Icons.campaign),
  utmMedium('utm_medium', Icons.campaign),
  utmCampaign('utm_campaign', Icons.campaign),
  utmTerm('utm_term', Icons.campaign),
  utmContent('utm_content', Icons.campaign),
  channel('channel', Icons.trending_up),
  hostname('hostname', Icons.dns),
  vpn('vpn', Icons.vpn_key),
  crawler('crawler', Icons.bug_report),
  datacenter('datacenter', Icons.cloud),
  company('company', Icons.business),
  companyType('company_type', Icons.category),
  companyDomain('company_domain', Icons.domain),
  asnOrg('asn_org', Icons.hub),
  asnType('asn_type', Icons.router),
  asnDomain('asn_domain', Icons.language),
  appVersion('app_version', Icons.label_outlined),
  deviceModel('device_model', Icons.smartphone);

  const MetricType(this.parameter, this.icon);
  final String parameter;
  final IconData icon;

  bool get isMobileOnly => const {
    MetricType.appVersion,
    MetricType.deviceModel,
  }.contains(this);

  bool get isWebOnly => const {
    MetricType.referrer,
    MetricType.browser,
    MetricType.browserVersion,
    MetricType.dimensions,
    MetricType.utmSource,
    MetricType.utmMedium,
    MetricType.utmCampaign,
    MetricType.utmTerm,
    MetricType.utmContent,
    MetricType.channel,
    MetricType.hostname,
    MetricType.crawler,
  }.contains(this);

  String localizedLabel(AppLocalizations l10n, {bool isMobile = false}) {
    switch (this) {
      case MetricType.pathname:
        return isMobile ? l10n.screens : l10n.pages;
      case MetricType.pageTitle:
        return l10n.pageTitles;
      case MetricType.referrer:
        return l10n.referrers;
      case MetricType.country:
        return l10n.countries;
      case MetricType.city:
        return l10n.cities;
      case MetricType.browser:
        return l10n.browsers;
      case MetricType.browserVersion:
        return l10n.browserVersions;
      case MetricType.operatingSystem:
        return l10n.operatingSystems;
      case MetricType.osVersion:
        return l10n.osVersions;
      case MetricType.deviceType:
        return l10n.devices;
      case MetricType.dimensions:
        return l10n.screenDimensions;
      case MetricType.language:
        return l10n.languages;
      case MetricType.entryPage:
        return isMobile ? l10n.entryScreens : l10n.entryPages;
      case MetricType.exitPage:
        return isMobile ? l10n.exitScreens : l10n.exitPages;
      case MetricType.utmSource:
        return l10n.utmSource;
      case MetricType.utmMedium:
        return l10n.utmMedium;
      case MetricType.utmCampaign:
        return l10n.utmCampaign;
      case MetricType.utmTerm:
        return l10n.utmTerm;
      case MetricType.utmContent:
        return l10n.utmContent;
      case MetricType.channel:
        return l10n.channel;
      case MetricType.hostname:
        return l10n.hostnames;
      case MetricType.vpn:
        return l10n.vpn;
      case MetricType.crawler:
        return l10n.crawlers;
      case MetricType.datacenter:
        return l10n.datacenters;
      case MetricType.company:
        return l10n.companies;
      case MetricType.companyType:
        return l10n.companyType;
      case MetricType.companyDomain:
        return l10n.companyDomain;
      case MetricType.asnOrg:
        return l10n.asnOrg;
      case MetricType.asnType:
        return l10n.asnType;
      case MetricType.asnDomain:
        return l10n.asnDomain;
      case MetricType.appVersion:
        return l10n.appVersion;
      case MetricType.deviceModel:
        return l10n.deviceModel;
    }
  }

  static MetricType fromParameter(String parameter) {
    return MetricType.values.firstWhere(
      (t) => t.parameter == parameter,
      orElse: () => MetricType.pathname,
    );
  }
}

class MetricsScreen extends ConsumerStatefulWidget {
  final String siteId;
  final String metricType;

  const MetricsScreen({
    super.key,
    required this.siteId,
    required this.metricType,
  });

  @override
  ConsumerState<MetricsScreen> createState() => _MetricsScreenState();
}

enum _SortMode { count, alphabetical }

class _MetricsScreenState extends ConsumerState<MetricsScreen> {
  late MetricType _selectedType;
  final ScrollController _scrollController = ScrollController();
  _SortMode _sortMode = _SortMode.count;

  @override
  void initState() {
    super.initState();
    _selectedType = MetricType.fromParameter(widget.metricType);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      final key = MetricsKey(
        siteId: widget.siteId,
        parameter: _selectedType.parameter,
      );
      ref.read(metricsControllerProvider(key).notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final key = MetricsKey(
      siteId: widget.siteId,
      parameter: _selectedType.parameter,
    );
    final metricsAsync = ref.watch(metricsControllerProvider(key));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    final domain = ref.watch(currentSiteDomainProvider);
    final availableTypes = MetricType.values.where((t) {
      if (isMobile && t.isWebOnly) return false;
      if (!isMobile && t.isMobileOnly) return false;
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedType.localizedLabel(l10n, isMobile: isMobile),
              style: const TextStyle(fontSize: 18),
            ),
            if (domain != null)
              Text(
                domain,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.textTheme.bodySmall?.color,
                ),
              ),
          ],
        ),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            tooltip: _sortMode == _SortMode.count
                ? l10n.sortAlphabetically
                : l10n.sortByCount,
            icon: Icon(
              _sortMode == _SortMode.count
                  ? Icons.sort_by_alpha
                  : Icons.sort,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                _sortMode = _sortMode == _SortMode.count
                    ? _SortMode.alphabetical
                    : _SortMode.count;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Metric type selector
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: availableTypes.length,
              itemBuilder: (context, index) {
                final type = availableTypes[index];
                final isSelected = type == _selectedType;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: FilterChip(
                    label: Text(
                      type.localizedLabel(l10n, isMobile: isMobile),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => _selectedType = type);
                    },
                    showCheckmark: false,
                    selectedColor:
                        theme.colorScheme.primary.withValues(alpha: 0.2),
                    side: BorderSide(
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.dividerTheme.color ?? const Color(0xFF262626),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                );
              },
            ),
          ),

          const Divider(height: 1),

          // Metric list
          Expanded(
            child: metricsAsync.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, _) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: theme.colorScheme.error),
                      const SizedBox(height: 16),
                      Text(l10n.failedToLoadMetrics,
                          style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Text(formatError(error),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(metricsControllerProvider(key).notifier)
                            .refresh(),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              data: (metricsState) {
                if (metricsState.items.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _selectedType.icon,
                          size: 48,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noMetricData(_selectedType.localizedLabel(l10n, isMobile: isMobile).toLowerCase()),
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref
                      .read(metricsControllerProvider(key).notifier)
                      .refresh(),
                  child: _buildMetricList(metricsState, theme, l10n),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricList(MetricsState metricsState, ThemeData theme, AppLocalizations l10n) {
    final items = _sortMode == _SortMode.alphabetical
        ? (List.of(metricsState.items)
          ..sort((a, b) => a.value.toLowerCase().compareTo(b.value.toLowerCase())))
        : metricsState.items;

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount:
          items.length + (metricsState.isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
        color: theme.dividerTheme.color?.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        if (index >= items.length) {
          return Semantics(
            label: l10n.loadingMoreMetrics,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
          );
        }

        final item = items[index];
        return MetricListItem(
          value: item.value,
          count: item.count,
          percentage: item.percentage,
          bounceRate: item.bounceRate,
          timeOnPageSeconds: item.timeOnPageSeconds,
        );
      },
    );
  }
}
