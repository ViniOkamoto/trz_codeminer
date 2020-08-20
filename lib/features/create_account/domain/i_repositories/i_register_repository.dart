import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

abstract class IRegisterRepository {
  Future<Response> registerAccount(Person person);
}
