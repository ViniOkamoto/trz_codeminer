import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/main/domain/usecases/contact/manage_contact.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

part 'contact_store.g.dart';

class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {
  final IManageContact _contact = serviceLocator<IManageContact>();

  @observable
  User user = User();

  ObservableList<User> listUsers = ObservableList<User>();

  int indexViews;
  int currentPage = 0;

  @observable
  bool inventoryIsOpen = false;

  @action
  setInventoryIsOpen() => inventoryIsOpen = inventoryIsOpen ? false : true;

  @action
  getAllContacts() async {
    listUsers = ObservableList<User>();
    _contact.getAllContact().then(
          (value) => value.forEach(
            (element) {
              listUsers.add(element);
            },
          ),
        );
  }

  addContact(String user) async {
    Map<String, dynamic> map = json.decode(user);
    print(map);
    await _contact.saveContact(UserMapper.fromJson(map));
  }
}
