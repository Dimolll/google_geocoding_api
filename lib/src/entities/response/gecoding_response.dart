import 'response_status_code_enum.dart';
import 'result.dart';

/// class that contains search results
/// and Response status
class GoogleGeocodingResponse {
  /// Private Constructor
  const GoogleGeocodingResponse._({
    required this.results,
    this.status = GoogleResponseStatusCode.ok,
    this.errorMessage = '',
  });

  /// [GoogleGeocodingResponse] From Json factory
  factory GoogleGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResponse._(
        status: GoogleResponseStatusCode.fromString(
          json['status'] as String? ?? '',
        ),
        results: (json['results'] as Iterable<dynamic>?)?.map((dynamic json) =>
                GoogleGeocodingResult.fromJson(json as Map<String, dynamic>)) ??
            <GoogleGeocodingResult>[],
        errorMessage: json['error_message'] ?? '',
      );

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#results
  final Iterable<GoogleGeocodingResult> results;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#StatusCodes
  final GoogleResponseStatusCode status;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/requests-geocoding#ErrorMessages
  /// Default is Empty
  final String errorMessage;
}
