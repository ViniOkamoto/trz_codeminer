import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/shared/domain/entities/package.dart';

part 'packages_store.g.dart';

class PackagesStore = _PackagesStoreBase with _$PackagesStore;

abstract class _PackagesStoreBase with Store {
  final CreateAccountStore createAccountStore =
      serviceLocator<CreateAccountStore>();

  Package _package = Package();
  @observable
  int package;
  @action
  setPackages(value) => _setPackage(value);

  _setPackage(value) {
    package = value;
    createAccountStore.person.items = _fillPackage(value);
  }

  String _fillPackage(value) {
    switch (value) {
      case 1:
        _package.fijiWater = 1;
        _package.campBell = 1;
        _package.firstAid = 1;
        _package.ak47 = 6;
        return _package.toString();
      case 2:
        _package.fijiWater = 1;
        _package.campBell = 1;
        _package.firstAid = 5;
        _package.ak47 = 1;
        return _package.toString();
      case 3:
        _package.fijiWater = 2;
        _package.campBell = 4;
        _package.firstAid = 0;
        _package.ak47 = 1;
        return _package.toString();
      default:
        return null;
    }
  }

  @action
  setBtnValid() => createAccountStore.buttonIsValid = true;

  @observable
  bool firstTextFinished = false;
  @observable
  bool secondTextFinished = false;
}
