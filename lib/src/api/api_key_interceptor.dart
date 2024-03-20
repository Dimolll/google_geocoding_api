import 'package:dio/dio.dart';

/// This class [ApiKeyInterceptor] is responsible for adding an api key to every request.
class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor(this._apiKey);

  final String _apiKey;

  /// Adding API Key to every requests
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(
        options.copyWith(
          queryParameters: options.queryParameters..['key'] = _apiKey,
        ),
      );
}
