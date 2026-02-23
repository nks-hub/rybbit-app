class Funnel {
  final int funnelId;
  final String name;
  final List<Map<String, dynamic>> steps;

  const Funnel({
    required this.funnelId,
    required this.name,
    this.steps = const [],
  });

  factory Funnel.fromJson(Map<String, dynamic> json) {
    // Backend returns steps as a list, or data as legacy field
    List<Map<String, dynamic>> steps = [];
    final stepsRaw = json['steps'] ?? json['data'];
    if (stepsRaw is List) {
      steps = stepsRaw
          .map((e) => e is Map<String, dynamic>
              ? e
              : <String, dynamic>{'value': e.toString()})
          .toList();
    }

    return Funnel(
      funnelId: (json['id'] as num?)?.toInt() ??
          (json['funnelId'] as num?)?.toInt() ??
          (json['funnel_id'] as num?)?.toInt() ??
          0,
      name: json['name'] as String? ?? '',
      steps: steps,
    );
  }
}
