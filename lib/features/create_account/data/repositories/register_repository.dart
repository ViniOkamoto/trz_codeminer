import 'package:dio/dio.dart';
import 'package:trzapp/features/create_account/data/datasource/register_datasource.dart';
import 'package:trzapp/features/create_account/domain/i_repositories/i_register_repository.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

class RegisterRepository implements IRegisterRepository {
  final IRegisterDatasource _datasource;
  RegisterRepository(this._datasource);
  @override
  Future<Response> registerAccount(Person person) async {
    return await _datasource.registerAccount(person);
  }
}
