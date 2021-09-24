import 'package:dio/dio.dart';

class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor(this._apiKey) : super();

  final String _apiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) =>
      handler.next(
        options.copyWith(
          queryParameters: options.queryParameters..['key'] = _apiKey,
        ),
      );
}
