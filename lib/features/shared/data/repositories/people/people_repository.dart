import 'package:dio/src/response.dart';
import 'package:trzapp/features/shared/data/datasource/local/people/people_datasource.dart';
import 'package:trzapp/features/shared/domain/i_repositories/people/i_people_repository.dart';

class PeopleRepository implements IPeopleRepository {
  final IPeopleDatasource _datasource;
  PeopleRepository(this._datasource);

  @override
  Future<Response> getUserInfo(String id) async {
    return await _datasource.getUserInfo(id);
  }
}
