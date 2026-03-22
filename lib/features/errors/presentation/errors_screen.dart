import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/state/filter_controller.dart';
import '../../../core/state/time_range_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/utils/formatters.dart';
import '../../../shared/widgets/error_view.dart';
import '../data/errors_repository.dart';

/// Provider for error names list.
final _errorNamesProvider = FutureProvider.family<List<ErrorNameItem>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  ref.watch(filterControllerProvider);

  final repo = ref.read(errorsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getErrorNames(siteId, params);
});

class ErrorsScreen extends ConsumerStatefulWidget {
  final String siteId;

  const ErrorsScreen({super.key, required this.siteId});

  @override
  ConsumerState<ErrorsScreen> createState() => _ErrorsScreenState();
}

class _ErrorsScreenState extends ConsumerState<ErrorsScreen> {
  String? _expandedErrorMessage;

  @override
  Widget build(BuildContext context) {
    final errorNamesAsync = ref.watch(_errorNamesProvider(widget.siteId));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final domain = ref.watch(currentSiteDomainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.errors, style: const TextStyle(fontSize: 18)),
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
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(_errorNamesProvider(widget.siteId));
          setState(() => _expandedErrorMessage = null);
        },
        child: errorNamesAsync.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, _) => ErrorView(
            message: l10n.failedToLoadErrors,
            detail: formatError(error),
            onRetry: () => ref.invalidate(_errorNamesProvider(widget.siteId)),
          ),
          data: (errors) {
            if (errors.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        size: 48, color: AppColors.success),
                    const SizedBox(height: 16),
                    Text(l10n.noErrorsFound, style: theme.textTheme.bodyLarge),
                    const SizedBox(height: 8),
                    Text(l10n.everythingLooksGood,
                        style: theme.textTheme.bodySmall),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: errors.length,
              itemBuilder: (context, index) {
                final error = errors[index];
                final isExpanded = _expandedErrorMessage == error.value;

                return _ErrorNameCard(
                  error: error,
                  siteId: widget.siteId,
                  isExpanded: isExpanded,
                  onTap: () {
                    setState(() {
                      _expandedErrorMessage =
                          isExpanded ? null : error.value;
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _ErrorNameCard extends ConsumerWidget {
  final ErrorNameItem error;
  final String siteId;
  final bool isExpanded;
  final VoidCallback onTap;

  const _ErrorNameCard({
    required this.error,
    required this.siteId,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    const errorColor = AppColors.error;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Card(
        child: Column(
          children: [
            Semantics(
              expanded: isExpanded,
              child: InkWell(
              onTap: onTap,
              borderRadius: isExpanded
                  ? const BorderRadius.vertical(top: Radius.circular(12))
                  : BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: errorColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            error.errorName,
                            style: const TextStyle(
                              fontSize: 10,
                              color: errorColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${formatNumber(error.count)} ${l10n.occurrences}',
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      error.value,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.people_outline,
                            size: 14,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(width: 4),
                        Text(
                          '${error.sessionCount} ${l10n.sessionsAffected}',
                          style:
                              theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                        ),
                        const Spacer(),
                        Icon(
                          isExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                          size: 20,
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
            if (isExpanded) ...[
              Divider(
                height: 1,
                color: theme.dividerTheme.color,
              ),
              _ErrorEventsSection(
                siteId: siteId,
                errorMessage: error.value,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Provider for error events of a specific error message.
final _errorEventsProvider = FutureProvider.family<List<ErrorEventItem>, ({String siteId, String errorMessage})>((ref, args) async {
  final repo = ref.read(errorsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final filterCtrl = ref.read(filterControllerProvider.notifier);

  final params = {
    ...timeRange.toQueryParams(),
    ...filterCtrl.toQueryParams(),
  };

  return repo.getErrorEvents(
    args.siteId,
    errorMessage: args.errorMessage,
    params: params,
  );
});

class _ErrorEventsSection extends ConsumerWidget {
  final String siteId;
  final String errorMessage;

  const _ErrorEventsSection({
    required this.siteId,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(
      _errorEventsProvider((siteId: siteId, errorMessage: errorMessage)),
    );
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return eventsAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (error, _) => Padding(
        padding: const EdgeInsets.all(16),
        child: Text(l10n.failedToLoadEventsWithError(error.toString()),
            style: theme.textTheme.bodySmall),
      ),
      data: (events) {
        if (events.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text(l10n.noEventsFound, style: theme.textTheme.bodySmall),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: events.length.clamp(0, 10),
          separatorBuilder: (context, index) => Divider(
            height: 1,
            indent: 14,
            endIndent: 14,
            color: theme.dividerTheme.color?.withValues(alpha: 0.5),
          ),
          itemBuilder: (context, index) {
            final event = events[index];
            return _ErrorEventTile(event: event);
          },
        );
      },
    );
  }
}

class _ErrorEventTile extends ConsumerWidget {
  final ErrorEventItem event;

  const _ErrorEventTile({required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isMobile = ref.watch(currentSiteIsMobileProvider);
    final dt = DateTime.tryParse(event.timestamp);
    final timeStr = dt != null ? DateFormat('MMM d, HH:mm:ss').format(dt) : '';

    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.schedule,
                  size: 18, color: theme.textTheme.bodySmall?.color),
              const SizedBox(width: 4),
              Text(
                timeStr,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
              ),
              const Spacer(),
              if (!isMobile && event.browser != null && event.browser!.isNotEmpty)
                Text(
                  event.browser!,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                ),
            ],
          ),
          const SizedBox(height: 4),
          if (event.pathname != null && event.pathname!.isNotEmpty)
            Row(
              children: [
                Icon(Icons.article_outlined,
                    size: 18, color: theme.textTheme.bodySmall?.color),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    event.pathname!,
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          if (event.message.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              event.message,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: AppColors.error,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}
