import 'package:to_do_app/features/auth/domain/entities/login_entity/login_post_entity.dart';

class LoginPostModel extends LoginPostEntity {
  const LoginPostModel({required super.userName, required super.password});

  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
}
