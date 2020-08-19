import 'package:dio/dio.dart';

class CustomDio {
  final Dio client;
  CustomDio(this.client) {
    client.options.baseUrl = "http://zssn-backend-example.herokuapp.com";
    client.options.connectTimeout = 5000;
  }
}
