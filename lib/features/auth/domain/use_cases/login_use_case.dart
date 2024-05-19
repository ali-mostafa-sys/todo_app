import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/auth/login_export.dart';

class LoginUseCase {
  final AuthRepositories authRepositories;

  LoginUseCase({required this.authRepositories});

  Future<Either<Failure, LoginResponseEntity>> call(
      LoginPostEntity loginPostEntity) async {
    return await authRepositories.postLogin(loginPostEntity);
  }
}
