import 'package:trzapp/features/shared/domain/entities/person.dart';

class PersonMapper {
  static Person fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      lonlat: json['lonlat'],
      items: json['items'],
    );
  }

  static Map<String, dynamic> toJson(Person person) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = person.name;
    data['age'] = person.age;
    data['gender'] = person.gender;
    data['lonlat'] = person.lonlat;
    data['items'] = person.items;
    return data;
  }
}
