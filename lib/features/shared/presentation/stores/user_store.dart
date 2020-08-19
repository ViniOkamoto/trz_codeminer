import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/usecases/user_auth.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IUserAuth _auth = serviceLocator<IUserAuth>();

  User user = User();
  String id;

  saveUser(User user) async {
    return await _auth.saveUser(user);
  }

  Future<User> getUser() async {
    user = await _auth.getUser();
    return user;
  }

  Future<String> getId() async {
    id = await _auth.getId();
    print(id);
    if (id != null) await getUser();
    return await _auth.getId();
  }
}
