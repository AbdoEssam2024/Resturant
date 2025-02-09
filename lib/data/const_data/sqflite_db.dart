import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      return _db;
    } else {
      return _db;
    }
  }

  initDb() async {
    String dbPath = await getDatabasesPath();

    String dbName = join(dbPath, "resturant.db");

    Database myDb = await openDatabase(dbName,
        onCreate: _onCreate, version: 3, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onCreate(Database db, int version) async {
    String sql = """CREATE TABLE "notification_settings"
      (
      "user_id" INTEGER NOT NULL,
      "general_settings" INTEGER NOT NULL DEFAULT 1,
      "sound" INTEGER NOT NULL DEFAULT 0,
      "sound_call" INTEGER NOT NULL DEFAULT 0,
      "vibrate" INTEGER NOT NULL DEFAULT 1,
      "special_offers" INTEGER NOT NULL DEFAULT 1,
      "payment" INTEGER NOT NULL DEFAULT 1,
      "discount" INTEGER NOT NULL DEFAULT 1,
      "cashBack" INTEGER NOT NULL DEFAULT 0
    );""";
    await db.execute(sql);
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      String sql = """CREATE TABLE 'user_data'
      (
      'user_id' INTEGER NOT NULL,
      'user_name' TEXT NOT NULL,
      'user_email' TEXT NOT NULL,
      'user_birthdate' TEXT,
      'user_phone' INTEGER
    )""";
      await db.execute(sql);
    }
  }

  getData(int userId, String table, String where) async {
    Database? myDb = await db;
    String sql = "SELECT * FROM '$table' WHERE $where;";
    List<Map<String, dynamic>> response = await myDb!.rawQuery(sql);
    return response;
  }

  insertData(
      {required String table,
      required String columns,
      required String values}) async {
    Database? myDb = await db;
    String sql = "INSERT INTO $table ($columns) VALUES ($values)";
    int response = await myDb!.rawInsert(sql);
    return response;
  }

  updateData(
      {required String table,
      required String data,
      required String where}) async {
    Database? myDb = await db;
    String sql = """
    UPDATE $table SET $data WHERE $where; 
    """;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sqlQuery) async {
    Database? myDb = await db;
    int response = await myDb!.rawDelete(sqlQuery);
    return response;
  }
}
