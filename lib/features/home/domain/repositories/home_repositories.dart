import 'package:dartz/dartz.dart';

import '../../home_export.dart';


abstract class HomeRepositories {
  Future<Either<Failure, Unit>> postAddTask(AddEntity addEntity);

  Future<Either<Failure, HomeResponseEntity>> getHome(int skip);
  Future<Either<Failure, Unit>> putEditTask(int taskId,bool delete);
}
