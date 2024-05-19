part of 'home_bloc.dart';

enum Home {
  loading,
  loaded,
  error,
  loadingEdit,
  loadingPagination,
  loadingPage,
  errorDeleteOrEdit
}

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class AllHomeState extends HomeState {
  final Home home;
  final String? error;

  const AllHomeState({required this.home, this.error});

  @override
  List<Object> get props => [home];
}
