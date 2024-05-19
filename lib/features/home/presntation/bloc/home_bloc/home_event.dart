part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class GetHomeEvent extends HomeEvent {
  final int? skip;

  const GetHomeEvent({this.skip});

  @override
  List<Object> get props => [];
}

class EditTaskEvent extends HomeEvent {
  final int index;
  final TodoEntity todoEntity;
  final bool delete;

  const EditTaskEvent(
      {required this.index, required this.todoEntity, required this.delete});

  @override
  List<Object> get props => [index, todoEntity, delete];
}

class PaginationInitEvent extends HomeEvent {

  @override
  List<Object> get props => [];
}
