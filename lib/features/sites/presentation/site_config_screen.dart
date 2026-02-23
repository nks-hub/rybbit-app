import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    final configAsync = ref.watch(_siteConfigProvider(widget.siteId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Site Settings', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: 'Go back',
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
                  : const Text('Save'),
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
                Text('Failed to load site config',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_siteConfigProvider(widget.siteId)),
                  child: const Text('Retry'),
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
                        Text('Site Information',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(height: 12),
                        _InfoRow(label: 'Name', value: site.name),
                        _InfoRow(label: 'Domain', value: site.domain),
                        _InfoRow(
                            label: 'Site ID',
                            value: site.siteId.toString()),
                        _InfoRow(label: 'Created', value: site.createdAt),
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
                        child: Text('Tracking Settings',
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SwitchListTile(
                        title: const Text('Public Dashboard'),
                        subtitle:
                            const Text('Allow public access to analytics'),
                        value: isPublic,
                        onChanged: (v) => setState(() => _public = v),
                      ),
                      const Divider(height: 1),
                      SwitchListTile(
                        title: const Text('Session Replay'),
                        subtitle: const Text('Record user sessions'),
                        value: replay,
                        onChanged: (v) =>
                            setState(() => _sessionReplay = v),
                      ),
                      const Divider(height: 1),
                      SwitchListTile(
                        title: const Text('Web Vitals'),
                        subtitle: const Text('Track Core Web Vitals'),
                        value: vitals,
                        onChanged: (v) => setState(() => _webVitals = v),
                      ),
                      const Divider(height: 1),
                      SwitchListTile(
                        title: const Text('Track Errors'),
                        subtitle:
                            const Text('Capture JavaScript errors'),
                        value: errors,
                        onChanged: (v) =>
                            setState(() => _trackErrors = v),
                      ),
                      const Divider(height: 1),
                      SwitchListTile(
                        title: const Text('Outbound Links'),
                        subtitle:
                            const Text('Track outbound link clicks'),
                        value: outbound,
                        onChanged: (v) =>
                            setState(() => _trackOutbound = v),
                      ),
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
                          Text('Excluded IPs',
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
                          Text('Excluded Countries',
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
            const SnackBar(content: Text('Settings saved')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save: $e')),
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
