/// A user journey path from the API.
class JourneyPath {
  final List<String> path;
  final int count;
  final double percentage;

  const JourneyPath({
    required this.path,
    required this.count,
    required this.percentage,
  });

  factory JourneyPath.fromJson(Map<String, dynamic> json) {
    final rawPath = json['path'] as List? ?? [];
    return JourneyPath(
      path: rawPath.map((e) => e.toString()).toList(),
      count: (json['count'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toDouble() ?? 0,
    );
  }
}
