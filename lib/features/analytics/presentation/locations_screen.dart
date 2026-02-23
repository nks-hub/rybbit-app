import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/session_location.dart';
import '../../../shared/utils/formatters.dart';
import '../../sessions/presentation/sessions_list_screen.dart';
import '../application/time_range_controller.dart';
import '../application/filter_controller.dart';
import '../data/analytics_repository.dart';

final _locationsProvider = FutureProvider.family
    .autoDispose<List<SessionLocation>, String>(
  (ref, siteId) async {
    final repo = ref.watch(analyticsRepositoryProvider);
    final timeRange = ref.watch(timeRangeControllerProvider);
    ref.watch(filterControllerProvider);
    final filterCtrl = ref.read(filterControllerProvider.notifier);
    final params = <String, String>{
      ...timeRange.toQueryParams(),
      ...filterCtrl.toQueryParams(),
    };
    return repo.getSessionLocations(siteId, params);
  },
);

class LocationsScreen extends ConsumerWidget {
  final String siteId;

  const LocationsScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);
    final locationsAsync = ref.watch(_locationsProvider(siteId));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.locations, style: const TextStyle(fontSize: 18)),
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
      body: locationsAsync.when(
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
                Text(l10n.failedToLoadLocations,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_locationsProvider(siteId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (locations) {
          if (locations.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_off,
                      size: 48,
                      color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text(l10n.noLocationsFound,
                      style: theme.textTheme.bodyLarge),
                ],
              ),
            );
          }

          // Group by country
          final byCountry = <String, List<SessionLocation>>{};
          for (final loc in locations) {
            final key = loc.country.isNotEmpty ? loc.country : l10n.unknown;
            byCountry.putIfAbsent(key, () => []).add(loc);
          }
          // Sort countries by total sessions
          final sortedCountries = byCountry.entries.toList()
            ..sort((a, b) {
              final aTotal = a.value.fold<int>(0, (s, l) => s + l.count);
              final bTotal = b.value.fold<int>(0, (s, l) => s + l.count);
              return bTotal.compareTo(aTotal);
            });

          final totalSessions =
              locations.fold<int>(0, (s, l) => s + l.count);

          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(_locationsProvider(siteId)),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              children: [
                // Summary card
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _SummaryItem(
                          label: l10n.countries,
                          value: '${sortedCountries.length}',
                          icon: Icons.public,
                        ),
                        _SummaryItem(
                          label: l10n.locationCities,
                          value: '${locations.length}',
                          icon: Icons.location_city,
                        ),
                        _SummaryItem(
                          label: l10n.sessions,
                          value: formatNumber(totalSessions),
                          icon: Icons.people,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Country groups
                for (final entry in sortedCountries) ...[
                  _CountrySection(
                    country: entry.key,
                    locations: entry.value,
                    totalSessions: totalSessions,
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _SummaryItem({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Icon(icon, size: 20, color: theme.textTheme.bodySmall?.color),
        const SizedBox(height: 4),
        Text(
          value,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label, style: theme.textTheme.bodySmall?.copyWith(fontSize: 11)),
      ],
    );
  }
}

class _CountrySection extends StatelessWidget {
  final String country;
  final List<SessionLocation> locations;
  final int totalSessions;

  const _CountrySection({
    required this.country,
    required this.locations,
    required this.totalSessions,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final flag = countryToFlag(country);
    final countrySessions =
        locations.fold<int>(0, (s, l) => s + l.count);
    final percentage = totalSessions > 0
        ? (countrySessions / totalSessions * 100)
        : 0.0;

    // Sort cities by count
    final sortedCities = List.of(locations)
      ..sort((a, b) => b.count.compareTo(a.count));

    final l10n = AppLocalizations.of(context)!;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        leading: Text(flag, style: const TextStyle(fontSize: 24)),
        title: Text(
          country,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          l10n.sessionsWithPercentage(
            formatNumber(countrySessions),
            percentage.toStringAsFixed(1),
          ),
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
        ),
        children: [
          for (final loc in sortedCities.take(20))
            ListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              leading: Icon(Icons.location_on,
                  size: 16, color: theme.textTheme.bodySmall?.color),
              title: Text(
                loc.city.isNotEmpty ? loc.city : l10n.unknown,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
              ),
              trailing: Text(
                formatNumber(loc.count),
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          if (sortedCities.length > 20)
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                l10n.nMoreItems(sortedCities.length - 20),
                style: theme.textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
