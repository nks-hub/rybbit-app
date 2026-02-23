import 'package:intl/intl.dart';
import 'package:riverpod/riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../../../shared/models/time_range.dart';

String _systemTimeZone() {
  return DateTime.now().timeZoneName;
}

TimeRange _todayRange() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return TimeRange(
    mode: TimeMode.day,
    startDate: today,
    endDate: today,
    timeZone: _systemTimeZone(),
    bucket: TimeBucket.hour,
  );
}

class TimeRangeController extends Notifier<TimeRange> {
  @override
  TimeRange build() => _todayRange();

  void setToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    state = TimeRange(
      mode: TimeMode.day,
      startDate: today,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.hour,
    );
  }

  void setYesterday() {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    state = TimeRange(
      mode: TimeMode.day,
      startDate: yesterday,
      endDate: yesterday,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.hour,
    );
  }

  void setLast7Days() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = today.subtract(const Duration(days: 6));
    state = TimeRange(
      mode: TimeMode.range,
      startDate: start,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.day,
    );
  }

  void setLast30Days() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = today.subtract(const Duration(days: 29));
    state = TimeRange(
      mode: TimeMode.range,
      startDate: start,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.day,
    );
  }

  void setThisWeek() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final weekday = today.weekday; // Monday = 1
    final startOfWeek = today.subtract(Duration(days: weekday - 1));
    state = TimeRange(
      mode: TimeMode.week,
      startDate: startOfWeek,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.day,
    );
  }

  void setThisMonth() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startOfMonth = DateTime(now.year, now.month, 1);
    state = TimeRange(
      mode: TimeMode.month,
      startDate: startOfMonth,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.day,
    );
  }

  void setThisYear() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startOfYear = DateTime(now.year, 1, 1);
    state = TimeRange(
      mode: TimeMode.year,
      startDate: startOfYear,
      endDate: today,
      timeZone: _systemTimeZone(),
      bucket: TimeBucket.month,
    );
  }

  void setCustomRange(DateTime start, DateTime end) {
    final diff = end.difference(start).inDays;
    TimeBucket bucket;
    if (diff <= 1) {
      bucket = TimeBucket.hour;
    } else if (diff <= 90) {
      bucket = TimeBucket.day;
    } else if (diff <= 365) {
      bucket = TimeBucket.week;
    } else {
      bucket = TimeBucket.month;
    }
    state = TimeRange(
      mode: TimeMode.range,
      startDate: start,
      endDate: end,
      timeZone: _systemTimeZone(),
      bucket: bucket,
    );
  }

  /// Returns a human-readable label for the current time range.
  String localizedLabel(AppLocalizations l10n) {
    final df = DateFormat('MMM d');
    switch (state.mode) {
      case TimeMode.day:
        final now = DateTime.now();
        final today = DateTime(now.year, now.month, now.day);
        if (state.startDate == today) return l10n.today;
        final yesterday = today.subtract(const Duration(days: 1));
        if (state.startDate == yesterday) return l10n.yesterday;
        return df.format(state.startDate);
      case TimeMode.week:
        return l10n.thisWeek;
      case TimeMode.month:
        return l10n.thisMonth;
      case TimeMode.year:
        return l10n.thisYear;
      case TimeMode.range:
        return '${df.format(state.startDate)} – ${df.format(state.endDate)}';
      case TimeMode.pastMinutes:
        return l10n.lastMinutes(state.pastMinutesStart ?? 0);
      case TimeMode.allTime:
        return l10n.allTime;
    }
  }
}

final timeRangeControllerProvider =
    NotifierProvider<TimeRangeController, TimeRange>(TimeRangeController.new);
