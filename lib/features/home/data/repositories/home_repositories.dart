import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/home/home_export.dart';

class HomeRepositoriesImpl implements HomeRepositories {
  final HomeDataSource homeDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoriesImpl(
      {required this.homeDataSource, required this.networkInfo});

  /// here add task //////////////////////////////////
  @override
  Future<Either<Failure, Unit>> postAddTask(AddEntity addEntity) async {
    final addModel = AddModel(
        todo: addEntity.todo,
        completed: addEntity.completed,
        userId: addEntity.userId);

    if (await networkInfo.isConnected) {
      try {
        final response = await homeDataSource.postAddTask(addModel);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(OfflineFailure());
      } on InvalidCredentialsException {
        return Left(InvalidCredentialsFailure());
      } on TimeOutException {
        return Left(TimeOutFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  /// here get home data//////////////////////////////////////
  @override
  Future<Either<Failure, HomeResponseEntity>> getHome(int skip) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeDataSource.getHome(skip);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(OfflineFailure());
      } on InvalidCredentialsException {
        return Left(InvalidCredentialsFailure());
      } on TimeOutException {
        return Left(TimeOutFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  /// here edit //////////////////////////////////////////////
  @override
  Future<Either<Failure, Unit>> putEditTask(int taskId, bool delete) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await homeDataSource.putEdit(taskId, delete);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      } on NetworkException {
        return Left(OfflineFailure());
      } on InvalidCredentialsException {
        return Left(InvalidCredentialsFailure());
      } on TimeOutException {
        return Left(TimeOutFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
