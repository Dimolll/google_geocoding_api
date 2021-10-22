/// Location coords with Latitude & Longitude
class GoogleGeocodingLocation {
  const GoogleGeocodingLocation({required this.lat, required this.lng});

  /// [GoogleGeocodingLocation] From Json factory
  factory GoogleGeocodingLocation.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingLocation(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
      );

  /// Latitude
  final double lat;

  /// Longitude
  final double lng;
}
