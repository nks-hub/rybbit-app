import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/state/current_site_provider.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/models/event.dart';
import '../../../shared/utils/formatters.dart';
import '../application/event_log_controller.dart';

/// Known event types for filter chips.
const _eventTypes = [
  'pageview',
  'custom_event',
  'outbound',
  'button_click',
  'form_submit',
  'input_change',
  'copy',
];

class EventLogScreen extends ConsumerStatefulWidget {
  final String siteId;

  const EventLogScreen({super.key, required this.siteId});

  @override
  ConsumerState<EventLogScreen> createState() => _EventLogScreenState();
}

class _EventLogScreenState extends ConsumerState<EventLogScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  final Set<String> _selectedTypes = {};
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref
          .read(eventLogControllerProvider(widget.siteId).notifier)
          .loadMore();
    }
  }

  List<RawEvent> _applyFilters(List<RawEvent> events) {
    var filtered = events;

    // Type filter
    if (_selectedTypes.isNotEmpty) {
      filtered = filtered.where((e) => _selectedTypes.contains(e.type)).toList();
    }

    // Search filter
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      filtered = filtered.where((e) {
        return (e.pathname?.toLowerCase().contains(q) ?? false) ||
            (e.eventName.toLowerCase().contains(q)) ||
            (e.pageTitle?.toLowerCase().contains(q) ?? false) ||
            (e.hostname?.toLowerCase().contains(q) ?? false) ||
            (e.referrer?.toLowerCase().contains(q) ?? false);
      }).toList();
    }

    return filtered;
  }

  String _typeLabel(String type, AppLocalizations l10n) {
    return switch (type) {
      'pageview' => l10n.eventTypePageview,
      'custom_event' => l10n.eventTypeCustom,
      'outbound' => l10n.eventTypeOutbound,
      'button_click' => l10n.eventTypeClick,
      'form_submit' => l10n.eventTypeForm,
      'input_change' => l10n.eventTypeInput,
      'copy' => l10n.eventTypeCopy,
      _ => type,
    };
  }

  @override
  Widget build(BuildContext context) {
    final logAsync = ref.watch(eventLogControllerProvider(widget.siteId));
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final domain = ref.watch(currentSiteDomainProvider);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.eventLog, style: const TextStyle(fontSize: 18)),
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
          // Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: l10n.searchEvents,
                prefixIcon: const Icon(Icons.search, size: 20),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              style: const TextStyle(fontSize: 14),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),

          // Type filter chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                // "All" chip
                Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: FilterChip(
                    label: Text(l10n.allTypes,
                        style: const TextStyle(fontSize: 12)),
                    selected: _selectedTypes.isEmpty,
                    onSelected: (_) =>
                        setState(() => _selectedTypes.clear()),
                    visualDensity: VisualDensity.compact,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
                for (final type in _eventTypes)
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: FilterChip(
                      label: Text(_typeLabel(type, l10n),
                          style: const TextStyle(fontSize: 12)),
                      selected: _selectedTypes.contains(type),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedTypes.add(type);
                          } else {
                            _selectedTypes.remove(type);
                          }
                        });
                      },
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 4),

          // Event list
          Expanded(
            child: logAsync.when(
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
                      Text(l10n.failedToLoadEventLog,
                          style: theme.textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Text(formatError(error),
                          style: theme.textTheme.bodySmall,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => ref
                            .read(eventLogControllerProvider(widget.siteId)
                                .notifier)
                            .refresh(),
                        child: Text(l10n.retry),
                      ),
                    ],
                  ),
                ),
              ),
              data: (logState) {
                final filtered = _applyFilters(logState.events);

                if (logState.events.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.list_alt,
                            size: 48,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(height: 16),
                        Text(l10n.noEventsFound,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  );
                }

                if (filtered.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.filter_list_off,
                            size: 48,
                            color: theme.textTheme.bodySmall?.color),
                        const SizedBox(height: 16),
                        Text(l10n.noMatchingEvents,
                            style: theme.textTheme.bodyLarge),
                      ],
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () => ref
                      .read(eventLogControllerProvider(widget.siteId).notifier)
                      .refresh(),
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    itemCount: filtered.length +
                        (logState.isLoadingMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= filtered.length) {
                        return Semantics(
                          label: l10n.loading,
                          child: const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(
                                child: CircularProgressIndicator(
                                    strokeWidth: 2)),
                          ),
                        );
                      }

                      final event = filtered[index];
                      return _RawEventCard(event: event);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _RawEventCard extends StatelessWidget {
  final RawEvent event;

  const _RawEventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final flag = countryToFlag(event.country);
    final (Color typeColor, IconData typeIcon) = _getTypeStyle(event.type);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: type badge + timestamp
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: typeColor.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(typeIcon, size: 14, color: typeColor),
                        const SizedBox(width: 4),
                        Text(
                          event.displayType,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: typeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _formatTimestamp(event.timestamp),
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Pathname
              if (event.pathname != null && event.pathname!.isNotEmpty)
                Row(
                  children: [
                    Icon(Icons.link,
                        size: 14, color: theme.textTheme.bodySmall?.color),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        event.pathname!,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

              // Details row: country, browser, device
              const SizedBox(height: 6),
              Wrap(
                spacing: 12,
                runSpacing: 4,
                children: [
                  if (flag.isNotEmpty || event.country != null)
                    _DetailChip(
                      icon: null,
                      prefix: flag.isNotEmpty ? flag : null,
                      text: event.country ?? l10n.unknownCountry,
                    ),
                  if (event.browser != null && event.browser!.isNotEmpty)
                    _DetailChip(
                      icon: Icons.public,
                      text: event.browser!,
                    ),
                  if (event.deviceType != null && event.deviceType!.isNotEmpty)
                    _DetailChip(
                      icon: _deviceIcon(event.deviceType!),
                      text: event.deviceType!,
                    ),
                ],
              ),

              // Referrer
              if (event.referrer != null && event.referrer!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.call_received,
                        size: 12, color: theme.textTheme.bodySmall?.color),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.referrer!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],

              // Custom event properties
              if (event.type == 'custom_event' &&
                  event.properties != null &&
                  event.properties!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.data_object,
                        size: 12, color: theme.textTheme.bodySmall?.color),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        event.properties!,
                        style: theme.textTheme.bodySmall
                            ?.copyWith(fontSize: 11),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  String _formatTimestamp(String timestamp) {
    final dt = DateTime.tryParse(timestamp);
    if (dt == null) return timestamp;
    final local = dt.toLocal();
    final h = local.hour.toString().padLeft(2, '0');
    final m = local.minute.toString().padLeft(2, '0');
    final s = local.second.toString().padLeft(2, '0');
    final mon = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    return '$mon/$d $h:$m:$s';
  }

  (Color, IconData) _getTypeStyle(String type) {
    return switch (type) {
      'pageview' => (const Color(0xFF3B82F6), Icons.visibility),
      'custom_event' => (const Color(0xFF22C55E), Icons.bolt),
      'outbound' => (const Color(0xFFF59E0B), Icons.open_in_new),
      'button_click' => (const Color(0xFF8B5CF6), Icons.touch_app),
      'form_submit' => (const Color(0xFFEC4899), Icons.send),
      'input_change' => (const Color(0xFF06B6D4), Icons.edit),
      'copy' => (const Color(0xFF64748B), Icons.content_copy),
      _ => (const Color(0xFF94A3B8), Icons.circle),
    };
  }

  IconData _deviceIcon(String deviceType) {
    final lower = deviceType.toLowerCase();
    if (lower.contains('mobile') || lower.contains('phone')) {
      return Icons.phone_android;
    }
    if (lower.contains('tablet')) return Icons.tablet;
    return Icons.desktop_windows;
  }
}

class _DetailChip extends StatelessWidget {
  final IconData? icon;
  final String? prefix;
  final String text;

  const _DetailChip({this.icon, this.prefix, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (prefix != null) ...[
          Text(prefix!, style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 3),
        ] else if (icon != null) ...[
          Icon(icon, size: 13, color: theme.textTheme.bodySmall?.color),
          const SizedBox(width: 3),
        ],
        Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
