import 'package:trzapp/features/shared/data/datasource/cache/user_cache.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/i_repositories/user/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final IUserCache _cache;
  UserRepository(this._cache);

  @override
  Future<String> getId() async {
    return await _cache.getId();
  }

  @override
  Future<bool> saveUser(User user) async {
    return await _cache.saveUser(user);
  }
}
