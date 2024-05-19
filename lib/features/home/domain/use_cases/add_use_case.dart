import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/home/home_export.dart';

class AddUseCase {
  final HomeRepositories homeRepositories;

  AddUseCase({required this.homeRepositories});

  Future<Either<Failure, Unit>> call(AddEntity addEntity) async {
    return await homeRepositories.postAddTask(addEntity);
  }
}
