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
class TimeRange with _$TimeRange {
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
        'startDate': 'past_${pastMinutesStart}_minutes',
        'endDate': 'past_${pastMinutesEnd ?? 0}_minutes',
        'timezone': timeZone,
      };
    }

    return {
      'startDate': _dateFormat.format(startDate),
      'endDate': _dateFormat.format(endDate),
      'timezone': timeZone,
    };
  }

  Map<String, String> toBucketedQueryParams() {
    return {
      ...toQueryParams(),
      'bucket': bucket.toQueryValue(),
    };
  }
}
