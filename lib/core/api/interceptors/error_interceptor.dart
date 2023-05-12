// create an error interceptor class

import 'package:dio/dio.dart';

class ErrorInterceptor extends QueuedInterceptor {
  // final Dio _dio;
  // ErrorInterceptor(this._dio);
  Future<void> onErrorloc(DioError err, ErrorInterceptorHandler handler) async {
    // debugPrint(err.toString());
    if (err.response?.statusCode != null && err.response!.statusCode == 401 ||
        err.response!.statusCode == 403) {
      handler.next(err);
      // _dio.interceptors.clear();
    }
    return super.onError(err, handler);
  }
}
