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
