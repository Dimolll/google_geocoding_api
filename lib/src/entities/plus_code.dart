class GoogleGeocodingPlusCode {
  const GoogleGeocodingPlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  factory GoogleGeocodingPlusCode.fromJson(Map<String, dynamic> json) =>
      GoogleGeocodingPlusCode(
        compoundCode: json['compound_code'] as String,
        globalCode: json['global_code'] as String,
      );
  final String compoundCode;
  final String globalCode;
}
