import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/errors/failure_messages.dart';
import 'package:to_do_app/features/home/domain/entities/add/add_entity.dart';
import 'package:to_do_app/features/home/domain/use_cases/add_use_case.dart';

part 'add_event.dart';
part 'add_state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  static AddBloc get(context) => BlocProvider.of(context);
  TextEditingController task = TextEditingController();
  var addFormKey = GlobalKey<FormState>();

  @override
  Future<void> close() {
    // TODO: implement close
    task.clear();

    return super.close();
  }

  final AddUseCase addUseCase;

  AddBloc({required this.addUseCase}) : super(AddInitial()) {
    on<AddEvent>((event, emit) async {
      if (event is PostAddEvent) {
        emit(const AllAddState(
          add: Add.loading,
        ));
        final failureOrResponse = await addUseCase.call(event.addEntity);

        failureOrResponse.fold((failure) {
          emit(AllAddState(
              add: Add.error,
              error: FailuresMessage().mapFailureToMessage(failure)));
        }, (response) {
          emit(const AllAddState(
            add: Add.loaded,
          ));
        });
      }
    });
  }
}
