part of 'add_bloc.dart';

enum Add { loading, loaded, error }

abstract class AddState extends Equatable {
  const AddState();
  @override
  List<Object> get props => [];
}

class AddInitial extends AddState {
  @override
  List<Object> get props => [];
}

class AllAddState extends AddState {
  final Add add;
  final String? error;

  const AllAddState({required this.add, this.error});
  @override
  List<Object> get props => [add];
}
