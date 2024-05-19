import 'package:equatable/equatable.dart';

class LoginPostEntity extends Equatable {
  final String userName;
  final String password;

  const LoginPostEntity({required this.userName, required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [userName, password];
}
