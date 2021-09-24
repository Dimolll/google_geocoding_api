class GoogleGeocodingLocation {
  const GoogleGeocodingLocation({required this.lat, required this.lng});

  factory GoogleGeocodingLocation.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingLocation(
        lat: json['lat'] as double,
        lng: json['lng'] as double,
      );

  final double lat;
  final double lng;
}
