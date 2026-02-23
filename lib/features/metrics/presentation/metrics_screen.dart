import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../application/metrics_controller.dart';
import 'widgets/metric_list_item.dart';

enum MetricType {
  pathname('Pages', 'pathname', Icons.article_outlined),
  referrer('Referrers', 'referrer', Icons.link),
  country('Countries', 'country', Icons.public),
  city('Cities', 'city', Icons.location_city),
  browser('Browsers', 'browser', Icons.web),
  operatingSystem('OS', 'operating_system', Icons.computer),
  deviceType('Devices', 'device_type', Icons.devices),
  language('Languages', 'language', Icons.translate),
  entryPage('Entry Pages', 'entry_page', Icons.login),
  exitPage('Exit Pages', 'exit_page', Icons.logout),
  utmSource('UTM Source', 'utm_source', Icons.campaign),
  hostname('Hostnames', 'hostname', Icons.dns),
  vpn('VPN', 'vpn', Icons.vpn_key),
  crawler('Crawlers', 'crawler', Icons.bug_report),
  datacenter('Datacenters', 'datacenter', Icons.cloud),
  company('Companies', 'company', Icons.business),
  companyType('Company Type', 'company_type', Icons.category),
  companyDomain('Company Domain', 'company_domain', Icons.domain),
  asnOrg('ASN Org', 'asn_org', Icons.hub),
  asnType('ASN Type', 'asn_type', Icons.router),
  asnDomain('ASN Domain', 'asn_domain', Icons.language);

  const MetricType(this.label, this.parameter, this.icon);
  final String label;
  final String parameter;
  final IconData icon;

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

class _MetricsScreenState extends ConsumerState<MetricsScreen> {
  late MetricType _selectedType;
  final ScrollController _scrollController = ScrollController();

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

    final domain = ref.watch(currentSiteDomainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedType.label,
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
      ),
      body: Column(
        children: [
          // Metric type selector
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: MetricType.values.length,
              itemBuilder: (context, index) {
                final type = MetricType.values[index];
                final isSelected = type == _selectedType;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                  child: FilterChip(
                    label: Text(
                      type.label,
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
                          l10n.noMetricData(_selectedType.label.toLowerCase()),
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
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount:
          metricsState.items.length + (metricsState.isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) => Divider(
        height: 1,
        indent: 16,
        endIndent: 16,
        color: theme.dividerTheme.color?.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        if (index >= metricsState.items.length) {
          return Semantics(
            label: l10n.loadingMoreMetrics,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
          );
        }

        final item = metricsState.items[index];
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
