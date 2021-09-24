import 'package:google_geocoding_api/google_geocoding_api.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final api = GoogleGeocodingApi(googelApiKey);
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
}
