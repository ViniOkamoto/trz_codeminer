import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  final String contactTable = "contactTable";
  final String idColumn = "id";
  final String nameColumn = "name";
  final String ageColumn = "age";
  final String genderColumn = "gender";
  final String lonlatColumn = "lonlat";
  final String infectedColumn = "infected";
  Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "contacts.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(
            "CREATE TABLE $contactTable($idColumn STRING PRIMARY KEY, $nameColumn TEXT, "
            "$ageColumn INTEGER, $genderColumn TEXT, $lonlatColumn TEXT, $infectedColumn INTEGER)");
      },
    );
  }

  close() async {
    Database db = await _db;
    await db.close();
  }
}
