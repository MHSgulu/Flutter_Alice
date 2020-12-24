import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';
import 'package:path/path.dart';


///openDatabase
///
///在给定路径下打开数据库
///
/// [version]（可选）指定要打开的数据库的模式版本。用于确定是否调用[onCreate]，[onUpgrade]和[onDowngrade]
///
///按以下顺序调用可选回调：
///
/// 1. [onConfigure]
/// 2. [onCreate]或[onUpgrade]或[onDowngrade]
/// 5. [onOpen]
///
///[onConfigure]是打开数据库时调用的第一个回调。
///它允许您执行数据库初始化，例如启用外键或预写日志记录
///
///如果指定了[version]，则可以调用[onCreate]，[onUpgrade]和[onDowngrade]。
///这些功能是互斥的-尽管可以全部指定它们以涵盖多个场景，但是根据上下文，只能调用其中的一个
///
///如果在调用[openDatabase]之前数据库不存在，则会调用[onCreate]。
///您可以借此机会根据您的模式在数据库中创建所需的表
///
///如果满足以下任一条件，则调用[onUpgrade]：
///
/// 1.未指定[onCreate]
/// 2.数据库已经存在，并且[version]高于上一个数据库版本。
/// 在没有指定[onCreate]的第一种情况下，将调用[onUpgrade]，其[oldVersion]参​​数为'0'。
/// 在第二种情况下，您可以执行必要的迁移过程，以处理仅在[version]低于上一个数据库版本的情况下才调用[onDowngrade]模式。
/// 这是一种罕见的情况，只有在较新版本的代码创建了一个数据库之后又与较旧版本的代码进行交互的情况下，才会出现这种情况。
/// 您应该尝试避免这种情况。[onOpen]是最后一个要调用的可选回调。在设置数据库版本之后且在[openDatabase]返回之前调用。
/// 当[readOnly]（默认为false）为true时，将忽略所有其他参数，并按原样打开数据库，当[singleInstance]为true时（默认），则返回给定路径的单个数据库实例。
/// 随后使用相同路径对[openDatabase]的调用将返回相同的实例，并将丢弃所有其他参数，例如该调用的回调。


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
  //sheetName 表名
  static Future<bool> checkTableExists(String sheetName) async {
    //var factory = databaseFactory;
    //var isExists = await factory.databaseExists(path);
    //return isExists;
    return await databaseFactory.databaseExists(sheetName);
  }

  /// 删除数据库，创建文件夹并返回其路径
  static Future<String> initDeleteDb(String dbName) async {
    ///获取默认的数据库位置。
    ///在Android上，通常是data / data / <package_name> / databases
    ///在iOS上，它是Documents目录
    final databasePath = await getDatabasesPath();
    print('数据库位置: $databasePath'); //eg:  data/user/0/com.ow.alice/databases
    ///使用当前平台的[分隔符]将给定的路径部分连接到单个路径中。
    /// p.join（'path'，'to'，'foo'）; //->'path / to / foo'
    ///
    ///如果任何部分以路径分隔符结尾，则不会添加冗余分隔符：
    /// p.join（'path /'，'to'，'foo'）; //->'path / to / foo
    ///
    ///如果零件是绝对路径，则在此之前的所有内容都将被忽略：
    /// p.join（'path'，'/ to'，'foo'）; //->'/ to / foo'
    final path = join(databasePath, dbName); //eg:  data/user/0/com.ow.alice/databases/chatHistory.db
    print('路径: $path');

    ///Directory
    ///创建一个[Directory]对象。
    ///如果[path]是相对路径，则在使用时将相对于当前工作目录（请参见[Directory.current]）进行解释。
    ///如果[path]是绝对路径，则不会更改当前工作目录。

    /// dirname
    /// 获取最后一个分隔符之前的[path]部分。（人话：去掉了表名）

    /// exists
    /// 检查具有此路径的文件系统实体是否存在。
    /// 返回一个[：Future <bool>：]，并完成结果


    /// create
    /// 用此名称创建目录。
    /// 如果[recursive]为false，则仅创建路径中的最后一个目录。
    /// 如果[recursive]为true，则创建所有不存在的路径组件。
    /// 如果目录已经存在，则不执行任何操作。
    ///
    ///返回创建该目录后的[：Future <Directory>：]。
    ///如果无法创建目录，则future会出现异常。

    if (await Directory(dirname(path)).exists()) {
      ///删除给定路径下的数据库。
      await deleteDatabase(path);
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  ///创建文件夹并返回路径
  static Future<String> initDb(String dbName) async {
    final databasePath = await getDatabasesPath();
    print('数据库位置: $databasePath');
    final path = join(databasePath, dbName);
    print('路径: $path');
    //判断该路径下的文件夹是否存在，不存在创建文件夹
    if (await Directory(dirname(path)).exists()) {
      return path;
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  // 获取数据库路径
  //sheetName 表名
  static Future<String> fetchDatabasesPath(String sheetName) async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, sheetName);
    return path;
  }



}


///原始的SQL查询
///演示代码以执行Raw SQL查询
void testSqlCode() async{
  // 使用getDatabasesPath获取位置
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  // 删除数据库
  await deleteDatabase(path);

  // 打开数据库
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // 创建数据库时，创建表
        await db.execute( //执行没有返回值的SQL查询
            'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)');
      });

  // 在事务中插入一些记录,执行原始SQL INSERT查询  返回最后插入的记录ID
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
    print('inserted1: $id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        ['another name', 12345678, 3.1416]);
    print('inserted2: $id2');
  });

  // 更新一些记录
  int count = await database.rawUpdate(
      'UPDATE Test SET name = ?, value = ? WHERE name = ?',
      ['updated name', '9876', 'some name']);
  print('updated: $count');

  // 获取记录 ,执行原始SQL SELECT查询,返回找到的行的列表
  List<Map> list = await database.rawQuery('SELECT * FROM Test');
  List<Map> expectedList = [
    {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.789},
    {'name': 'another name', 'id': 2, 'value': 12345678, 'num': 3.1416}
  ];
  print(list);
  print(expectedList);
  //assert(const DeepCollectionEquality().equals(list, expectedList));

  // 计数记录
  count = Sqflite.firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM Test'));
  assert(count == 2);

  // 删除记录
  count = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  assert(count == 1);

  // 关闭数据库,无法再访问
  await database.close();
}