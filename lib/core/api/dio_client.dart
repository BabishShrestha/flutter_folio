import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_folio/core/api/interceptors/response_interceptor.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'interceptors/error_interceptor.dart';

part 'dio_client.g.dart';

@riverpod
String baseUrl(BaseUrlRef ref) =>
    // 'https://50ee-2400-1a00-b010-7969-5512-8cd5-26f9-85ca.ngrok-free.app/';
kIsWeb ? 'http://localhost:8000/' : 'http://192.168.1.66:8000/';

@riverpod
Dio dio(DioRef ref) {
  final dio = Dio();
  final baseUrl = ref.watch(baseUrlProvider);
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 30); // 30s
  dio.options.receiveTimeout = const Duration(seconds: 30); // 30s
  dio.options.contentType = Headers.contentTypeHeader;
  dio.options.headers = <String, Object>{
    "Accept": Headers.jsonContentType,
    // "Access-Control-Allow-Origin": "*",
    // "Access-Control-Allow-Credentials": "true",
    // "Access-Control-Allow-Headers":
    //     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    // "Access-Control-Allow-Methods": "POST, OPTIONS"
  };
  // dio.options.extra =
  dio.options.validateStatus =
      (status) => status != null && status >= 200 && status < 400;
  dio.interceptors.addAll([
    ResponseInterceptor(),
    ErrorInterceptor(),
    // ErrorInterceptor(dio),
  ]);

  return dio;
}
