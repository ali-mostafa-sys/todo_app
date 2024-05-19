import 'package:to_do_app/features/auth/login_export.dart';

abstract class AuthDataSource {
  Future<LoginResponseModel> postLogin(LoginPostModel loginPostModel);
}

class AuthDataSourceImpl extends AuthDataSource {
  @override
  Future<LoginResponseModel> postLogin(LoginPostModel loginPostModel) async {
    APIRequest request = APIRequest(
        endPoint: AppEndPoints.loginEndPoint,
        method: HTTPMethod.post,
        headers: headerPostWithOutToken,
        body: loginPostModel.toJson());

    final response = await APIProvider().request(request: request, unit: false);
    final loginResponseModel = LoginResponseModel.fromJson(response);

    return loginResponseModel;
  }
}
