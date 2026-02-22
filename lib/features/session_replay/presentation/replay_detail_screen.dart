import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/replay_repository.dart';

/// Provider for replay events of a specific session.
final replayEventsProvider = FutureProvider.family<List<ReplayEvent>,
    ({String siteId, String sessionId})>((ref, args) async {
  final repo = ref.read(replayRepositoryProvider);
  return repo.getReplayEvents(args.siteId, args.sessionId);
});

class ReplayDetailScreen extends ConsumerWidget {
  final String siteId;
  final String sessionId;

  const ReplayDetailScreen({
    super.key,
    required this.siteId,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(
      replayEventsProvider((siteId: siteId, sessionId: sessionId)),
    );
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Replay Events', style: TextStyle(fontSize: 18)),
      ),
      body: eventsAsync.when(
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
                Text('Failed to load replay',
                    style: theme.textTheme.bodyLarge),
                const SizedBox(height: 8),
                Text(error.toString(),
                    style: theme.textTheme.bodySmall,
                    textAlign: TextAlign.center),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => ref.invalidate(
                    replayEventsProvider(
                        (siteId: siteId, sessionId: sessionId)),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (events) => _buildContent(context, events),
      ),
    );
  }

  Widget _buildContent(BuildContext context, List<ReplayEvent> events) {
    final theme = Theme.of(context);

    if (events.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.videocam_off_outlined,
                size: 48, color: theme.textTheme.bodySmall?.color),
            const SizedBox(height: 16),
            Text('No replay events', style: theme.textTheme.bodyLarge),
          ],
        ),
      );
    }

    // Filter to meaningful events (skip mouse moves, mutations for readability)
    final meaningfulEvents = _filterMeaningfulEvents(events);

    // Session metadata from meta event
    final metaEvent = events.where((e) => e.type == 4).firstOrNull;
    final firstTimestamp = events.first.timestamp;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Session info header
        Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.videocam,
                          size: 20, color: theme.colorScheme.primary),
                      const SizedBox(width: 8),
                      Text(
                        'Session Replay',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _InfoChip(
                    label: 'Total Events',
                    value: events.length.toString(),
                  ),
                  _InfoChip(
                    label: 'User Actions',
                    value: meaningfulEvents.length.toString(),
                  ),
                  if (metaEvent?.detailLabel != null)
                    _InfoChip(
                      label: 'URL',
                      value: metaEvent!.detailLabel!,
                    ),
                  if (events.length >= 2)
                    _InfoChip(
                      label: 'Duration',
                      value: _formatReplayDuration(
                        events.first.timestamp,
                        events.last.timestamp,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),

        // Filter toggle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Event Timeline (${meaningfulEvents.length} actions)',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),

        // Timeline
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            itemCount: meaningfulEvents.length,
            itemBuilder: (context, index) {
              final event = meaningfulEvents[index];
              final isLast = index == meaningfulEvents.length - 1;
              return _ReplayEventTimelineItem(
                event: event,
                isLast: isLast,
                baseTimestamp: firstTimestamp,
              );
            },
          ),
        ),
      ],
    );
  }

  /// Filters events to meaningful user actions.
  List<ReplayEvent> _filterMeaningfulEvents(List<ReplayEvent> events) {
    return events.where((e) {
      // Keep: Full snapshots, custom events, plugin events, meta events
      if (e.type == 2 || e.type == 4 || e.type == 5 || e.type == 6) {
        return true;
      }
      // For incremental snapshots, keep: clicks, scrolls, input, resize
      if (e.type == 3 && e.data != null) {
        final source = e.data!['source'] as int?;
        // Mouse interaction (2), Scroll (3), Viewport resize (4), Input (5)
        return source == 2 || source == 3 || source == 4 || source == 5;
      }
      return false;
    }).toList();
  }

  String _formatReplayDuration(num startMs, num endMs) {
    final seconds = ((endMs - startMs) / 1000).round();
    if (seconds < 0) return '0s';
    if (seconds < 60) return '${seconds}s';
    final minutes = seconds ~/ 60;
    final remaining = seconds % 60;
    if (remaining == 0) return '${minutes}m';
    return '${minutes}m ${remaining}s';
  }
}

class _InfoChip extends StatelessWidget {
  final String label;
  final String value;

  const _InfoChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: theme.textTheme.bodySmall),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReplayEventTimelineItem extends StatelessWidget {
  final ReplayEvent event;
  final bool isLast;
  final num baseTimestamp;

  const _ReplayEventTimelineItem({
    required this.event,
    required this.isLast,
    required this.baseTimestamp,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Time offset from start
    final offsetMs = (event.timestamp - baseTimestamp).round();
    final offsetSec = (offsetMs / 1000).toStringAsFixed(1);

    // Determine color and icon based on event type/source
    final (Color color, IconData icon, String label) = _getEventStyle();

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line + dot
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, size: 14, color: color),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color:
                          theme.dividerTheme.color?.withValues(alpha: 0.3),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          label,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.surface,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: theme.dividerTheme.color ??
                                Colors.grey.shade800,
                          ),
                        ),
                        child: Text(
                          '+${offsetSec}s',
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                  if (event.detailLabel != null &&
                      event.detailLabel != label) ...[
                    const SizedBox(height: 2),
                    Text(
                      event.detailLabel!,
                      style:
                          theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  (Color, IconData, String) _getEventStyle() {
    switch (event.type) {
      case 2: // Full snapshot
        return (
          const Color(0xFF6366F1),
          Icons.photo_camera,
          'Page Snapshot'
        );
      case 4: // Meta
        return (
          const Color(0xFF3B82F6),
          Icons.language,
          'Page Load'
        );
      case 5: // Custom event
        return (
          const Color(0xFF22C55E),
          Icons.bolt,
          event.detailLabel ?? 'Custom Event'
        );
      case 6: // Plugin
        return (
          const Color(0xFF8B5CF6),
          Icons.extension,
          'Plugin Event'
        );
      case 3: // Incremental snapshot
        final source = event.data?['source'] as int?;
        switch (source) {
          case 2: // Mouse interaction
            final mouseLabel = event.mouseInteractionLabel ?? 'Interaction';
            return (
              const Color(0xFFF59E0B),
              Icons.mouse,
              mouseLabel,
            );
          case 3: // Scroll
            return (
              const Color(0xFF64748B),
              Icons.swap_vert,
              'Scroll',
            );
          case 4: // Viewport resize
            return (
              const Color(0xFF06B6D4),
              Icons.aspect_ratio,
              'Resize',
            );
          case 5: // Input
            return (
              const Color(0xFFEC4899),
              Icons.keyboard,
              'Input',
            );
          default:
            return (
              Colors.grey,
              Icons.circle,
              event.detailLabel ?? 'Update',
            );
        }
      default:
        return (
          Colors.grey,
          Icons.circle,
          event.typeLabel,
        );
    }
  }
}
