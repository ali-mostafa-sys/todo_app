import 'package:to_do_app/features/auth/data/data_source/auth_data_source.dart';
import 'package:to_do_app/features/auth/data/repositories/auth_repositories.dart';
import 'package:to_do_app/features/auth/domain/repositories/auth_repositories.dart';
import 'package:to_do_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:to_do_app/features/auth/presentation/bloc/login/login_bloc.dart';
import 'package:to_do_app/injection_container.dart';

Future<void> authInjection() async {
  /// login
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));

  sl.registerLazySingleton(() => LoginUseCase(authRepositories: sl()));

  sl.registerLazySingleton<AuthRepositories>(
      () => AuthRepositoriesImpl(authDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<AuthDataSource>(() => AuthDataSourceImpl());
}
