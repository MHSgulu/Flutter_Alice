import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class DataBaseUtil{

  //SQLite有一个sqlite_master存储模式信息的表
  //检查表是否存在
  static Future<bool> tableExists(DatabaseExecutor db, String table) async {
    var count = firstIntValue(await db.query('sqlite_master',
        columns: ['COUNT(*)'],
        where: 'type = ? AND name = ?',
        whereArgs: ['table', table]));
    return count > 0;
  }

  //检查表是否存在
  static Future<bool> checkTableExists(String path) async {
    //var factory = databaseFactory;
    //var isExists = await factory.databaseExists(path);
    //return isExists;
    return await databaseFactory.databaseExists(path);
  }

}