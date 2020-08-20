import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/features/shared/domain/entities/person.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);

  @observable
  Person person = Person();

  int indexViews;
  int _currentPage = 0;

  @observable
  bool inventoryIsOpen = false;

  @action
  setInventoryIsOpen() => inventoryIsOpen = inventoryIsOpen ? false : true;

  @action
  void selectView(value) {
    _currentPage = value;
    if (_currentPage == indexViews) {
      _currentPage = indexViews - 1;
    } else {
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    }
  }
}
