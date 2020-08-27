import 'package:dio/dio.dart';
import 'package:trzapp/core/utils/custom_dio/custom_dio.dart';

abstract class IReportDatasource {
  Future<Response> getInfected();
  Future<Response> getNonInfected();
}

class ReportDatasource implements IReportDatasource {
  CustomDio _dio = CustomDio(Dio());

  @override
  Future<Response> getInfected() async {
    try {
      return await _dio.client.get("/api/report/infected.json");
    } on DioError catch (e) {
      return e.response;
    }
  }

  @override
  Future<Response> getNonInfected() async {
    try {
      return await _dio.client.get("/api/report/non_infected.json");
    } on DioError catch (e) {
      return e.response;
    }
  }
}
