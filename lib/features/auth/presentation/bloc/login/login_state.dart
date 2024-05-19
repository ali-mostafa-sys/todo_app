part of 'login_bloc.dart';

enum Login { loading, loaded, error }

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class AllLoginState extends LoginState {
  final Login login;
  final String? error;

  const AllLoginState({required this.login, this.error});
  @override
  List<Object> get props => [login];
}
