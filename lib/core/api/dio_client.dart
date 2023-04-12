import 'package:dio/dio.dart';
import 'package:flutter_folio/core/api/interceptors/response_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'interceptors/error_interceptor.dart';
part 'dio_client.g.dart';

@riverpod
String baseUrl(BaseUrlRef ref) => 'http://10.0.2.2:8000/';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  final baseUrl = ref.watch(baseUrlProvider);
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30); // 30s
  dio.options.receiveTimeout = const Duration(seconds: 30); // 30s
  dio.options.contentType = Headers.contentTypeHeader;
  dio.options.headers = <String, Object>{
    'Accept': Headers.jsonContentType,
  };
  // dio.options.extra =
  dio.options.validateStatus =
      (status) => status != null && status >= 200 && status < 400;
  dio.interceptors.addAll([
    ResponseInterceptor(),
    ErrorInterceptor(dio),
  ]);

  return dio;
}
