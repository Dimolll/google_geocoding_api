import 'address_component.dart';
import 'geometry.dart';
import 'plus_code.dart';

/// More info at
/// https://developers.google.com/maps/documentation/geocoding/overview#results
class GoogleGeocodingResult {
  const GoogleGeocodingResult._({
    this.addressComponents = const <GoogleGeocodingAddressComponent>[],
    this.formattedAddress = '',
    this.geometry,
    this.placeId = '',
    this.plusCode,
    this.types = const <String>[],
  });

  /// [GoogleGeocodingResult] From Json factory
  factory GoogleGeocodingResult.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResult._(
        formattedAddress: json['formatted_address'] as String? ?? '',
        geometry: json['geometry'] != null
            ? GoogleGeocodingGeometry.fromJson(
                json['geometry'] as Map<String, dynamic>,
              )
            : null,
        placeId: json['place_id'] as String? ?? '',
        plusCode: json['plus_code'] != null
            ? GoogleGeocodingPlusCode.fromJson(
                json['plus_code'] as Map<String, dynamic>,
              )
            : null,
        addressComponents:
            (json['address_components'] as Iterable<dynamic>?)?.map(
                  (dynamic json) => GoogleGeocodingAddressComponent.fromJson(
                    json as Map<String, dynamic>,
                  ),
                ) ??
                <GoogleGeocodingAddressComponent>[],
        types: (json['types'] as Iterable<dynamic>?)
                ?.map<String>((dynamic json) => json.toString()) ??
            <String>[],
      );

  final Iterable<GoogleGeocodingAddressComponent> addressComponents;
  final String formattedAddress;

  ///
  final GoogleGeocodingGeometry? geometry;

  /// Google Place Id
  final String placeId;

  /// Plust code
  final GoogleGeocodingPlusCode? plusCode;

  /// More info at
  /// https://developers.google.com/maps/documentation/geocoding/overview#Types
  final Iterable<String> types;
}
