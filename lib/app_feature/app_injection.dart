import 'package:to_do_app/app_feature/presentation/bloc/app_bloc.dart';
import 'package:to_do_app/injection_container.dart';

Future<void> AppInjection() async {
  sl.registerFactory(() => AppBloc());
}
