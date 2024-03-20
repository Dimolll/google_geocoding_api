import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import 'mocked_json_geocoding_value.dart';
import 'mocked_json_place_value.dart';
import 'mocked_json_reverse_value.dart';

class MockedHttpAdapter implements HttpClientAdapter {
  final _adapter = IOHttpClientAdapter();

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.queryParameters.containsKey('address')) {
      return ResponseBody.fromString(
        mockedWashingtonJson,
        HttpStatus.ok,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    } else if (options.queryParameters.containsKey('latlng')) {
      return ResponseBody.fromString(
        mockedReverseJson,
        HttpStatus.ok,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    } else if (options.queryParameters.containsKey('place_id')) {
      return ResponseBody.fromString(
        mockedPlaceJson,
        HttpStatus.ok,
        headers: {
          Headers.contentTypeHeader: [Headers.jsonContentType],
        },
      );
    }

    return _adapter.fetch(options, requestStream, cancelFuture);
  }

  @override
  void close({bool force = false}) {
    _adapter.close(force: force);
  }
}
