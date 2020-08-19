import 'package:dio/dio.dart';
import 'package:trzapp/features/create_account/domain/i_repositories/i_people_repository.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

abstract class IRegisterAccount {
  Future<Response> registerAccount(Person person);
}

class RegisterAccount implements IRegisterAccount {
  final IPeopleRepository _repository;
  RegisterAccount(this._repository);

  @override
  Future<Response> registerAccount(Person person) async {
    return await _repository.registerAccount(person);
  }
}
