import 'package:trzapp/features/main/data/datasource/local/contact/contact_datasource.dart';
import 'package:trzapp/features/main/domain/i_repositories/contact/i_contact_repository.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

class ContactRepository implements IContactRepository {
  final IContactDatasource _datasource;
  ContactRepository(this._datasource);

  @override
  Future<int> deleteContact(String id) async {
    return await _datasource.deleteContact(id);
  }

  @override
  Future<List<User>> getAllContact() async {
    return await _datasource.getAllContact();
  }

  @override
  Future<User> getContact(String id) async {
    return await _datasource.getContact(id);
  }

  @override
  Future<User> saveContact(User user) async {
    return await _datasource.saveContact(user);
  }
}
