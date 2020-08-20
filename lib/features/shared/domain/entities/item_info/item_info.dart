import 'package:trzapp/features/shared/domain/entities/item_info/item.dart';

class ItemInfo {
  String location;
  int quantity;
  String createdAt;
  String updatedAt;
  Item item;

  ItemInfo({
    this.location,
    this.quantity,
    this.createdAt,
    this.updatedAt,
    this.item,
  });

  int getPoint() {
    return item.points * quantity;
  }
}
