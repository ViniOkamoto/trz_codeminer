import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';

part 'name_store.g.dart';

class NameStore = _NameStoreBase with _$NameStore;

abstract class _NameStoreBase with Store {
  final CreateAccountStore createAccountStore =
      serviceLocator<CreateAccountStore>();
  final TextEditingController nameController = TextEditingController();
  Timer _debounce;

  @observable
  String name;

  @observable
  String errorText;

  @action
  setName(value) => _setName(value);

  _debounceTiming(Function function) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), function);
  }

  _setName(value) {
    errorText = null;
    setBtnInvalid();
    _debounceTiming(
      () {
        name = value;
        errorText = _validateField();
        if (errorText == null) {
          setBtnValid();
        }
        createAccountStore.person.name = errorText != null ? null : value;
      },
    );
  }

  _validateField() {
    if (name.isEmpty) {
      return "PAGES.CREATE_ACCOUNT.NAME.ERROR_EMPTY";
    }
    if (name.length < 3) {
      return "PAGES.CREATE_ACCOUNT.NAME.ERROR_LENGTH";
    }
    return null;
  }

  @action
  setBtnValid() => createAccountStore.buttonIsValid = true;

  @action
  setBtnInvalid() => createAccountStore.buttonIsValid = false;

  @observable
  bool firstTextFinished = false;
}
