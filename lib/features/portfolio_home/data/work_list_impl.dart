import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/dio_helper.dart';
import '../../../core/api/dio_util.dart';
import '../../../core/failure.dart';
import '../domain/model/work_model.dart';

final workListRepoProvider = Provider<WorkListRepo>(
  (ref) => WorkListRepo(
    ref.watch(dioHelper),
  ),
);

class WorkListRepo {
  final DioHelper _api;

  WorkListRepo(this._api);

  Future<Either<List<WorkModel>, Failure>> getWorkList() async {
    final response = await _api.request(
      reqType: DioMethod.get,
      endpoint: '/posts',
      authType: AuthType.bearer,
    );
    return response.fold(
      (l) async {
        final List<WorkModel> workList =
            (l.data as List<dynamic>).map((e) => WorkModel.fromJson(e)).toList();
        // await cacheBestRecord(bestStatModel: response);
        return Left(workList);
      },
      (r) async {
        // final response = await getWorkListFromCache();
        // if (response != null) {
        //   _ref.read(bestDataState.notifier).state = response;
        // }

        return Right(r);
      },
    );
  }
}
