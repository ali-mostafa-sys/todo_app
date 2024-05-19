import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/home/home_export.dart';

abstract class HomeDataSource {
  Future<Unit> postAddTask(AddModel addModel);

  Future<HomeResponseModel> getHome(int skip);
  Future<Unit> putEdit(int taskId, bool delete);
}

class HomeDataSourceImpl extends HomeDataSource {
  /// here for add task
  @override
  Future<Unit> postAddTask(AddModel addModel) async {
    APIRequest request = APIRequest(
        endPoint: AppEndPoints.addTaskEndPoint,
        method: HTTPMethod.post,
        headers: headerPostWithOutToken,
        body: addModel.toJson());

    final response = await APIProvider().request(request: request, unit: true);

    return response;
  }

  @override
  Future<HomeResponseModel> getHome(int skip) async {
    APIRequest request = APIRequest(
        endPoint: '${AppEndPoints.getHomeEndPoint}${AppStorage().getUserId()}',
        method: HTTPMethod.get,
        headers: headerGetWithOutToken,
        query: {'limit': '4', 'skip': '$skip'});

    final response = await APIProvider().request(request: request, unit: false);
    final homeResponseModel = HomeResponseModel.fromJson(response);

    return homeResponseModel;
  }

  @override
  Future<Unit> putEdit(int taskId, bool delete) async {
    APIRequest requestEdit = APIRequest(
        endPoint: '${AppEndPoints.editDeleteTaskEndPoint}$taskId',
        method: HTTPMethod.put,
        headers: headerGetWithOutToken,
        body: {'completed': true});
    APIRequest requestDelete = APIRequest(
      endPoint: '${AppEndPoints.editDeleteTaskEndPoint}$taskId',
      method: HTTPMethod.delete,
      headers: headerGetWithOutToken,
    );

    final response = await APIProvider()
        .request(request: delete ? requestDelete : requestEdit, unit: true);

    return response;
  }
}
