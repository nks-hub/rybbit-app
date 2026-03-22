/// Represents a session replay list item.
class ReplaySession {
  final String sessionId;
  final String? country;
  final String? browser;
  final String? operatingSystem;
  final String? deviceType;
  final num sessionDuration;
  final int pageviews;
  final String? sessionStart;
  final String? sessionEnd;
  final String? entryPage;

  const ReplaySession({
    required this.sessionId,
    this.country,
    this.browser,
    this.operatingSystem,
    this.deviceType,
    this.sessionDuration = 0,
    this.pageviews = 0,
    this.sessionStart,
    this.sessionEnd,
    this.entryPage,
  });

  factory ReplaySession.fromJson(Map<String, dynamic> json) {
    return ReplaySession(
      sessionId: json['session_id'] as String? ?? '',
      country: json['country'] as String?,
      browser: json['browser'] as String?,
      operatingSystem: json['operating_system'] as String?,
      deviceType: json['device_type'] as String?,
      sessionDuration: json['session_duration'] as num? ?? 0,
      pageviews: (json['pageviews'] as num?)?.toInt() ?? 0,
      sessionStart: json['session_start'] as String?,
      sessionEnd: json['session_end'] as String?,
      entryPage: json['entry_page'] as String?,
    );
  }
}

/// Represents a single replay event.
class ReplayEvent {
  final int type;
  final num timestamp;
  final Map<String, dynamic>? data;

  const ReplayEvent({
    required this.type,
    required this.timestamp,
    this.data,
  });

  factory ReplayEvent.fromJson(Map<String, dynamic> json) {
    return ReplayEvent(
      type: (json['type'] as num?)?.toInt() ?? 0,
      timestamp: json['timestamp'] as num? ?? 0,
      data: json['data'] as Map<String, dynamic>?,
    );
  }

  /// Human-readable event type label for the timeline view.
  String get typeLabel {
    switch (type) {
      case 0:
        return 'DOM Content Loaded';
      case 1:
        return 'Load';
      case 2:
        return 'Full Snapshot';
      case 3:
        return 'Incremental Snapshot';
      case 4:
        return 'Meta';
      case 5:
        return 'Custom Event';
      case 6:
        return 'Plugin';
      default:
        return 'Event ($type)';
    }
  }

  /// Extracts meaningful info from incremental snapshot events.
  String? get detailLabel {
    if (data == null) return null;

    // Incremental snapshot source types
    if (type == 3) {
      final source = data!['source'] as int?;
      switch (source) {
        case 0:
          return 'Mutation';
        case 1:
          return 'Mouse Move';
        case 2:
          return 'Mouse Interaction';
        case 3:
          return 'Scroll';
        case 4:
          return 'Viewport Resize';
        case 5:
          return 'Input';
        case 6:
          return 'Touch Move';
        case 7:
          return 'Media Interaction';
        case 8:
          return 'Style Sheet Rule';
        case 9:
          return 'Canvas Mutation';
        case 10:
          return 'Font';
        case 11:
          return 'Log';
        case 12:
          return 'Drag';
        case 13:
          return 'Style Declaration';
        case 14:
          return 'Selection';
        default:
          return 'Source $source';
      }
    }

    // Custom event tag
    if (type == 5) {
      return data!['tag'] as String? ?? data!['payload']?.toString();
    }

    // Meta event: URL
    if (type == 4) {
      return data!['href'] as String?;
    }

    return null;
  }

  /// Mouse interaction sub-type for type 3, source 2.
  String? get mouseInteractionLabel {
    if (type != 3 || data == null) return null;
    final source = data!['source'] as int?;
    if (source != 2) return null;

    final mouseType = data!['type'] as int?;
    switch (mouseType) {
      case 0:
        return 'Mouse Up';
      case 1:
        return 'Mouse Down';
      case 2:
        return 'Click';
      case 3:
        return 'Context Menu';
      case 4:
        return 'Double Click';
      case 5:
        return 'Focus';
      case 6:
        return 'Blur';
      case 7:
        return 'Touch Start';
      case 8:
        return 'Touch Move End';
      case 9:
        return 'Touch End';
      case 10:
        return 'Touch Cancel';
      default:
        return null;
    }
  }
}

/// Paginated replay list result.
class ReplayListResult {
  final List<ReplaySession> sessions;
  final int total;
  final bool hasMore;

  const ReplayListResult({
    required this.sessions,
    this.total = 0,
    this.hasMore = false,
  });
}
