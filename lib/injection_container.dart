import 'package:to_do_app/export_main_app.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Features
  /// app
  AppInjection();

  /// auth
  authInjection();

  /// home
  homeInjection();

  /// core/////////////////////////////////
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///External//////////////////////////////////////////////////////////////////////
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
