import 'package:to_do_app/core/errors/failures.dart';

class FailuresMessage {
  String mapFailureToMessage(failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'There was an error, please try again later.';
      case OfflineFailure:
        return 'Please check your internet connection';
      case TimeOutFailure:
        return 'Time out Please try again .';
      case InvalidCredentialsFailure:
        return 'The username or password is incorrect. Please try with correct information.';

      default:
        return " Unexpected error,Please try again later.";
    }
  }
}
