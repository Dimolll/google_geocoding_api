import 'package:dio/dio.dart';
import 'package:google_geocoding_api/src/api/api_key_interceptor.dart';
import 'package:google_geocoding_api/src/entities/gecoding_response.dart';

class GoogleGeocodingApi {
  GoogleGeocodingApi(String apiKey)
      : _dio = Dio()
          ..interceptors.add(ApiKeyInterceptor(apiKey))
          ..interceptors.add(
            LogInterceptor(
              responseBody: true,
              requestBody: true,
              requestHeader: true,
              responseHeader: false,
            ),
          );

  final Dio _dio;

  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/geocode/json?';

  Future<GoogleGeocodingResponse> search(
    String address, {
    String? bounds,
    String? language,
    String? region,
    String? components,
  }) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'address': address.replaceAll(' ', '+'),
      'bounds': bounds,
      'language': language,
      'region': region,
      'components': components,
    };
    query.removeWhere((_, dynamic value) => value == null);
    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );
    return GoogleGeocodingResponse.fromJson(response.data!);
  }

  Future<GoogleGeocodingResponse> reverse(
    String latlng, {
    String? locationType,
    String? resultType,
    String? language,
  }) async {
    final Map<String, dynamic> query = <String, dynamic>{
      'latlng': latlng,
      'language': language,
      'result_type': resultType,
      'location_type': locationType,
    };
    query.removeWhere((_, dynamic value) => value == null);
    final Response<Map<String, dynamic>> response =
        await _dio.get<Map<String, dynamic>>(
      _baseUrl,
      queryParameters: query,
    );
    return GoogleGeocodingResponse.fromJson(response.data!);
  }
}
