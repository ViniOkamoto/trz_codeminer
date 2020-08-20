import 'package:trzapp/features/shared/data/mappers/item_info/item_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/item_info/item_info.dart';

class ItemInfoMapper {
  static ItemInfo fromJson(Map<String, dynamic> json) {
    return ItemInfo(
      location: json['location'],
      quantity: json['quantity'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      item: json['item'] != null ? ItemMapper.fromJson(json['item']) : null,
    );
  }

  static Map<String, dynamic> toJson(ItemInfo itemInfo) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location'] = itemInfo.location;
    data['quantity'] = itemInfo.quantity;
    data['created_at'] = itemInfo.createdAt;
    data['updated_at'] = itemInfo.updatedAt;
    if (itemInfo.item != null) {
      data['item'] = ItemMapper.toJson(itemInfo.item);
    }
    return data;
  }
}
