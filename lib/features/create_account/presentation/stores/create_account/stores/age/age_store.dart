import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';

part 'age_store.g.dart';

class AgeStore = _AgeStoreBase with _$AgeStore;

abstract class _AgeStoreBase with Store {
  final CreateAccountStore createAccountStore =
      serviceLocator<CreateAccountStore>();
  final TextEditingController nameController = TextEditingController();
  Timer _debounce;

  @observable
  String age;

  @observable
  String errorText;

  @action
  setAge(value) => _setAge(value);

  _debounceTiming(Function function) {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), function);
  }

  _setAge(value) {
    errorText = null;
    setBtnInvalid();
    _debounceTiming(
      () {
        age = value;
        errorText = _validateField();
        if (errorText == null) {
          setBtnValid();
        }
        createAccountStore.person.age =
            errorText != null ? null : int.parse(value);
      },
    );
  }

  _validateField() {
    if (age.isEmpty) {
      return "PAGES.CREATE_ACCOUNT.AGE.ERROR_EMPTY";
    }
    if (int.parse(age) < 10) {
      return "PAGES.CREATE_ACCOUNT.AGE.ERROR_AGE";
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
