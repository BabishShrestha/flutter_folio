import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/dio_helper.dart';
import '../../../core/api/dio_util.dart';
import '../../../core/api/success.dart';
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
      endpoint: 'works/list',
      authType: AuthType.bearer,
    );
    return response.fold(
      (l) async {
        final List<WorkModel> workList = (l.data as List<dynamic>)
            .map((e) => WorkModel.fromJson(e))
            .toList();
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

  Future<Either<Success, Failure>> addWorkToPortfoilio(
      WorkModel work) async {
    final response = await _api.request(
      reqType: DioMethod.post,
      endpoint: 'works/add',
      authType: AuthType.bearer,
      reqBody: {
        "id": work.id,
        "project_id": work.projectId,
        "project_title": work.projectTitle,
        "project_desc": work.projectDesc,
        "project_img": work.projectImg,
        "tools_used": work.toolsUsed,
        "playstore_link": work.playstoreLink,


      }
    );
    return response.fold(
      (l) async {
        final success=Success.fromJson(l.data);
        // final List<WorkModel> workList =
        //     (l.data as List<dynamic>).map((e) => WorkModel.fromJson(e)).toList();
        
        // await cacheBestRecord(bestStatModel: response);
        return Left(success);
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
