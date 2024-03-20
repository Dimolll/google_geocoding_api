import 'package:dio/dio.dart';
import 'package:google_geocoding_api/google_geocoding_api.dart';
import 'package:google_geocoding_api/src/entities/response/response_status_code_enum.dart';
import 'package:test/test.dart';

import 'mock/mocked_http_adapter.dart';

void main() {
  final dio = Dio()..httpClientAdapter = MockedHttpAdapter();
  const apiKey = 'TEST_API_KEY';
  test(
    'Washington Geocoding Test',
    () async {
      final api = GoogleGeocodingApi(apiKey, dio: dio);
      final res = await api.search('Washington');
      expect(res.status, GoogleResponseStatusCode.ok);
      expect(res.results.length, 1);
      expect(res.results.firstOrNull, isNotNull);
    },
  );
  final latlng = '40.714224,-73.961452';
  test(
    '$latlng Reverse Geocoding Test',
    () async {
      final api = GoogleGeocodingApi(apiKey, dio: dio);
      final res = await api.reverse(latlng);
      expect(res.status, GoogleResponseStatusCode.ok);
      expect(res.results.length, 13);
    },
  );
  final placeId = 'ChIJd8BlQ2BZwokRAFUEcm_qrcA';
  test(
    '$placeId Search By Place Id Test',
    () async {
      final api = GoogleGeocodingApi(apiKey, dio: dio);
      final res = await api.placeGeocoding(placeId);
      expect(res.status, GoogleResponseStatusCode.ok);
      expect(res.results.length, 1);
      expect(res.results.firstOrNull?.placeId, placeId);
    },
  );
}
