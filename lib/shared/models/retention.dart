/// Retention cohort data from the API.
class RetentionCohort {
  final int size;
  final List<double?> percentages;

  const RetentionCohort({required this.size, required this.percentages});

  factory RetentionCohort.fromJson(Map<String, dynamic> json) {
    final rawPercentages = json['percentages'] as List? ?? [];
    return RetentionCohort(
      size: (json['size'] as num?)?.toInt() ?? 0,
      percentages: rawPercentages
          .map((e) => e == null ? null : (e as num).toDouble())
          .toList(),
    );
  }
}

class RetentionData {
  final Map<String, RetentionCohort> cohorts;
  final int maxPeriods;
  final String mode;
  final int range;

  const RetentionData({
    required this.cohorts,
    required this.maxPeriods,
    required this.mode,
    required this.range,
  });

  factory RetentionData.fromJson(Map<String, dynamic> json) {
    final rawCohorts = json['cohorts'] as Map<String, dynamic>? ?? {};
    final cohorts = rawCohorts.map(
      (key, value) => MapEntry(
        key,
        RetentionCohort.fromJson(value as Map<String, dynamic>),
      ),
    );
    return RetentionData(
      cohorts: cohorts,
      maxPeriods: (json['maxPeriods'] as num?)?.toInt() ?? 0,
      mode: json['mode'] as String? ?? 'week',
      range: (json['range'] as num?)?.toInt() ?? 90,
    );
  }
}
