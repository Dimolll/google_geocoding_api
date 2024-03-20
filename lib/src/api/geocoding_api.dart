import 'package:dio/dio.dart';
import 'package:google_geocoding_api/src/api/api_key_interceptor.dart';
import 'package:google_geocoding_api/src/entities/response/gecoding_response.dart';
import 'package:google_geocoding_api/src/entities/response/response_status_code_enum.dart';
import 'package:google_geocoding_api/src/exceptions/bad_reponse_exception.dart';
import 'package:google_geocoding_api/src/exceptions/wrong_status_exception.dart';

/// Api class with default and reverse searching
class GoogleGeocodingApi {
  GoogleGeocodingApi(
    String apiKey, {
    bool isLogged = false,
    Iterable<Interceptor>? interceptors,
    Dio? dio,
  }) : _dio = (dio ?? Dio())
          ..interceptors.addAll(
            [
              ApiKeyInterceptor(apiKey),
              if (isLogged)
                LogInterceptor(
                  responseBody: true,
                  requestBody: true,
                  requestHeader: true,
                  responseHeader: false,
                ),
              if (interceptors != null) ...interceptors,
            ],
          );

  final Dio _dio;

  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?';

  /// Classic Geosearch
  /// https://developers.google.com/maps/documentation/geocoding/requests-geocoding
  Future<GoogleGeocodingResponse> search(
    String address, {
    String? bounds,
    String? language,
    String? region,

    /// More info at
    /// https://developers.google.com/maps/documentation/geocoding/overview#component-filtering
    String? components,
  }) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'address': address.replaceAll(' ', '+'),
      if (bounds != null) 'bounds': bounds,
      if (language != null) 'language': language,
      if (region != null) 'region': region,
      if (components != null) 'components': components,
    };

    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );
    return _mapOrThrow(response.data!);
  }

  /// Reverse Geosearch
  /// https://developers.google.com/maps/documentation/geocoding/requests-reverse-geocoding
  Future<GoogleGeocodingResponse> reverse(
    String latlng, {
    String? locationType,
    String? resultType,
    String? language,
  }) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'latlng': latlng,
      if (language != null) 'language': language,
      if (resultType != null) 'result_type': resultType,
      if (locationType != null) 'location_type': locationType,
    };

    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );
    return _mapOrThrow(response.data!);
  }

  /// Decode place from place id
  /// https://developers.google.com/maps/documentation/geocoding/requests-places-geocoding
  Future<GoogleGeocodingResponse> placeGeocoding(
    String placeId, {
    String? language,
    String? resultType,
    String? region,
    String? locationType,
  }) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'place_id': placeId,
      if (language != null) 'language': language,
      if (resultType != null) 'result_type': resultType,
      if (locationType != null) 'location_type': locationType,
      if (region != null) 'region': region,
    };

    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );
    return _mapOrThrow(response.data!);
  }

  GoogleGeocodingResponse _mapOrThrow(Map<String, dynamic>? json) {
    if (json == null) {
      throw GoogleGeocodingBadResponseException();
    }
    final response = GoogleGeocodingResponse.fromJson(json);

    if (response.status == GoogleResponseStatusCode.ok) {
      return response;
    }

    throw GoogleGeodocingWrongStatusException(response.status);
  }
}
