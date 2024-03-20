/// Location coords with Latitude & Longitude
class GoogleGeocodingLocation {
  const GoogleGeocodingLocation({required this.lat, required this.lng});

  /// [GoogleGeocodingLocation] From Json factory
  factory GoogleGeocodingLocation.fromJson(Map<String, dynamic> json) {
    final lat = json['lat'];
    final lng = json['lng'];
    return GoogleGeocodingLocation(
      lat: lat is int ? lat.toDouble() : lat as double,
      lng: lng is int ? lng.toDouble() : lng as double,
    );
  }

  /// Latitude
  final double lat;

  /// Longitude
  final double lng;
}
