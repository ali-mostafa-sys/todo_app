

import 'home_export.dart';

Future<void> homeInjection() async {
  // blocs
  sl.registerFactory(() => AddBloc(addUseCase: sl()));
  sl.registerFactory(
      () => HomeBloc(getHomeUseCase: sl(), putEditTaskUseCase: sl()));

  // use cases
  sl.registerLazySingleton(() => AddUseCase(homeRepositories: sl()));
  sl.registerLazySingleton(() => GetHomeUseCase(homeRepositories: sl()));
  sl.registerLazySingleton(() => PutEditTaskUseCase(homeRepositories: sl()));
  // repositories
  sl.registerLazySingleton<HomeRepositories>(
      () => HomeRepositoriesImpl(homeDataSource: sl(), networkInfo: sl()));
  // data source
  sl.registerLazySingleton<HomeDataSource>(() => HomeDataSourceImpl());
}
