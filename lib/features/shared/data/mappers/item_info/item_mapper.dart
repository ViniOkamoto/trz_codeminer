import 'package:trzapp/features/shared/domain/entities/item_info/item.dart';

class ItemMapper {
  static Item fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      points: json['points'],
    );
  }

  static Map<String, dynamic> toJson(Item item) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = item.name;
    data['points'] = item.points;
    return data;
  }
}
