import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../data/site_config_repository.dart';

/// Provider for site config.
final _siteConfigProvider =
    FutureProvider.family<SiteConfig, String>((ref, siteId) async {
  final repo = ref.read(siteConfigRepositoryProvider);
  return repo.getSiteConfig(siteId);
});

class SiteConfigScreen extends ConsumerStatefulWidget {
  final String siteId;

  const SiteConfigScreen({super.key, required this.siteId});

  @override
  ConsumerState<SiteConfigScreen> createState() => _SiteConfigScreenState();
}

class _SiteConfigScreenState extends ConsumerState<SiteConfigScreen> {
  bool _saving = false;

  // Editable toggle states
  bool? _public;
  bool? _sessionReplay;
  bool? _webVitals;
  bool? _trackErrors;
  bool? _trackOutbound;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final configAsync = ref.watch(_siteConfigProvider(widget.siteId));
    final theme = Theme.of(context);
    final isMobile = ref.watch(currentSiteIsMobileProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.siteSettings, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          if (configAsync.hasValue)
            TextButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.save),
            ),
        ],
      ),
      body: configAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: theme.colorScheme.error),
                const SizedBox(height: 16),
                Text(l10n.failedToLoadSiteConfig,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_siteConfigProvider(widget.siteId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (config) {
          final site = config.site;
          final isPublic = _public ?? site.public;
          final replay = _sessionReplay ?? site.sessionReplay;
          final vitals = _webVitals ?? site.webVitals;
          final errors = _trackErrors ?? site.trackErrors;
          final outbound = _trackOutbound ?? site.trackOutbound;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Site info card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(l10n.siteInformation,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 12),
                        _InfoRow(label: l10n.name, value: site.name),
                        _InfoRow(label: l10n.domain, value: site.domain),
                        _InfoRow(
                            label: l10n.siteId,
                            value: site.siteId.toString()),
                        _InfoRow(label: l10n.created, value: site.createdAt),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Tracking toggles
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(l10n.trackingSettings,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SwitchListTile(
                        title: Text(l10n.publicDashboard),
                        subtitle: Text(l10n.publicDashboardDesc),
                        value: isPublic,
                        onChanged: (v) => setState(() => _public = v),
                      ),
                      if (!isMobile) ...[
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(l10n.sessionReplay),
                          subtitle: Text(l10n.sessionReplayDesc),
                          value: replay,
                          onChanged: (v) =>
                              setState(() => _sessionReplay = v),
                        ),
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(l10n.webVitals),
                          subtitle: Text(l10n.webVitalsDesc),
                          value: vitals,
                          onChanged: (v) => setState(() => _webVitals = v),
                        ),
                      ],
                      const Divider(height: 1),
                      SwitchListTile(
                        title: Text(l10n.trackErrors),
                        subtitle: Text(l10n.trackErrorsDesc),
                        value: errors,
                        onChanged: (v) =>
                            setState(() => _trackErrors = v),
                      ),
                      if (!isMobile) ...[
                        const Divider(height: 1),
                        SwitchListTile(
                          title: Text(l10n.outboundLinksTracking),
                          subtitle: Text(l10n.outboundLinksDesc),
                          value: outbound,
                          onChanged: (v) =>
                              setState(() => _trackOutbound = v),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Excluded IPs
                if (config.excludedIps.isNotEmpty) ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.excludedIps,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: config.excludedIps
                                .map((ip) => Chip(
                                      label: Text(ip,
                                          style: const TextStyle(
                                              fontSize: 12)),
                                      visualDensity: VisualDensity.compact,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Excluded Countries
                if (config.excludedCountries.isNotEmpty)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(l10n.excludedCountries,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: config.excludedCountries
                                .map((c) => Chip(
                                      label: Text(c,
                                          style: const TextStyle(
                                              fontSize: 12)),
                                      visualDensity: VisualDensity.compact,
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> _save() async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _saving = true);

    try {
      final repo = ref.read(siteConfigRepositoryProvider);
      final config = <String, dynamic>{};

      if (_public != null) config['public'] = _public;
      if (_sessionReplay != null) config['sessionReplay'] = _sessionReplay;
      if (_webVitals != null) config['webVitals'] = _webVitals;
      if (_trackErrors != null) config['trackErrors'] = _trackErrors;
      if (_trackOutbound != null) config['trackOutbound'] = _trackOutbound;

      if (config.isNotEmpty) {
        await repo.updateSiteConfig(widget.siteId, config);
        ref.invalidate(_siteConfigProvider(widget.siteId));

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.settingsSaved)),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.failedToSave(e.toString()))),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
