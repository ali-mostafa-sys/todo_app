import '../../../home_export.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static HomeBloc get(context) => BlocProvider.of(context);
  final GetHomeUseCase getHomeUseCase;
  final PutEditTaskUseCase putEditTaskUseCase;
  List<TodoEntity> todoList = [];
  ScrollController scrollController = ScrollController();
  int total = 0;
  bool isLoading = false;

  void loadMoreData() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        todoList.length < total) {
      getHomeData();
    }
  }

  Future<void> getHomeData() async {
    if (todoList.isEmpty) {
      emit(const AllHomeState(home: Home.loading));
    } else {
      emit(const AllHomeState(home: Home.loadingPagination));
    }
    isLoading = true;

    final failureOrResponse = await getHomeUseCase.call(todoList.length);
    failureOrResponse.fold((failure) {
      emit(AllHomeState(
          home: Home.error,
          error: FailuresMessage().mapFailureToMessage(failure)));
      printWarning(failure.toString());
    }, (response) {
      //todoList = response.todoEntity;
      total = response.total;
      todoList.addAll(response.todoEntity);

      printGreen(response.toString());
      isLoading = false;

      emit(const AllHomeState(home: Home.loaded));
    });
  }

  HomeBloc({required this.getHomeUseCase, required this.putEditTaskUseCase})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is PaginationInitEvent) {
        scrollController.addListener(loadMoreData);
      }

      /// here get home data event /////////////////////////////
      if (event is GetHomeEvent) {
        getHomeData();
      }

      /// here edit and delete task event ////////////////////////////////
      if (event is EditTaskEvent) {
        todoList[event.index].isDeleting = event.delete ? true : false;
        todoList[event.index].isEditing = event.delete ? false : true;
        emit(const AllHomeState(home: Home.loadingEdit));

        final failureOrResponse = await putEditTaskUseCase.call(
            event.todoEntity.todoId, event.delete);
        failureOrResponse.fold((failure) {
          emit(AllHomeState(
              home: Home.errorDeleteOrEdit,
              error: FailuresMessage().mapFailureToMessage(failure)));
        }, (response) {
          todoList[event.index].isEditing = false;
          todoList[event.index].completed =
              event.delete ? todoList[event.index].completed : true;
          if (event.delete) {
            if (todoList.contains(event.todoEntity)) {
              todoList.remove(event.todoEntity);
            }
            // todoList.wh
          }
          emit(const AllHomeState(home: Home.loaded));
        });
      }
    });
  }
}
