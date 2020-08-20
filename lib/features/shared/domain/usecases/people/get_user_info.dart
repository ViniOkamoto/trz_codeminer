import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';

abstract class IGetUserInfo {
  Future<Response> getUserInfoUser(String id);
}

class GetUserInfo implements IGetUserInfo {
  final IPeopleRepository _repository;
  GetUserInfo(this._repository);

  @override
  Future<Response> getUserInfoUser(String id) async {
    return await _repository.getUserInfo(id);
  }
}
