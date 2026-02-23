import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../data/users_repository.dart';

final _traitKeysProvider =
    FutureProvider.family.autoDispose<List<TraitKey>, String>(
  (ref, siteId) async {
    final repo = ref.watch(usersRepositoryProvider);
    return repo.getTraitKeys(siteId);
  },
);

final _traitValuesProvider = FutureProvider.family
    .autoDispose<TraitValuesResponse, ({String siteId, String key})>(
  (ref, args) async {
    final repo = ref.watch(usersRepositoryProvider);
    return repo.getTraitValues(args.siteId, args.key);
  },
);

class UserTraitsScreen extends ConsumerWidget {
  final String siteId;

  const UserTraitsScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);
    final keysAsync = ref.watch(_traitKeysProvider(siteId));

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.userTraits, style: const TextStyle(fontSize: 18)),
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
      body: keysAsync.when(
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
                Text(l10n.failedToLoadUserTraits,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () =>
                      ref.invalidate(_traitKeysProvider(siteId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (keys) {
          if (keys.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.label_off,
                      size: 48,
                      color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text(l10n.noUserTraits,
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(l10n.noUserTraitsHint,
                      style: theme.textTheme.bodySmall,
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(_traitKeysProvider(siteId)),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: keys.length,
              itemBuilder: (context, index) => _TraitKeyCard(
                siteId: siteId,
                traitKey: keys[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TraitKeyCard extends ConsumerWidget {
  final String siteId;
  final TraitKey traitKey;

  const _TraitKeyCard({required this.siteId, required this.traitKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: ExpansionTile(
          leading: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.label,
                size: 18, color: theme.colorScheme.primary),
          ),
          title: Text(
            traitKey.key,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            l10n.traitUsersCount(formatNumber(traitKey.userCount)),
            style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
          ),
          onExpansionChanged: (expanded) {
            if (expanded) {
              // Trigger loading of values
              ref.read(_traitValuesProvider(
                  (siteId: siteId, key: traitKey.key)));
            }
          },
          children: [
            _TraitValuesSection(
              siteId: siteId,
              traitKeyName: traitKey.key,
              totalUsers: traitKey.userCount,
            ),
          ],
        ),
      ),
    );
  }
}

class _TraitValuesSection extends ConsumerWidget {
  final String siteId;
  final String traitKeyName;
  final int totalUsers;

  const _TraitValuesSection({
    required this.siteId,
    required this.traitKeyName,
    required this.totalUsers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final args = (siteId: siteId, key: traitKeyName);
    final valuesAsync = ref.watch(_traitValuesProvider(args));

    return valuesAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (error, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(formatError(error), style: theme.textTheme.bodySmall),
      ),
      data: (response) {
        if (response.values.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(l10n.noData, style: theme.textTheme.bodySmall),
          );
        }

        return Column(
          children: [
            const Divider(height: 1),
            for (final val in response.values.take(20))
              _TraitValueRow(
                value: val,
                totalUsers: totalUsers,
              ),
            if (response.values.length > 20)
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '+${response.values.length - 20} more',
                  style: theme.textTheme.bodySmall,
                ),
              ),
          ],
        );
      },
    );
  }
}

class _TraitValueRow extends StatelessWidget {
  final TraitValue value;
  final int totalUsers;

  const _TraitValueRow({required this.value, required this.totalUsers});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = totalUsers > 0
        ? (value.userCount / totalUsers * 100)
        : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  value.value.isNotEmpty ? value.value : '(empty)',
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '${formatNumber(value.userCount)} (${percentage.toStringAsFixed(1)}%)',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: (percentage / 100).clamp(0, 1),
              minHeight: 4,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
            ),
          ),
        ],
      ),
    );
  }
}
