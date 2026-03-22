class FunnelStep {
  final String name;
  final int visitors;
  final double dropoff;

  const FunnelStep({
    required this.name,
    required this.visitors,
    required this.dropoff,
  });

  factory FunnelStep.fromJson(Map<String, dynamic> json) {
    return FunnelStep(
      name: json['step_name'] as String? ??
          json['name'] as String? ??
          json['step'] as String? ??
          '',
      visitors: (json['visitors'] as num?)?.toInt() ??
          (json['count'] as num?)?.toInt() ??
          0,
      dropoff: (json['dropoff_rate'] as num?)?.toDouble() ??
          (json['dropoff'] as num?)?.toDouble() ??
          (json['dropoffRate'] as num?)?.toDouble() ??
          0.0,
    );
  }
}

class FunnelAnalysis {
  final List<FunnelStep> steps;
  final int totalVisitors;
  final double overallConversion;

  const FunnelAnalysis({
    required this.steps,
    required this.totalVisitors,
    required this.overallConversion,
  });

  factory FunnelAnalysis.fromJson(Map<String, dynamic> json) {
    final stepsData = json['steps'] as List? ?? json['data'] as List? ?? [];
    final steps = stepsData
        .map((e) => FunnelStep.fromJson(e as Map<String, dynamic>))
        .toList();

    // Compute overall conversion if not provided
    final totalVisitors = (json['totalVisitors'] as num?)?.toInt() ??
        (json['total_visitors'] as num?)?.toInt() ??
        (steps.isNotEmpty ? steps.first.visitors : 0);

    double overallConversion =
        (json['overallConversion'] as num?)?.toDouble() ??
            (json['overall_conversion'] as num?)?.toDouble() ??
            0.0;

    if (overallConversion == 0.0 && steps.length >= 2) {
      final first = steps.first.visitors;
      final last = steps.last.visitors;
      if (first > 0) {
        overallConversion = (last / first) * 100;
      }
    }

    return FunnelAnalysis(
      steps: steps,
      totalVisitors: totalVisitors,
      overallConversion: overallConversion,
    );
  }
}
