import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IUserRepository {
  Future<bool> saveUser(User user);
  Future<User> getUser();
  Future<String> getId();
}
