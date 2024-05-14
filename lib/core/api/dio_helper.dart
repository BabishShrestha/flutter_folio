import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_folio/core/api/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../failure.dart';
import 'dio_util.dart';

final dioHelper = Provider<DioHelper>((ref) => DioHelper(ref));

class DioHelper {
  DioHelper(Ref ref) : _ref = ref;
  final Ref _ref;
  Dio get _dio => _ref.read(dioProvider);
  Future<Either<Response, Failure>> request<R>({
    required DioMethod reqType,
    R? reqBody,
    required String endpoint,
    required AuthType authType,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final method = describeEnum(reqType);
      // final data = <String, dynamic>{};
      // if (reqBody != null) {
      //   data.addAll(reqBody);
      // }
      var response = await _dio.request(
        endpoint,
        // queryParameters: queryParam ?? <String, dynamic>{},
        data: reqBody,
        options: Options(
          method: method,
          contentType: Headers.jsonContentType,
          headers: headers,
          // extra: {
          //   authToken: authType,
          // },
        ),
      );

      return Left(response);
    } on DioError catch (e) {
      return Right(e.toFailure);
    } catch (e) {
      return Right(Failure.fromException(e));
    }
  }
}
