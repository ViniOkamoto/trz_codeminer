import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/main/domain/usecases/contact/manage_contact.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/usecases/people/report_user.dart';

part 'contact_store.g.dart';

class ContactStore = _ContactStoreBase with _$ContactStore;

abstract class _ContactStoreBase with Store {
  final IManageContact _contact = serviceLocator<IManageContact>();
  final IReportUser _reportUser = serviceLocator<IReportUser>();
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
    listUsers = ObservableList();
    _contact.getAllContact().then(
          (value) => value.forEach(
            (element) {
              listUsers.add(element);
            },
          ),
        );
  }

  @action
  Future<String> reportUser(String id, String infected) async {
    Response response = await _reportUser.reportUser(id, infected);
    if (response.statusCode == 204 || response.statusCode == 404) {
      await _contact.deleteContact(infected);
      listUsers.removeWhere((element) => element.id == infected);
      return "OK";
    }
    if (response.statusCode == 422) {
      await _contact.deleteContact(infected);
      listUsers.removeWhere((element) => element.id == infected);
      return "PAGES.MAIN.CONTACT.REPORT.ALREADY_REPORTED";
    }

    return "ERROR.ERROR_UNEXPECTED";
  }

  addContact(String user, String id) async {
    Map<String, dynamic> map = json.decode(user);
    if (map["id"] != id) {
      bool userExist = listUsers.any((element) => element.id == map["id"]);
      if (!userExist) {
        await _contact.saveContact(UserMapper.fromJson(map));
      }
    }
  }
}
