import 'package:trzapp/core/utils/shared_prefs.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IUserCache {
  Future<bool> saveUser(User user);
  Future<String> getId();
}

class UserCache implements IUserCache {
  @override
  Future<bool> saveUser(User user) async {
    Map map = UserMapper.toJson(user);
    String userId = map["id"];
    SharedPrefs.setString('userId', userId);

    return true;
  }

  @override
  Future<String> getId() async {
    String userId = await SharedPrefs.getString("userId");
    if (userId.isEmpty) {
      return null;
    }

    return userId;
  }
}
