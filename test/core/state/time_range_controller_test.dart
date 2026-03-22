import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rybbit_unofficial/shared/models/time_range.dart';
import 'package:rybbit_unofficial/core/state/time_range_controller.dart';

void main() {
  group('TimeBucket.toQueryValue', () {
    test('minute returns "minute"', () {
      expect(TimeBucket.minute.toQueryValue(), 'minute');
    });

    test('fiveMinutes returns "five_minutes"', () {
      expect(TimeBucket.fiveMinutes.toQueryValue(), 'five_minutes');
    });

    test('tenMinutes returns "ten_minutes"', () {
      expect(TimeBucket.tenMinutes.toQueryValue(), 'ten_minutes');
    });

    test('fifteenMinutes returns "fifteen_minutes"', () {
      expect(TimeBucket.fifteenMinutes.toQueryValue(), 'fifteen_minutes');
    });

    test('hour returns "hour"', () {
      expect(TimeBucket.hour.toQueryValue(), 'hour');
    });

    test('day returns "day"', () {
      expect(TimeBucket.day.toQueryValue(), 'day');
    });

    test('week returns "week"', () {
      expect(TimeBucket.week.toQueryValue(), 'week');
    });

    test('month returns "month"', () {
      expect(TimeBucket.month.toQueryValue(), 'month');
    });

    test('year returns "year"', () {
      expect(TimeBucket.year.toQueryValue(), 'year');
    });
  });

  group('TimeRange.toQueryParams', () {
    final start = DateTime(2024, 1, 15);
    final end = DateTime(2024, 3, 20);

    test('returns start_date and end_date for non-pastMinutes mode', () {
      final range = TimeRange(
        mode: TimeMode.range,
        startDate: start,
        endDate: end,
        timeZone: 'UTC',
      );
      final params = range.toQueryParams();
      expect(params['start_date'], '2024-01-15');
      expect(params['end_date'], '2024-03-20');
      expect(params['time_zone'], 'UTC');
      expect(params.containsKey('past_minutes_start'), false);
    });

    test('returns past_minutes params for pastMinutes mode', () {
      final range = TimeRange(
        mode: TimeMode.pastMinutes,
        startDate: start,
        endDate: end,
        timeZone: 'America/New_York',
        pastMinutesStart: 30,
        pastMinutesEnd: 0,
      );
      final params = range.toQueryParams();
      expect(params['past_minutes_start'], '30');
      expect(params['past_minutes_end'], '0');
      expect(params['time_zone'], 'America/New_York');
      expect(params.containsKey('start_date'), false);
    });

    test('defaults past_minutes to 0 when null', () {
      final range = TimeRange(
        mode: TimeMode.pastMinutes,
        startDate: start,
        endDate: end,
        timeZone: 'UTC',
      );
      final params = range.toQueryParams();
      expect(params['past_minutes_start'], '0');
      expect(params['past_minutes_end'], '0');
    });

    test('formats dates correctly for day mode', () {
      final range = TimeRange(
        mode: TimeMode.day,
        startDate: DateTime(2024, 12, 1),
        endDate: DateTime(2024, 12, 1),
        timeZone: 'Europe/Prague',
      );
      final params = range.toQueryParams();
      expect(params['start_date'], '2024-12-01');
      expect(params['end_date'], '2024-12-01');
      expect(params['time_zone'], 'Europe/Prague');
    });
  });

  group('TimeRange.toBucketedQueryParams', () {
    test('includes bucket in params', () {
      final range = TimeRange(
        mode: TimeMode.range,
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 1, 31),
        timeZone: 'UTC',
        bucket: TimeBucket.day,
      );
      final params = range.toBucketedQueryParams();
      expect(params['bucket'], 'day');
      expect(params['start_date'], '2024-01-01');
      expect(params['end_date'], '2024-01-31');
      expect(params['time_zone'], 'UTC');
    });

    test('includes bucket for pastMinutes mode', () {
      final range = TimeRange(
        mode: TimeMode.pastMinutes,
        startDate: DateTime(2024, 1, 1),
        endDate: DateTime(2024, 1, 1),
        timeZone: 'UTC',
        bucket: TimeBucket.hour,
        pastMinutesStart: 60,
        pastMinutesEnd: 0,
      );
      final params = range.toBucketedQueryParams();
      expect(params['bucket'], 'hour');
      expect(params['past_minutes_start'], '60');
    });
  });

  group('TimeRangeController.setCustomRange bucket logic', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('diff == 0 (same day) → hour bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 6, 1);
      final end = DateTime(2024, 6, 1);
      controller.setCustomRange(start, end);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.hour);
    });

    test('diff == 1 → hour bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 6, 1);
      final end = DateTime(2024, 6, 2);
      controller.setCustomRange(start, end);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.hour);
    });

    test('diff == 2 → day bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 6, 1);
      final end = DateTime(2024, 6, 3);
      controller.setCustomRange(start, end);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.day);
    });

    test('diff == 90 → day bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 1, 1);
      // Use exactly 90 days difference
      final end90 = start.add(const Duration(days: 90));
      controller.setCustomRange(start, end90);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.day);
    });

    test('diff == 91 → week bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 1, 1);
      final end91 = start.add(const Duration(days: 91));
      controller.setCustomRange(start, end91);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.week);
    });

    test('diff == 365 → week bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 1, 1);
      final end365 = start.add(const Duration(days: 365));
      controller.setCustomRange(start, end365);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.week);
    });

    test('diff == 366 → month bucket', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 1, 1);
      final end366 = start.add(const Duration(days: 366));
      controller.setCustomRange(start, end366);
      expect(container.read(timeRangeControllerProvider).bucket,
          TimeBucket.month);
    });

    test('sets mode to range and preserves start/end dates', () {
      final controller =
          container.read(timeRangeControllerProvider.notifier);
      final start = DateTime(2024, 3, 1);
      final end = DateTime(2024, 3, 15);
      controller.setCustomRange(start, end);
      final state = container.read(timeRangeControllerProvider);
      expect(state.mode, TimeMode.range);
      expect(state.startDate, start);
      expect(state.endDate, end);
    });
  });
}
