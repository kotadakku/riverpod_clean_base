import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'database_config.dart';

class DatabaseHelper{


  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), DBConfig.DATABASE_NAME);
    return await openDatabase(path, onCreate: _onCreate,
        version: DBConfig.DATABASE_VERSION
    );
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    db.execute(''' CREATE TABLE ${DBConfig.TODO} (
            ${DBConfig.TODO_ID} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            ${DBConfig.TODO_TITLE} TEXT NOT NULL,
            ${DBConfig.TODO_DESCRIPTION} TEXT,
            ${DBConfig.TODO_IS_COMPLETE} INTEGER NOT NULL,
            ${DBConfig.TODO_DUO_DATE} TEXT NOT NULL
            
          )
    ''');

  }

  Future<int?> insert(String tableName, dynamic data) async {
    Database? db = await instance.database;
    var res = await db?.insert(tableName, data);
    return res;
  }

  Future<List<Map<String, dynamic>>?> findAll(String tableName, {String orderBy =  'id'}) async {
    Database? db = await instance.database;
    var res = await db?.query(tableName, orderBy: "$orderBy DESC");
    return res;
  }

  Future<void> deleteById(String tableName, final int id) async {
    Database? db = await instance.database;
    await db?.delete(
      tableName,
      where: '${DBConfig.TODO_ID} = $id'
    );
  }

  Future<void> deleteAll(String  tableName) async {
    Database? db = await instance.database;
    await db?.delete(tableName);
  }

  Future<bool> checkExists(tableName, final int id) async {
    Database? db = await instance.database;
    var res = await db?.query(
      tableName,
      where: '${DBConfig.TODO_ID} = $id');
    if(res != null){
      if(res.isNotEmpty) return true;
    }
    return false;
  }

  Future<void> update(String tableName, data) async{

    Database? db = await instance.database;
    final int id = data['id'];
    await db?.update(
      tableName,
      data,
      where: '${DBConfig.TODO_ID} = ?',
      whereArgs: [id],
    );
  }
}