class PerformanceTimeSeries {
  final String time;
  final double value;

  const PerformanceTimeSeries({
    required this.time,
    required this.value,
  });

  factory PerformanceTimeSeries.fromJson(
      Map<String, dynamic> json, String metricKey) {
    return PerformanceTimeSeries(
      time: json['time'] as String? ?? '',
      value: (json[metricKey] as num?)?.toDouble() ?? 0.0,
    );
  }
}

class PerformanceDimensionItem {
  final String dimensionValue;
  final int eventCount;
  final double lcpP75;
  final double clsP75;
  final double fcpP75;
  final double ttfbP75;
  final double inpP75;

  const PerformanceDimensionItem({
    required this.dimensionValue,
    required this.eventCount,
    this.lcpP75 = 0,
    this.clsP75 = 0,
    this.fcpP75 = 0,
    this.ttfbP75 = 0,
    this.inpP75 = 0,
  });

  factory PerformanceDimensionItem.fromJson(
      Map<String, dynamic> json, String dimension) {
    return PerformanceDimensionItem(
      dimensionValue: json[dimension] as String? ?? '(unknown)',
      eventCount: (json['event_count'] as num?)?.toInt() ?? 0,
      lcpP75: (json['lcp_p75'] as num?)?.toDouble() ?? 0,
      clsP75: (json['cls_p75'] as num?)?.toDouble() ?? 0,
      fcpP75: (json['fcp_p75'] as num?)?.toDouble() ?? 0,
      ttfbP75: (json['ttfb_p75'] as num?)?.toDouble() ?? 0,
      inpP75: (json['inp_p75'] as num?)?.toDouble() ?? 0,
    );
  }

  double getVitalP75(String vital) {
    switch (vital) {
      case 'lcp':
        return lcpP75;
      case 'cls':
        return clsP75;
      case 'fcp':
        return fcpP75;
      case 'ttfb':
        return ttfbP75;
      case 'inp':
        return inpP75;
      default:
        return 0;
    }
  }
}
