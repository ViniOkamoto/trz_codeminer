import 'package:dio/dio.dart';

abstract class IPeopleRepository {
  Future<Response> getUserInfo(String id);
}
