import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IContactRepository {
  Future<User> saveContact(User user);
  Future<User> getContact(String id);
  Future<int> deleteContact(String id);
  Future<List<User>> getAllContact();
}
