import 'location.dart';
import 'viewport.dart';

class GoogleGeocodingGeometry {
  const GoogleGeocodingGeometry({
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  factory GoogleGeocodingGeometry.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingGeometry(
        location: GoogleGeocodingLocation.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
        locationType: json['location_type'] as String? ?? '',
        viewport: GoogleGeocodingViewport.fromJson(
          json['viewport'] as Map<String, dynamic>,
        ),
      );
  final GoogleGeocodingLocation location;
  final String locationType;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#Viewports
  final GoogleGeocodingViewport viewport;
}
