import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/data/datasource/remote/people/people_datasource.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';

class PeopleRepository implements IPeopleRepository {
  final IPeopleDatasource _datasource;
  PeopleRepository(this._datasource);

  @override
  Future<Response> getUserInfo(String id) async {
    return await _datasource.getUserInfo(id);
  }

  @override
  Future<Response> reportUser(String id, String infected) async {
    return await _datasource.reportUser(id, infected);
  }

  @override
  Future<Response> updateUser(User user) async {
    return await _datasource.updateUser(user);
  }
}
