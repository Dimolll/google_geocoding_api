import '../entities/response/response_status_code_enum.dart';

/// You may find more info at https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes
class GoogleGeodocingWrongStatusException implements Exception {
  final GoogleResponseStatusCode statusCode;

  const GoogleGeodocingWrongStatusException(this.statusCode);

  @override
  String toString() => 'GOOGLE GEOCODING EXCEPTION\n'
      'StatusCode is ${statusCode.name}\n'
      'You may find more info at https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes';
}
