import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

part 'create_account_store.g.dart';

class CreateAccountStore = _CreateAccountStoreBase with _$CreateAccountStore;

abstract class _CreateAccountStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);

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

  @action
  void nextView() {
    _currentPage = pageController.page.round() + 1;
    if (_currentPage == indexViews) {
      _currentPage = indexViews - 1;
    } else {
      buttonIsValid = false;
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    }
    currentPage = _currentPage;
  }

  @action
  void backPage() {
    _currentPage = pageController.page.round() - 1;
    if (_currentPage <= 0) {
      _currentPage = 0;
    }
    buttonIsValid = true;
    if (_currentPage >= 0 && pageController.page != _currentPage)
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    currentPage = _currentPage;
  }
}
