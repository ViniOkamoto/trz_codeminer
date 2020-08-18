import 'package:trzapp/features/shared/domain/entities/person.dart';

class PersonMapper {
  Person fromJson(Map<String, dynamic> json) {
    return Person(
        name: json['name'],
        age: json['age'],
        gender: json['gender'],
        lonlat: json['lonlat']);
  }

  Map<String, dynamic> toJson(Person person) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = person.name;
    data['age'] = person.age;
    data['gender'] = person.gender;
    data['lonlat'] = person.lonlat;
    return data;
  }
}
