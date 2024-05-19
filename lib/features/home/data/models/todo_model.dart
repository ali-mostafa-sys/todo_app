import 'package:to_do_app/features/home/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
   TodoModel(
      {required super.todoId,
      required super.userId,
      required super.todo,
      required super.isDeleting,
      required super.isEditing,
      required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    final todoId = json['id'];
    final userId = json['userId'];
    final todo = json['todo'];
    final completed = json['completed'];
    return TodoModel(
        todoId: todoId,
        userId: userId,
        todo: todo,
        completed: completed,
        isDeleting: false,
        isEditing: false);
  }
}

class HomeResponseModel extends HomeResponseEntity {
  const HomeResponseModel(
      {required super.todoEntity, required super.total, required super.skip});

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    final listData = json['todos'] as List;
    final todoEntity = listData.map((e) => TodoModel.fromJson(e)).toList();
    final total = json['total'];
    final skip = json['skip'];
    return HomeResponseModel(todoEntity: todoEntity, total: total, skip: skip);
  }
}
