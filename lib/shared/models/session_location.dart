/// A session location from the API.
class SessionLocation {
  final double lat;
  final double lon;
  final String city;
  final String country;
  final int count;

  const SessionLocation({
    required this.lat,
    required this.lon,
    required this.city,
    required this.country,
    required this.count,
  });

  factory SessionLocation.fromJson(Map<String, dynamic> json) {
    return SessionLocation(
      lat: (json['lat'] as num?)?.toDouble() ?? 0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0,
      city: json['city'] as String? ?? '',
      country: json['country'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
    );
  }
}
