part of 'add_bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();
  @override
  List<Object> get props => [];
}

class PostAddEvent extends AddEvent {
  final AddEntity addEntity;

 const  PostAddEvent({required this.addEntity});
  @override
  List<Object> get props => [addEntity];
}
