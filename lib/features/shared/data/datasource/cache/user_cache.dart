import 'dart:convert';

import 'package:trzapp/core/utils/shared_prefs.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IUserCache {
  Future<bool> saveUser(User user);
  Future<User> getUser();
  Future<String> getId();
}

class UserCache implements IUserCache {
  @override
  Future<User> getUser() async {
    String userJson = await SharedPrefs.getString("user");
    if (userJson.isEmpty) {
      return null;
    }

    Map map = json.decode(userJson);

    return UserMapper.fromJson(map);
  }

  @override
  Future<bool> saveUser(User user) async {
    Map map = UserMapper.toJson(user);
    String userId = map["id"];
    print(userId);
    SharedPrefs.setString('userId', userId);
    SharedPrefs.setString("user", json.encode(map));

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
