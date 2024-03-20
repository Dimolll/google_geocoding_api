/// Exception wiil thow when Bad Reponse
class GoogleGeocodingBadResponseException implements Exception {
  const GoogleGeocodingBadResponseException();

  @override
  String toString() =>
      'GoogleGeocodingBadResponseException(message:"BAD RESPONSE EXCEPTION")';
}
