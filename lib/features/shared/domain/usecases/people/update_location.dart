import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';

abstract class IUpdateLocation {
  Future<Response> updateUser(User user);
}

class UpdateLocation implements IUpdateLocation {
  final IPeopleRepository _repository;
  UpdateLocation(this._repository);

  @override
  Future<Response> updateUser(User user) async {
    return await _repository.updateUser(user);
  }
}
