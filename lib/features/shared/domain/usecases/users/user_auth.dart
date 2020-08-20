import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/i_repositories/user/i_user_repository.dart';

abstract class IUserAuth {
  Future<bool> saveUser(User user);
  Future<String> getId();
}

class UserAuth implements IUserAuth {
  final IUserRepository _repository;
  UserAuth(this._repository);

  @override
  Future<String> getId() async {
    return await _repository.getId();
  }

  @override
  Future<bool> saveUser(User user) async {
    return await _repository.saveUser(user);
  }
}
