import 'location.dart';

/// More info at
/// https://developers.google.com/maps/documentation/geocoding/overview#Viewports

class GoogleGeocodingViewport {
  const GoogleGeocodingViewport({
    required this.northeast,
    required this.southwest,
  });

  /// [GoogleGeocodingViewport] From Json factory
  factory GoogleGeocodingViewport.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingViewport(
        northeast: GoogleGeocodingLocation.fromJson(
          json['northeast'] as Map<String, dynamic>,
        ),
        southwest: GoogleGeocodingLocation.fromJson(
          json['southwest'] as Map<String, dynamic>,
        ),
      );

  /// Northeast coordinates
  final GoogleGeocodingLocation northeast;

  /// Southwest coordinates
  final GoogleGeocodingLocation southwest;
}
