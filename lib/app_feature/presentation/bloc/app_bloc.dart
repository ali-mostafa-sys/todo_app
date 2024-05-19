import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  static AppBloc get(context) => BlocProvider.of(context);

  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
