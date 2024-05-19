import 'package:to_do_app/features/home/domain/entities/add/add_entity.dart';

class AddModel extends AddEntity {
  const AddModel(
      {required super.todo, required super.completed, required super.userId});

  Map<String, dynamic> toJson() {
    return {'todo': todo, 'completed': completed, 'userId': userId};
  }
}
