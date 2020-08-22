import 'package:dio/dio.dart';

abstract class IReportRepository {
  Future<Response> getInfected();
  Future<Response> getNonInfected();
}
