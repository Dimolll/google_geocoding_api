import '../entities/pretty_address.dart';
import '../entities/response/result.dart';

extension PrettyAddressMapperExtension on GoogleGeocodingResult {
  GeocodingPrettyAddress mapToPretty() {
    String city = '';
    String country = '';
    String postalCode = '';
    String state = '';
    String stateCode = '';
    String streetNumber = '';
    String streetName = '';
    String neighborhood = '';
    String countryCode = '';

    for (final component in addressComponents) {
      final types = component.types;

      if (city.isEmpty) {
        if (types.contains('administrative_area_level_2')) {
          city = component.longName;
        } else if (types.contains('sublocality') &&
            types.contains('political')) {
          city = component.longName;
        } else if (types.contains('locality') && types.contains('political')) {
          city = component.longName;
        }
      }

      if (city.isNotEmpty && types.contains('administrative_area_level_2')) {
        city = component.longName;
      }
      if (types.contains('sublocality_level_1') ||
          types.contains('neighborhood')) {
        neighborhood = component.longName;
      }
      if (types.contains('country')) {
        country = component.longName;
        countryCode = component.shortName;
      }
      if (types.contains('postal_code')) {
        postalCode = component.longName;
      }
      if (types.contains('administrative_area_level_1')) {
        state = component.longName;
        stateCode = component.shortName;
      }
      if (types.contains('street_number')) {
        streetNumber = component.longName;
      }
      if (types.contains('route')) {
        streetName = component.longName;
      }
    }

    final location = geometry?.location;

    return GeocodingPrettyAddress(
      
      address: formattedAddress,
      city: city,
      country: country,
      countryCode: countryCode,
      placeId: placeId,
      postalCode: postalCode,
      state: state,
      stateCode: stateCode,
      streetName: streetName,
      streetNumber: streetNumber,
      latitude: location?.lat ?? 0,
      longitude: location?.lng ?? 0,
    );
  }
}
