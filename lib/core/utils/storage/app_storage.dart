import 'package:to_do_app/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class AppEndPoints {
  static String baseUrl = 'https://dummyjson.com/';
  static String loginEndPoint = 'auth/login';
  static String addTaskEndPoint = 'todos/add';
  static String getHomeEndPoint = 'todos/user/';
  static String editDeleteTaskEndPoint = 'todos/';
}

Map<String, String> headerGetWithToken = {
  "Accept": "application/json",
  "Content-Type": "application/json",
  'Authorization': 'Bearer ${AppStorage().getToken()}'
};
Map<String, String> headerGetWithOutToken = {
  "Accept": "application/json",
  "Content-Type": "application/json",
};
Map<String, String> headerPostWithToken = {
  "Accept": "application/json",
  'Authorization': 'Bearer ${AppStorage().getToken()}'
};
Map<String, String> headerPostWithOutToken = {
  "Accept": "application/json",
};

const String validationEmail =
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

class AppStorage {
  SharedPreferences sh = di.sl();

  /// here for  token
  Future<bool> setToken(String token) {
    return sh.setString('token', token);
  }

  String? getToken() {
    return sh.getString('token');
  }

  /// here for  userId
  Future<bool> setUserId(int userId) {
    return sh.setInt('user_id', userId);
  }

  int? getUserId() {
    return sh.getInt('user_id');
  }
}
