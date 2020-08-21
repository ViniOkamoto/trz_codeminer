import 'package:dio/dio.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IPeopleRepository {
  Future<Response> getUserInfo(String id);
  Future<Response> reportUser(String id, String infected);
  Future<Response> updateUser(User user);
}
