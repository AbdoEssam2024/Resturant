import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDB {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initDb();
      print("Db Status null :=> $_db");
      return _db;
    } else {
      print("Db Status init :=> $_db");
      return _db;
    }
  }

  initDb() async {
    String dbPath = await getDatabasesPath();

    String dbName = join(dbPath, "resturant.db");

    Database myDb = await openDatabase(dbName,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
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

    print("Created");
  }

  _onUpgrade(Database db, int oldVersio, int newVersion) {}

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

  updateData(String table, Map<String, dynamic> data) async {
    Database? myDb = await db;
    late String col;
    late int val;
    data.forEach((column, value) {
      col = column;
      val = value;
    });
    String sql = """
    UPDATE $table SET $col = $val; 
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
