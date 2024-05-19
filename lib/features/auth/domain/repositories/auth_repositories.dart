import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/auth/login_export.dart';

abstract class AuthRepositories {
  Future<Either<Failure, LoginResponseEntity>> postLogin(
      LoginPostEntity loginPostEntity);
}
