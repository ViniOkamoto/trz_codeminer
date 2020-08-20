import 'package:dio/dio.dart';

abstract class IPropertiesRepository {
  Future<Response> getItemsUser(String id);
}
