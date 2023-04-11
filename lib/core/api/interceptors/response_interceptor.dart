import 'package:dio/dio.dart';

class ResponseInterceptor extends Interceptor {
  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode == 200) return super.onResponse(response, handler);
    if (response.statusCode == 401 || response.statusCode == 403) {

      return super.onResponse(response, handler);
    }else{
      return super.onResponse(response, handler);
    }
      

  }
}
