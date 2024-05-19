import 'package:to_do_app/features/auth/login_export.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  static LoginBloc get(context) => BlocProvider.of(context);
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  var loginFormKey = GlobalKey<FormState>();

  final LoginUseCase loginUseCase;

  @override
  Future<void> close() {
    // TODO: implement close
    userName.clear();
    password.clear();

    return super.close();
  }

  LoginBloc({required this.loginUseCase}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is PostLoginEvent) {
        emit(const AllLoginState(login: Login.loading));

        final failureOrResponse =
            await loginUseCase.call(event.loginPostEntity);
        failureOrResponse.fold((failure) {
          emit(AllLoginState(
              login: Login.error,
              error: FailuresMessage().mapFailureToMessage(failure)));
        }, (response) {
          AppStorage().setToken(response.token);
          AppStorage().setUserId(response.userId);

          emit(const AllLoginState(login: Login.loaded));
        });
      }
    });
  }
}
