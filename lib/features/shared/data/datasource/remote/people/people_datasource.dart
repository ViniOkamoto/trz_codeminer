import 'package:dio/dio.dart';
import 'package:trzapp/core/utils/custom_dio/custom_dio.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IPeopleDatasource {
  Future<Response> getUserInfo(String id);
  Future<Response> reportUser(String id, String infected);
  Future<Response> updateUser(User user);
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

  @override
  Future<Response> reportUser(String id, String infected) async {
    try {
      return await _dio.client.post(
        "/api/people/$id/report_infection.json",
        data: {"infected": infected},
      );
    } on DioError catch (e) {
      return e.response;
    }
  }

  @override
  Future<Response> updateUser(User user) async {
    try {
      return await _dio.client.patch(
        "/api/people/${user.id}.json",
        data: UserMapper.toJson(user),
      );
    } on DioError catch (e) {
      return e.response;
    }
  }
}
