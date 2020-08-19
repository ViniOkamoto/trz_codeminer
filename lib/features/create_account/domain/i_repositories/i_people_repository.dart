import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

abstract class IPeopleRepository {
  Future<Response> registerAccount(Person person);
}
