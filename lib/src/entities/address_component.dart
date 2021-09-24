class GoogleGeocodingAddressComponent {
  const GoogleGeocodingAddressComponent({
    this.longName = '',
    this.shortName = '',
    this.types = const <String>[],
  });

  factory GoogleGeocodingAddressComponent.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingAddressComponent(
          longName: json['long_name'] as String? ?? '',
          shortName: json['short_name'] as String? ?? '',
          types: (json['types'] as Iterable<dynamic>?)
                  ?.map<String>((dynamic json) => json.toString()) ??
              <String>[]);

  final String longName;
  final String shortName;
  final Iterable<String> types;
}
