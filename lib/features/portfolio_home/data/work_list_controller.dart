import 'package:flutter_folio/features/portfolio_home/data/work_list_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/model/work_model.dart';

final getWorkListController =
    StateNotifierProvider<WorkListController, AsyncValue>(
  (ref) => WorkListController(
    workListRepo: ref.watch(workListRepoProvider),
  ),
);
final addWorkController = StateNotifierProvider<WorkListController, AsyncValue>(
  (ref) => WorkListController(
    workListRepo: ref.watch(workListRepoProvider),
  ),
);
final removeWorkController =
    StateNotifierProvider<WorkListController, AsyncValue>(
  (ref) => WorkListController(
    workListRepo: ref.watch(workListRepoProvider),
  ),
);

class WorkListController extends StateNotifier<AsyncValue> {
  final WorkListRepo _workListRepo;

  WorkListController({required WorkListRepo workListRepo})
      : _workListRepo = workListRepo,
        super(const AsyncValue.loading());

  void getWorkList() async {
    final successOrFailed = await _workListRepo.getWorkList();
    if (state is AsyncData && successOrFailed.isRight()) return;
    state = successOrFailed.fold(
      (l) => AsyncValue.data(l),
      (r) => AsyncValue.error(
        r,
        StackTrace.fromString(''),
      ),
    );
  }

  void addWork(WorkModel work) async {
    final successOrFailed = await _workListRepo.addWorkToPortfoilio(work);
    if (state is AsyncData && successOrFailed.isRight()) return;
    state = successOrFailed.fold(
      (l) => AsyncValue.data(l),
      (r) => AsyncValue.error(
        r,
        StackTrace.fromString(''),
      ),
    );
  }

  void removeWork(WorkModel work) async {
    final successOrFailed = await _workListRepo.removeWorkById(work);
    if (state is AsyncData && successOrFailed.isRight()) return;
    state = successOrFailed.fold(
      (l) => AsyncValue.data(l),
      (r) => AsyncValue.error(
        r,
        StackTrace.fromString(''),
      ),
    );
  }
}
