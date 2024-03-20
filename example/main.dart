import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_geocoding_api/src/utils/pretty_address_mapper.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final bool isDebugMode = true;
  final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
  final searchResults = await api.search('Boston', language: 'uk');

  print(searchResults);
  for (var res in searchResults.results) {
    print(res.mapToPretty());
  }

  final reversedSearchResults = await api.reverse(
    '42.360083,-71.05888',
    language: 'en',
  );
  print(reversedSearchResults);
  for (var res in reversedSearchResults.results) {
    print(res.mapToPretty());
  }
  final placeSearchResults = await api.placeGeocoding(
    'ChIJd8BlQ2BZwokRAFUEcm_qrcA',
    language: 'en',
  );
  print(placeSearchResults);
  for (var res in placeSearchResults.results) {
    print(res.mapToPretty());
  }
  final prettyAddress = placeSearchResults.results.firstOrNull?.mapToPretty();

  if (prettyAddress == null) {
    return;
  }

  print(prettyAddress.postalCode);
  print(prettyAddress.streetNumber);
  print(prettyAddress.streetName);
  print(prettyAddress.city);
  print(prettyAddress.state);
  print(prettyAddress.placeId);
  print(prettyAddress.country);
  print(prettyAddress.address);
  print(prettyAddress.countryCode);
  print(prettyAddress.latitude);
  print(prettyAddress.longitude);
}
