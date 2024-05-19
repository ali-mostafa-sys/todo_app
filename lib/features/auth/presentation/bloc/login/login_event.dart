part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class PostLoginEvent extends LoginEvent {
  final LoginPostEntity loginPostEntity;

  const PostLoginEvent({required this.loginPostEntity});
  @override
  List<Object> get props => [loginPostEntity];
}
