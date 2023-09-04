## Introduction

This package implement [Google Geocoding API][geocoding_link] with only dart dependency(without flutter).  
Before working with the package, be sure to read [Before you begin][before_begin] and create an API key in Google Developer Console.

[geocoding_link]: https://developers.google.com/maps/documentation/geocoding/overview#Geocoding
[before_begin]: https://developers.google.com/maps/documentation/geocoding/overview#before-you-begin 

## USAGE
### Geocoding (latitude/longitude lookup)
This is example code how to use Geocoding Search. Before use it please read [Geocoding (latitude/longitude lookup)][geocoding_lookup]

[geocoding_lookup]:https://developers.google.com/maps/documentation/geocoding/overview#geocoding-lookup
``` Dart
import 'package:google_geocoding_api/google_geocoding_api.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final bool isDebugMode = true;  
  final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);  
  final searchResults = await api.search(
    'Boston',
    language: 'en',
  );
}

```

### Reverse geocoding (address lookup)
This is example code how to use Geocoding Reverse Search. Before use it please read [Reverse geocoding (address lookup)][geocoding_reverse]

[geocoding_reverse]:https://developers.google.com/maps/documentation/geocoding/overview#ReverseGeocoding
``` Dart
import 'package:google_geocoding_api/google_geocoding_api.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final bool isDebugMode = true;  
  final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);  
  final reversedSearchResults = await api.reverse(
    '42.360083,-71.05888',
    language: 'en',
  );
}

```

### Place geocoding
This is example code how to use Place Geocoding. Before use it please read [Place Geocoding][place_geocoding]

[place_geocoding]:https://developers.google.com/maps/documentation/geocoding/requests-places-geocoding
``` Dart
import 'package:google_geocoding_api/google_geocoding_api.dart';

Future<void> main() async {
  const String googelApiKey = 'YOUR_API_KEY';
  final bool isDebugMode = true;  
  final api = GoogleGeocodingApi(googelApiKey, isLogged: isDebugMode);  
  final placeSearchResults = await api.placeGeocoding(
    'ChIJd8BlQ2BZwokRAFUEcm_qrcA',
    language: 'en',
  );
}

```


## Contact and bugs
Use [Issue Tracker][issue_tracker] for any questions or bug reports.

[issue_tracker]: https://github.com/Dimolll/google_geocoding_api/issues/
