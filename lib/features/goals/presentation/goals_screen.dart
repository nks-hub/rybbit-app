import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../features/analytics/application/time_range_controller.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/goal.dart';
import '../../../shared/utils/formatters.dart';
import '../data/goals_repository.dart';

/// Provider for goals list with conversion stats.
final _goalsProvider =
    FutureProvider.family<List<Goal>, String>((ref, siteId) async {
  ref.watch(timeRangeControllerProvider);
  final repo = ref.read(goalsRepositoryProvider);
  final timeRange = ref.read(timeRangeControllerProvider);
  final params = timeRange.toQueryParams();
  return repo.getGoals(siteId, params: params);
});

class GoalsScreen extends ConsumerWidget {
  final String siteId;

  const GoalsScreen({super.key, required this.siteId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(_goalsProvider(siteId));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.goals, style: const TextStyle(fontSize: 18)),
        leading: IconButton(
          tooltip: l10n.goBack,
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.createGoal,
        onPressed: () => _showGoalForm(context, ref, null),
        child: const Icon(Icons.add),
      ),
      body: goalsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Semantics(liveRegion: true, child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,
                    size: 48, color: theme.colorScheme.error),
                const SizedBox(height: 16),
                Text(l10n.failedToLoadGoals,
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(formatError(error),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(_goalsProvider(siteId)),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        )),
        data: (goals) {
          if (goals.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flag_outlined,
                      size: 64, color: theme.textTheme.bodySmall?.color, semanticLabel: ''),
                  const SizedBox(height: 16),
                  Text(l10n.noGoalsConfigured,
                      style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  Text(l10n.noGoalsHint,
                      style: theme.textTheme.bodySmall),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(_goalsProvider(siteId));
            },
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemCount: goals.length,
              itemBuilder: (context, index) {
                final goal = goals[index];
                return _GoalCard(
                  goal: goal,
                  onEdit: () => _showGoalForm(context, ref, goal),
                  onDelete: () => _deleteGoal(context, ref, goal),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Future<void> _showGoalForm(
    BuildContext context,
    WidgetRef ref,
    Goal? existingGoal,
  ) async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (ctx) => _GoalFormDialog(goal: existingGoal),
    );

    if (result == null) return;

    try {
      final repo = ref.read(goalsRepositoryProvider);
      if (existingGoal != null) {
        await repo.updateGoal(siteId, existingGoal.goalId, result);
      } else {
        await repo.createGoal(siteId, result);
      }
      ref.invalidate(_goalsProvider(siteId));
    } catch (e) {
      if (context.mounted) {
        final l10nCtx = AppLocalizations.of(context)!;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10nCtx.errorGeneric(e.toString()))),
        );
      }
    }
  }

  Future<void> _deleteGoal(
    BuildContext context,
    WidgetRef ref,
    Goal goal,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final l10nDialog = AppLocalizations.of(ctx)!;
        return AlertDialog(
          title: Text(l10nDialog.deleteGoal),
          content: Text(l10nDialog.deleteGoalConfirm(goal.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l10nDialog.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l10nDialog.delete, style: TextStyle(color: Theme.of(ctx).colorScheme.error)),
            ),
          ],
        );
      },
    );

    if (confirmed != true) return;

    try {
      final repo = ref.read(goalsRepositoryProvider);
      await repo.deleteGoal(siteId, goal.goalId);
      ref.invalidate(_goalsProvider(siteId));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.failedToDeleteGoal(e.toString()))),
        );
      }
    }
  }
}

class _GoalCard extends StatelessWidget {
  final Goal goal;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const _GoalCard({
    required this.goal,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final typeColor = goal.goalType == 'path'
        ? const Color(0xFF3B82F6)
        : const Color(0xFF22C55E);
    final ratePercent = (goal.conversionRate * 100).clamp(0, 100).toDouble();

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              goal.name,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: typeColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              goal.goalType,
                              style: TextStyle(
                                color: typeColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _goalDetail(l10n),
                        style: theme.textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: l10n.edit,
                  icon: const Icon(Icons.edit_outlined, size: 20),
                  onPressed: onEdit,
                ),
                IconButton(
                  tooltip: l10n.delete,
                  icon: Icon(Icons.delete_outline,
                      size: 20, color: theme.colorScheme.error),
                  onPressed: onDelete,
                ),
              ],
            ),
            // Conversion stats
            if (goal.totalSessions > 0) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  _StatChip(
                    label: l10n.conversions,
                    value: formatNumber(goal.totalConversions),
                  ),
                  const SizedBox(width: 12),
                  _StatChip(
                    label: l10n.rate,
                    value: '${ratePercent.toStringAsFixed(1)}%',
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: ratePercent / 100,
                        minHeight: 6,
                        backgroundColor: theme.colorScheme.primary
                            .withValues(alpha: 0.1),
                        valueColor:
                            AlwaysStoppedAnimation<Color>(typeColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _goalDetail(AppLocalizations l10n) {
    if (goal.pathPattern != null && goal.pathPattern!.isNotEmpty) {
      return '${l10n.path}: ${goal.pathPattern}';
    }
    if (goal.eventName != null && goal.eventName!.isNotEmpty) {
      return '${l10n.event}: ${goal.eventName}';
    }
    return goal.goalType;
  }
}

class _GoalFormDialog extends StatefulWidget {
  final Goal? goal;

  const _GoalFormDialog({this.goal});

  @override
  State<_GoalFormDialog> createState() => _GoalFormDialogState();
}

class _GoalFormDialogState extends State<_GoalFormDialog> {
  final _nameController = TextEditingController();
  final _pathController = TextEditingController();
  final _eventNameController = TextEditingController();
  String _goalType = 'path';

  @override
  void initState() {
    super.initState();
    if (widget.goal != null) {
      _nameController.text = widget.goal!.name;
      _goalType = widget.goal!.goalType;
      _pathController.text = widget.goal!.pathPattern ?? '';
      _eventNameController.text = widget.goal!.eventName ?? '';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _pathController.dispose();
    _eventNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.goal != null;
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(isEditing ? l10n.editGoal : l10n.createGoalTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: l10n.name),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              initialValue: _goalType,
              decoration: InputDecoration(labelText: l10n.type),
              items: [
                DropdownMenuItem(value: 'path', child: Text(l10n.path)),
                DropdownMenuItem(value: 'event', child: Text(l10n.event)),
              ],
              onChanged: (v) {
                if (v != null) setState(() => _goalType = v);
              },
            ),
            const SizedBox(height: 16),
            if (_goalType == 'path')
              TextField(
                controller: _pathController,
                decoration:
                    InputDecoration(labelText: l10n.pathPattern),
              )
            else
              TextField(
                controller: _eventNameController,
                decoration:
                    InputDecoration(labelText: l10n.eventName),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        ElevatedButton(
          onPressed: () {
            final name = _nameController.text.trim();
            if (name.isEmpty) return;

            final config = <String, dynamic>{};
            if (_goalType == 'path') {
              final path = _pathController.text.trim();
              if (path.isEmpty) return;
              config['pathPattern'] = path;
            } else {
              final event = _eventNameController.text.trim();
              if (event.isEmpty) return;
              config['eventName'] = event;
            }

            final body = <String, dynamic>{
              'name': name,
              'goalType': _goalType,
              'config': config,
            };

            Navigator.pop(context, body);
          },
          child: Text(isEditing ? l10n.update : l10n.create),
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;

  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
        ),
      ],
    );
  }
}
