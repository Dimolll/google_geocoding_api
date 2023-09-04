import 'package:google_geocoding_api/google_geocoding_api.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final bool isDebugMode = true;
  final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);
  final searchResults = await api.search(
    'Boston',
    language: 'en',
  );
  print(searchResults);
  final reversedSearchResults = await api.reverse(
    '42.360083,-71.05888',
    language: 'en',
  );
  print(reversedSearchResults);
  final placeSearchResults = await api.placeGeocoding(
    'ChIJd8BlQ2BZwokRAFUEcm_qrcA',
    language: 'en',
  );
  print(placeSearchResults);
}
