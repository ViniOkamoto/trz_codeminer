import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:trzapp/core/di/service_locator.dart';
import 'package:trzapp/features/shared/data/mappers/item_info/item_info_mapper.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/item_info/item_info.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';
import 'package:trzapp/features/shared/domain/usecases/people/get_user_info.dart';
import 'package:trzapp/features/shared/domain/usecases/properties/get_items.dart';
import 'package:trzapp/features/shared/domain/usecases/users/user_auth.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  final IUserAuth _auth = serviceLocator<IUserAuth>();
  final IGetItems _items = serviceLocator<IGetItems>();
  final IGetUserInfo _userInfo = serviceLocator<IGetUserInfo>();

  @observable
  User user = User();

  ObservableList<ItemInfo> _list = ObservableList<ItemInfo>();
  @observable
  int points = 0;
  @observable
  int fiji = 0;
  @observable
  int camp = 0;
  @observable
  int medkit = 0;
  @observable
  int ak = 0;

  String id;

  saveUser(User user) async {
    this.user = user;
    await getItems();
    return await _auth.saveUser(user);
  }

  Future<String> getId() async {
    id = await _auth.getId();
    return await _auth.getId();
  }

  Future<String> getUserInfo() async {
    Response response = await _userInfo.getUserInfoUser(id);
    if (response.statusCode == 200) {
      user = UserMapper.fromJson(response.data);
      if (user.infected) return "INFECTED";
      await getItems();
      return null;
    }
    return "NOT FOUND";
  }

  @action
  Future<String> getItems() async {
    Response response = await _items.getItemsUser(id);
    points = 0;
    if (response.statusCode == 200) {
      for (var json in response.data) {
        ItemInfo itemInfo = ItemInfoMapper.fromJson(json);
        switch (itemInfo.item.name) {
          case "Fiji Water":
            fiji = itemInfo.quantity;
            break;
          case "Campbell Soup":
            camp = itemInfo.quantity;
            break;
          case "First Aid Pouch":
            medkit = itemInfo.quantity;
            break;
          case "AK47":
            ak = itemInfo.quantity;
            break;
        }
        points += itemInfo.getPoint();
        _list.add(itemInfo);
      }
      return null;
    }
  }
}
