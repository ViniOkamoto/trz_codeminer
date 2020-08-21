import 'package:sqflite/sqflite.dart';
import 'package:trzapp/core/utils/db/db_helper.dart';
import 'package:trzapp/features/shared/data/mappers/user_mapper.dart';
import 'package:trzapp/features/shared/domain/entities/user.dart';

abstract class IContactDatasource {
  Future<User> saveContact(User user);
  Future<User> getContact(String id);
  Future<int> deleteContact(String id);
  Future<List<User>> getAllContact();
}

class ContactDatasource implements IContactDatasource {
  final DBHelper _dbHelper = DBHelper();

  @override
  Future<User> saveContact(User user) async {
    Database db = await _dbHelper.db;
    user.id = await db
        .insert(_dbHelper.contactTable, UserMapper.toJson(user))
        .then((value) => value.toString());
    return user;
  }

  @override
  Future<User> getContact(String id) async {
    Database db = await _dbHelper.db;
    List<Map> users = await db.query(
      _dbHelper.contactTable,
      columns: [
        _dbHelper.idColumn,
        _dbHelper.nameColumn,
        _dbHelper.ageColumn,
        _dbHelper.genderColumn,
        _dbHelper.lonlatColumn,
        _dbHelper.infectedColumn
      ],
      where: "${_dbHelper.idColumn} = ?",
      whereArgs: [id],
    );
    if (users.length > 0) {
      return UserMapper.fromJson(users.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(String id) async {
    Database db = await _dbHelper.db;
    return await db.delete(
      _dbHelper.contactTable,
      where: "${_dbHelper.idColumn} = ?",
      whereArgs: [id],
    );
  }

  Future<List<User>> getAllContact() async {
    Database db = await _dbHelper.db;
    List listMaps =
        await db.rawQuery("SELECT * FROM ${_dbHelper.contactTable}");
    List<User> listUsers = List();
    for (Map map in listMaps) {
      listUsers.add(
        UserMapper.fromJson(map),
      );
    }
    return listUsers;
  }
}
