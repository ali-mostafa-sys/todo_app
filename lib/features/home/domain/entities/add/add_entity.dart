import 'package:equatable/equatable.dart';

class AddEntity extends Equatable {
  final String todo;
  final bool completed;
  final int userId;

  const AddEntity(
      {required this.todo, required this.completed, required this.userId});

  @override
  // TODO: implement props
  List<Object?> get props => [todo, completed, userId];
}
