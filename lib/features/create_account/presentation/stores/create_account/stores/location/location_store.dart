import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/create_account/presentation/stores/create_account/create_account_store.dart';
import 'package:trzapp/features/shared/domain/entities/location.dart';

part 'location_store.g.dart';

class LocationStore = _LocationStoreBase with _$LocationStore;

abstract class _LocationStoreBase with Store {
  final CreateAccountStore createAccountStore =
      serviceLocator<CreateAccountStore>();
  Location _location = Location();

  @action
  setLocation({longitude, latitude}) => _setLocation(longitude, latitude);

  _setLocation(longitude, latitude) {
    _location.longitude = longitude.toString();
    _location.latitude = latitude.toString();
    createAccountStore.person.lonlat = _location.toString();
  }

  @action
  setBtnValid() => createAccountStore.buttonIsValid = true;

  @observable
  bool firstTextFinished = false;
  @observable
  bool secondTextFinished = false;
}
