<p align="center">
<a href="https://pub.dev/packages/google_geocoding_api"><img src="https://img.shields.io/pub/v/google_geocoding_api.svg?style=flat" alt="Pub"></a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="License: MIT"></a>
</p>

<p align="center">                  
<a href="https://www.buymeacoffee.com/dimoll" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" height="30px" width= "108px"></a>                  
</p>

---

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


### Pretty Address
Now you can use `.mapToPretty()` to get an instance of 
`GeocodingPrettyAddress` instance containing `address`, `city`, `country`, `latitude`, `longitude`, `postalCode`, `state`, `countryCode`, `streetNumber`, `streetName`, `placeId`.

**Attention**: The feature is experimental and may not work exactly as you need. Any suggestions for improvement may be written in the [Issue Tracker][issue_tracker].

``` Dart
  final placeSearchResults = await api.placeGeocoding(
    'ChIJd8BlQ2BZwokRAFUEcm_qrcA',
    language: 'en',
  );
  
  final prettyAddress = placeSearchResults.results.firstOrNull?.mapToPretty();

  if (prettyAddress == null) {
    return null;
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
```

## Contact and bugs
Use [Issue Tracker][issue_tracker] for any questions or bug reports.

[issue_tracker]: https://github.com/Dimolll/google_geocoding_api/issues/
