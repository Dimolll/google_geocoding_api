class GeocodingPrettyAddress {
  final String address;
  final String city;
  final String country;
  final double latitude;
  final double longitude;
  final String postalCode;
  final String state;
  final String stateCode;
  final String countryCode;
  final String streetNumber;
  final String streetName;
  final String placeId;
  final String neighborhood;

  const GeocodingPrettyAddress({
    this.address = '',
    this.neighborhood = '',
    this.city = '',
    this.country = '',
    this.latitude = 0,
    this.longitude = 0,
    this.postalCode = '',
    this.state = '',
    this.stateCode = '',
    this.countryCode = '',
    this.streetNumber = '',
    this.streetName = '',
    this.placeId = '',
  });

  @override
  String toString() => 'GeocodingPrettyAddress(\n'
      'address=$address\n'
      'city=$city\n'
      'neighborhood=$neighborhood\n'
      'country=$country\n'
      'countryCode=$countryCode\n'
      'postalCode=$postalCode\n'
      'state=$state\n'
      'stateCode=$stateCode\n'
      'streetNumber=$streetNumber\n'
      'streetName=$streetName\n'
      'placeId=$placeId\n'
      ')';
}
