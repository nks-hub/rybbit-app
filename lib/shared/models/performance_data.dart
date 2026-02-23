class PerformanceOverview {
  final double lcp;
  final double cls;
  final double fcp;
  final double ttfb;
  final double inp;

  const PerformanceOverview({
    this.lcp = 0,
    this.cls = 0,
    this.fcp = 0,
    this.ttfb = 0,
    this.inp = 0,
  });

  factory PerformanceOverview.fromJson(Map<String, dynamic> json) {
    return PerformanceOverview(
      lcp: (json['lcp_p75'] as num?)?.toDouble() ?? 0,
      cls: (json['cls_p75'] as num?)?.toDouble() ?? 0,
      fcp: (json['fcp_p75'] as num?)?.toDouble() ?? 0,
      ttfb: (json['ttfb_p75'] as num?)?.toDouble() ?? 0,
      inp: (json['inp_p75'] as num?)?.toDouble() ?? 0,
    );
  }
}
