import 'package:dio/dio.dart';
import 'package:trzapp/core/utils/custom_dio/custom_dio.dart';

abstract class IPropertiesDatasource {
  Future<Response> getItemsUser(String id);
}

class PropertiesDatasource implements IPropertiesDatasource {
  CustomDio _dio = CustomDio(Dio());

  @override
  Future<Response> getItemsUser(String id) async {
    try {
      return await _dio.client.get("/api/people/$id/properties.json");
    } on DioError catch (e) {
      return e.response;
    }
  }
}
