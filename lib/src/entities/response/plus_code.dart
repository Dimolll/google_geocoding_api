/// GoogleGeocodingPlusCode class
class GoogleGeocodingPlusCode {
  const GoogleGeocodingPlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  /// [GoogleGeocodingPlusCode] From Json factory
  factory GoogleGeocodingPlusCode.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingPlusCode(
        compoundCode: json['compound_code'] as String? ?? '',
        globalCode: json['global_code'] as String? ?? '',
      );

  /// is a 6 character or longer local code with an explicit location
  /// (CWC8+R9, Mountain View, CA, USA). Do not programmatically parse this content.
  final String compoundCode;

  /// is a 4 character area code and 6 character or longer
  /// local code (849VCWC8+R9).
  final String globalCode;
}
