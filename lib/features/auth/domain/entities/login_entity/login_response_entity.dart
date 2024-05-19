import 'package:equatable/equatable.dart';

class LoginResponseEntity extends Equatable {
  final int userId;
  final String userName;
  final String userEmail;
  final String userFirstName;
  final String userLastName;
  final String userGender;
  final String userImage;
  final String token;

  const LoginResponseEntity(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.userFirstName,
      required this.userLastName,
      required this.userGender,
      required this.userImage,
      required this.token});

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        userName,
        userEmail,
        userFirstName,
        userLastName,
        userGender,
        userImage,
        token
      ];
}
