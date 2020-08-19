import 'package:dio/dio.dart';
import 'package:trzapp/core/utils/custom_dio/custom_dio.dart';
import 'package:trzapp/features/shared/data/mappers/person_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

abstract class IPeopleDatasource {
  Future<Response> registerAccount(Person person);
}

class PeopleDatasource implements IPeopleDatasource {
  CustomDio _dio = CustomDio(Dio());

  @override
  Future<Response> registerAccount(Person person) async {
    try {
      return await _dio.client
          .post("/api/people.json", data: PersonMapper.toJson(person));
    } on DioError catch (e) {
      return e.response;
    }
  }
}
