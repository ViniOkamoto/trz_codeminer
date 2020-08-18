import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';

part 'gender_store.g.dart';

class GenderStore = _GenderStoreBase with _$GenderStore;

abstract class _GenderStoreBase with Store {
  final CreateAccountStore createAccountStore =
      serviceLocator<CreateAccountStore>();
  @observable
  String gender;
  @action
  setGender(value) {
    gender = value;
    createAccountStore.person.gender = value;
    setBtnValid();
  }

  @action
  setBtnValid() => createAccountStore.buttonIsValid = true;

  @observable
  bool firstTextFinished = false;
  @observable
  bool secondTextFinished = false;
}
