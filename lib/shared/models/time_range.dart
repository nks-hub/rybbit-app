import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'time_range.freezed.dart';

enum TimeMode {
  day,
  range,
  week,
  month,
  year,
  pastMinutes,
  allTime,
}

enum TimeBucket {
  minute,
  fiveMinutes,
  tenMinutes,
  fifteenMinutes,
  hour,
  day,
  week,
  month,
  year;

  String toQueryValue() {
    switch (this) {
      case TimeBucket.minute:
        return 'minute';
      case TimeBucket.fiveMinutes:
        return 'five_minutes';
      case TimeBucket.tenMinutes:
        return 'ten_minutes';
      case TimeBucket.fifteenMinutes:
        return 'fifteen_minutes';
      case TimeBucket.hour:
        return 'hour';
      case TimeBucket.day:
        return 'day';
      case TimeBucket.week:
        return 'week';
      case TimeBucket.month:
        return 'month';
      case TimeBucket.year:
        return 'year';
    }
  }
}

@freezed
abstract class TimeRange with _$TimeRange {
  const TimeRange._();

  const factory TimeRange({
    required TimeMode mode,
    required DateTime startDate,
    required DateTime endDate,
    required String timeZone,
    @Default(TimeBucket.hour) TimeBucket bucket,
    int? pastMinutesStart,
    int? pastMinutesEnd,
  }) = _TimeRange;

  static final _dateFormat = DateFormat('yyyy-MM-dd');

  Map<String, String> toQueryParams() {
    if (mode == TimeMode.pastMinutes) {
      return {
        'past_minutes_start': '${pastMinutesStart ?? 0}',
        'past_minutes_end': '${pastMinutesEnd ?? 0}',
        'time_zone': timeZone,
      };
    }

    return {
      'start_date': _dateFormat.format(startDate),
      'end_date': _dateFormat.format(endDate),
      'time_zone': timeZone,
    };
  }

  Map<String, String> toBucketedQueryParams() {
    return {
      ...toQueryParams(),
      'bucket': bucket.toQueryValue(),
    };
  }
}
