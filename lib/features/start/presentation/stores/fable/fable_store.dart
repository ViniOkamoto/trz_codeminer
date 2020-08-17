import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'fable_store.g.dart';

class FableStore = _FableStoreBase with _$FableStore;

abstract class _FableStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);

  int indexViews;
  int _currentPage = 0;

  @observable
  int currentPage;
  @observable
  bool firstTextFinished = false;

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
      firstTextFinished = false;
      pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 850), curve: Curves.linearToEaseOut);
    }
    currentPage = _currentPage;
  }
}
