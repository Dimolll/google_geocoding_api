import 'address_component.dart';
import 'geometry.dart';
import 'plus_code.dart';

class GoogleGeocodingResult {
  const GoogleGeocodingResult({
    this.addressComponents = const <GoogleGeocodingAddressComponent>[],
    this.formattedAddress = '',
    this.geometry,
    this.placeId = '',
    this.plusCode,
    this.types = const <String>[],
  });

  factory GoogleGeocodingResult.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingResult(
        formattedAddress: json['formatted_address'] as String? ?? '',
        geometry: json['geometry'] != null
            ? GoogleGeocodingGeometry.fromJson(
                json['geometry'] as Map<String, dynamic>)
            : null,
        placeId: json['place_id'] as String? ?? '',
        plusCode: json['plus_code'] != null
            ? GoogleGeocodingPlusCode.fromJson(
                json['plus_code'] as Map<String, dynamic>)
            : null,
        addressComponents: (json['address_components'] as Iterable<dynamic>?)
                ?.map((dynamic json) =>
                    GoogleGeocodingAddressComponent.fromJson(
                        json as Map<String, dynamic>)) ??
            <GoogleGeocodingAddressComponent>[],
        types: (json['types'] as Iterable<dynamic>?)
                ?.map<String>((dynamic json) => json.toString()) ??
            <String>[],
      );

  final Iterable<GoogleGeocodingAddressComponent> addressComponents;
  final String formattedAddress;
  final GoogleGeocodingGeometry? geometry;
  final String placeId;
  final GoogleGeocodingPlusCode? plusCode;
  final Iterable<String> types;
}
