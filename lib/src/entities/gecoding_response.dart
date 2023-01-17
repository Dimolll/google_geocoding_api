import 'result.dart';

/// class that contains search results
/// and Response status
class GoogleGeocodingResponse {
  const GoogleGeocodingResponse._({
    required this.results,
    required this.status,
  });

  /// [GoogleGeocodingResponse] From Json factory
  factory GoogleGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResponse._(
        status: json['status'] as String? ?? '',
        results: (json['results'] as Iterable<dynamic>?)?.map((dynamic json) =>
                GoogleGeocodingResult.fromJson(json as Map<String, dynamic>)) ??
            <GoogleGeocodingResult>[],
      );

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#results
  final Iterable<GoogleGeocodingResult> results;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#StatusCodes
  final String status;
}
