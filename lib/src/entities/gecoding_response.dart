import 'result.dart';

class GoogleGeocodingResponse {
  const GoogleGeocodingResponse({required this.results, required this.status});

  factory GoogleGeocodingResponse.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResponse(
        status: json['status'] as String,
        results: (json['results'] as Iterable<dynamic>?)?.map((dynamic json) =>
                GoogleGeocodingResult.fromJson(json as Map<String, dynamic>)) ??
            <GoogleGeocodingResult>[],
      );

  final Iterable<GoogleGeocodingResult> results;
  final String status;
}
