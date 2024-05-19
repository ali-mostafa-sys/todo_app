import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/auth/login_export.dart';

class AuthRepositoriesImpl implements AuthRepositories {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoriesImpl(
      {required this.authDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, LoginResponseEntity>> postLogin(
      LoginPostEntity loginPostEntity) async {
    final loginPostModel = LoginPostModel(
        userName: loginPostEntity.userName, password: loginPostEntity.password);

    if (await networkInfo.isConnected) {
      try {
        final response = await authDataSource.postLogin(loginPostModel);
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
