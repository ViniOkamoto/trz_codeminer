import 'package:dio/dio.dart';
import 'package:trzapp/core/utils/custom_dio/custom_dio.dart';

abstract class IPeopleDatasource {
  Future<Response> getUserInfo(String id);
}

class PeopleDatasource implements IPeopleDatasource {
  CustomDio _dio = CustomDio(Dio());

  @override
  Future<Response> getUserInfo(String id) async {
    try {
      return await _dio.client.get("/api/people/$id.json");
    } on DioError catch (e) {
      return e.response;
    }
  }
}
