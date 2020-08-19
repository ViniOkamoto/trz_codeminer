import 'package:trzapp/features/shared/domain/entities/user.dart';

class UserMapper {
  static User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      lonlat: json['lonlat'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      infected: json['infected'],
    );
  }

  static Map<String, dynamic> toJson(User user) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = user.id;
    data['name'] = user.name;
    data['age'] = user.age;
    data['gender'] = user.gender;
    data['lonlat'] = user.lonlat;
    data['created_at'] = user.createdAt;
    data['updated_at'] = user.updatedAt;
    data['infected'] = user.infected;
    return data;
  }
}
