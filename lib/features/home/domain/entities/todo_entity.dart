import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  final int todoId;
  final int userId;
  final String todo;
  bool completed;
  bool isEditing;
  bool isDeleting;

  TodoEntity({
    required this.todoId,
    required this.userId,
    required this.todo,
    required this.completed,
    required this.isDeleting,
    required this.isEditing,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [todoId, userId, todo, completed, isDeleting, isEditing];
}

class HomeResponseEntity extends Equatable {
  final List<TodoEntity> todoEntity;
  final int total;
  final int skip;

  const HomeResponseEntity(
      {required this.todoEntity, required this.total, required this.skip});
  @override
  // TODO: implement props
  List<Object?> get props => [todoEntity, total, skip];
}
