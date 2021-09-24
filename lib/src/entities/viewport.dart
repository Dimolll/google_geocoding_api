import 'location.dart';

class GoogleGeocodingViewport {
  const GoogleGeocodingViewport({
    required this.northeast,
    required this.southwest,
  });

  factory GoogleGeocodingViewport.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingViewport(
        northeast: GoogleGeocodingLocation.fromJson(
          json['northeast'] as Map<String, dynamic>,
        ),
        southwest: GoogleGeocodingLocation.fromJson(
          json['southwest'] as Map<String, dynamic>,
        ),
      );

  final GoogleGeocodingLocation northeast;
  final GoogleGeocodingLocation southwest;
}
