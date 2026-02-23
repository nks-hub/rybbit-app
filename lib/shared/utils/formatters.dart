/// Formats a number with compact K/M suffixes.
String formatNumber(num value) {
  if (value >= 1000000) {
    final m = value / 1000000;
    return m == m.truncateToDouble()
        ? '${m.truncate()}M'
        : '${m.toStringAsFixed(1)}M';
  }
  if (value >= 1000) {
    final k = value / 1000;
    return k == k.truncateToDouble()
        ? '${k.truncate()}K'
        : '${k.toStringAsFixed(1)}K';
  }
  return value is int ? value.toString() : value.toStringAsFixed(0);
}

/// Formats duration in seconds to "Xm Ys" or "Xs".
String formatDuration(num seconds) {
  final totalSeconds = seconds.round();
  if (totalSeconds < 0) return '0s';
  if (totalSeconds < 60) return '${totalSeconds}s';

  final minutes = totalSeconds ~/ 60;
  final remaining = totalSeconds % 60;

  if (remaining == 0) return '${minutes}m';
  return '${minutes}m ${remaining}s';
}

/// Formats a number as percentage with one decimal place.
String formatPercentage(num value) {
  return '${value.toStringAsFixed(1)}%';
}

/// Formats a change percentage, clamped to ±999%.
String formatChangePercent(double value) {
  if (value > 999) return '+999%';
  if (value < -999) return '-999%';
  final sign = value > 0 ? '+' : '';
  return '$sign${value.toStringAsFixed(1)}%';
}

/// Maps ISO 3166-1 alpha-2 country codes to flag emojis.
String countryToFlag(String? countryCode) {
  if (countryCode == null || countryCode.length != 2) return '';
  final code = countryCode.toUpperCase();
  if (!RegExp(r'^[A-Z]{2}$').hasMatch(code)) return '';
  final firstChar = code.codeUnitAt(0) - 0x41 + 0x1F1E6;
  final secondChar = code.codeUnitAt(1) - 0x41 + 0x1F1E6;
  return String.fromCharCodes([firstChar, secondChar]);
}

/// Converts an error object to a user-friendly message.
String formatError(Object error) {
  final msg = error.toString().toLowerCase();
  if (msg.contains('timeout') || msg.contains('timed out')) {
    return 'Request timed out. Please try again.';
  }
  if (msg.contains('connection') ||
      msg.contains('socket') ||
      msg.contains('network')) {
    return 'Network error. Check your connection.';
  }
  if (msg.contains('401') || msg.contains('unauthorized')) {
    return 'Session expired. Please log in again.';
  }
  if (msg.contains('403') || msg.contains('forbidden')) {
    return 'Access denied.';
  }
  if (msg.contains('404') || msg.contains('not found')) {
    return 'Data not found.';
  }
  if (msg.contains('500') || msg.contains('internal server')) {
    return 'Server error. Please try again later.';
  }
  return 'Failed to load data. Please try again.';
}
