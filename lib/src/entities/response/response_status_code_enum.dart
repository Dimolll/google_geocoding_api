/// All info about status codes
/// https://developers.google.com/maps/documentation/geocoding/requests-geocoding#StatusCodes
enum GoogleResponseStatusCode {
  ok,
  zeroResults,
  overDailyLimit,
  overQueryLimit,
  requestDenied,
  invalidRequest,
  unknowError;

  static GoogleResponseStatusCode fromString(String value) => switch (value) {
        'OK' => GoogleResponseStatusCode.ok,
        'ZERO_RESULTS' => GoogleResponseStatusCode.zeroResults,
        'OVER_DAILY_LIMIT' => GoogleResponseStatusCode.overDailyLimit,
        'OVER_QUERY_LIMIT' => GoogleResponseStatusCode.overQueryLimit,
        'REQUEST_DENIED' => GoogleResponseStatusCode.requestDenied,
        'INVALID_REQUEST' => GoogleResponseStatusCode.invalidRequest,
        _ => GoogleResponseStatusCode.unknowError,
      };
}
