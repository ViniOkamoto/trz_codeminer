import 'package:dio/src/response.dart';
import 'package:trzapp/features/create_account/data/datasource/people_datasource.dart';
import 'package:trzapp/features/create_account/domain/i_repositories/i_people_repository.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

class PeopleRepository implements IPeopleRepository {
  final IPeopleDatasource _datasource;
  PeopleRepository(this._datasource);
  @override
  Future<Response> registerAccount(Person person) async {
    return await _datasource.registerAccount(person);
  }
}
