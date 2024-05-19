import 'package:dartz/dartz.dart';

import '../../home_export.dart';

class PutEditTaskUseCase {
  final HomeRepositories homeRepositories;

  PutEditTaskUseCase({required this.homeRepositories});
  Future<Either<Failure, Unit>> call(int taskId, bool delete) async {
    return await homeRepositories.putEditTask(taskId, delete);
  }
}
