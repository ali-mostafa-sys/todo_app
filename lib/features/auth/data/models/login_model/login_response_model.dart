import 'dart:convert';

import 'package:to_do_app/features/auth/domain/entities/login_entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel(
      {required super.userId,
      required super.userName,
      required super.userEmail,
      required super.userFirstName,
      required super.userLastName,
      required super.userGender,
      required super.userImage,
      required super.token});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    final userId = json['id'];
    final userName = json['username'];
    final userEmail = json['email'];
    final userFirstName = json['firstName'];
    final userLastName = json['lastName'];
    final userGender = json['gender'];
    final userImage = json['image'];
    final token = json['token'];
    return LoginResponseModel(
        userId: userId,
        userName: userName,
        userEmail: userEmail,
        userFirstName: userFirstName,
        userLastName: userLastName,
        userGender: userGender,
        userImage: userImage,
        token: token);
  }
}
