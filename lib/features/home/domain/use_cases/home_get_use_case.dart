import 'package:dartz/dartz.dart';
import 'package:to_do_app/features/home/home_export.dart';


class GetHomeUseCase {
  final HomeRepositories homeRepositories;

  GetHomeUseCase({required this.homeRepositories});
  Future<Either<Failure, HomeResponseEntity>> call(int skip) async {
    return await homeRepositories.getHome(skip);
  }
}
