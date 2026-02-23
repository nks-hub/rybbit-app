import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/models/funnel.dart';
import '../../../shared/utils/formatters.dart';
import '../data/funnels_repository.dart';

/// Provider for saved funnels list.
final _funnelsProvider =
    FutureProvider.family<List<Funnel>, String>((ref, siteId) async {
  final repo = ref.read(funnelsRepositoryProvider);
  return repo.getFunnels(siteId);
});

class FunnelsScreen extends ConsumerWidget {
  final String siteId;

  const FunnelsScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final funnelsAsync = ref.watch(_funnelsProvider(siteId));
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Funnels', style: TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: 'Go back',
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: funnelsAsync.when(
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
                Text('Failed to load funnels',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(_funnelsProvider(siteId)),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (funnels) {
          if (funnels.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_alt_outlined,
                      size: 64, color: theme.textTheme.bodySmall?.color),
                  const SizedBox(height: 16),
                  Text('No funnels saved',
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text('Create funnels in the web dashboard',
                      style: theme.textTheme.bodySmall),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(_funnelsProvider(siteId));
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: funnels.length,
              itemBuilder: (context, index) {
                final funnel = funnels[index];
                return _FunnelCard(
                  funnel: funnel,
                  siteId: siteId,
                  onDelete: () => _deleteFunnel(context, ref, funnel),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _deleteFunnel(
    BuildContext context,
    WidgetRef ref,
    Funnel funnel,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Funnel'),
        content: Text('Delete "${funnel.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    try {
      final repo = ref.read(funnelsRepositoryProvider);
      await repo.deleteFunnel(siteId, funnel.funnelId);
      ref.invalidate(_funnelsProvider(siteId));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete funnel: $e')),
        );
      }
    }
  }
}

class _FunnelCard extends ConsumerStatefulWidget {
  final Funnel funnel;
  final String siteId;
  final VoidCallback onDelete;

  const _FunnelCard({
    required this.funnel,
    required this.siteId,
    required this.onDelete,
  });

  @override
  ConsumerState<_FunnelCard> createState() => _FunnelCardState();
}

class _FunnelCardState extends ConsumerState<_FunnelCard> {
  bool _expanded = false;
  FunnelAnalysis? _analysis;
  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          InkWell(
            onTap: _toggleExpand,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.filter_alt_outlined,
                      size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.funnel.name,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Delete',
                    icon: Icon(Icons.delete_outline,
                        size: 20, color: theme.colorScheme.error),
                    onPressed: widget.onDelete,
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
          if (_expanded) ...[
            const Divider(height: 1),
            if (_loading)
              const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(_error!, style: theme.textTheme.bodySmall),
              )
            else if (_analysis != null)
              _FunnelVisualization(analysis: _analysis!),
          ],
        ],
      ),
    );
  }

  Future<void> _toggleExpand() async {
    setState(() => _expanded = !_expanded);

    if (_expanded && _analysis == null && !_loading) {
      setState(() {
        _loading = true;
        _error = null;
      });

      try {
        final steps = widget.funnel.steps;

        if (steps.isEmpty) {
          setState(() {
            _loading = false;
            _error = 'No steps defined for this funnel';
          });
          return;
        }

        final repo = ref.read(funnelsRepositoryProvider);
        final analysis =
            await repo.analyzeFunnel(widget.siteId, steps, null);
        setState(() {
          _analysis = analysis;
          _loading = false;
        });
      } catch (e) {
        setState(() {
          _loading = false;
          _error = 'Failed to analyze: $e';
        });
      }
    }
  }
}

class _FunnelVisualization extends StatelessWidget {
  final FunnelAnalysis analysis;

  const _FunnelVisualization({required this.analysis});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final steps = analysis.steps;

    if (steps.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text('No data', style: theme.textTheme.bodySmall),
      );
    }

    final maxVisitors =
        steps.fold<int>(0, (max, s) => s.visitors > max ? s.visitors : max);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          // Overall conversion
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Overall Conversion',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    )),
                Text(
                  formatPercentage(analysis.overallConversion),
                  style: const TextStyle(
                    color: Color(0xFF22C55E),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Steps
          ...List.generate(steps.length, (i) {
            final step = steps[i];
            final barWidth = maxVisitors > 0
                ? (step.visitors / maxVisitors).clamp(0.0, 1.0)
                : 0.0;

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${i + 1}',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          step.name,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        formatNumber(step.visitors),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: barWidth,
                      backgroundColor: theme.colorScheme.primary
                          .withValues(alpha: 0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.primary.withValues(alpha: 0.6),
                      ),
                      minHeight: 6,
                    ),
                  ),
                  if (i < steps.length - 1 && step.dropoff > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 2),
                      child: Text(
                        'Dropoff: ${formatPercentage(step.dropoff)}',
                        style: TextStyle(
                          color: theme.colorScheme.error,
                          fontSize: 11,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
