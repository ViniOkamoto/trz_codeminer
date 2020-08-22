import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/domain/usecases/register_account.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/usecases/users/user_auth.dart';

part 'create_account_store.g.dart';

class CreateAccountStore = _CreateAccountStoreBase with _$CreateAccountStore;

abstract class _CreateAccountStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);
  final IUserAuth _auth = serviceLocator<IUserAuth>();
  final IRegisterAccount _register = serviceLocator<IRegisterAccount>();

  @observable
  Person person = Person();

  int indexViews;
  int _currentPage = 0;

  @observable
  int currentPage;
  @observable
  bool firstTextFinished = false;
  @observable
  bool secondTextFinished = false;

  @computed
  bool get enabledButton => buttonIsValid;

  @observable
  bool buttonIsValid = false;

  Future<String> registerUser() async {
    try {
      Response response = await _register.registerAccount(person);
      if (response.statusCode == 201 || response.statusCode == 200) {
        User user = UserMapper.fromJson(response.data);
        await _auth.saveUser(user);

        return "OK";
      }
      return "PAGES.CREATE_ACCOUNT.ERROR_NAME";
    } catch (e) {
      return "ERROR_UNEXPECTED";
    }
  }

  @action
  void nextView() {
    _currentPage = pageController.page.round() + 1;
    if (_currentPage == indexViews) {
      _currentPage = indexViews - 1;
    } else {
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    }
    currentPage = _currentPage;
    _checkPageIsValid();
  }

  @action
  void backPage() {
    _currentPage = pageController.page.round() - 1;
    if (_currentPage <= 0) {
      _currentPage = 0;
    }
    if (_currentPage >= 0 && pageController.page != _currentPage)
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    currentPage = _currentPage;
    _checkPageIsValid();
  }

  _checkPageIsValid() {
    switch (currentPage) {
      case 0:
        buttonIsValid = true;
        return;
      case 1:
        buttonIsValid = person.name != null ? true : false;
        return;
      case 2:
        buttonIsValid = person.age != null ? true : false;
        return;
      case 3:
        buttonIsValid = person.lonlat != null ? true : false;
        return;
      case 4:
        buttonIsValid = person.items != null ? true : false;
        return;
    }
  }
}
