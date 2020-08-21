import 'package:trzapp/features/main/domain/i_repositories/contact/i_contact_repository.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IManageContact {
  Future<User> saveContact(User user);
  Future<User> getContact(String id);
  Future<int> deleteContact(String id);
  Future<List<User>> getAllContact();
}

class ManageContact implements IManageContact {
  final IContactRepository _repository;
  ManageContact(this._repository);

  @override
  Future<int> deleteContact(String id) async {
    return await _repository.deleteContact(id);
  }

  @override
  Future<List<User>> getAllContact() async {
    return await _repository.getAllContact();
  }

  @override
  Future<User> getContact(String id) async {
    return await _repository.getContact(id);
  }

  @override
  Future<User> saveContact(User user) async {
    return await _repository.saveContact(user);
  }
}
