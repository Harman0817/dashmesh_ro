import 'dart:io';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const int _databaseVersion = 1;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._createInstance();

  static Database? _database;

  static Future close() async => _database?.close();

  DatabaseHelper._();

  static Future<Database?> get database async {
    _database ??= await open();
    return _database;
  }

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper as DatabaseHelper;
  }

  static Future<String> initDb(String dbName) async {
    var databasePath = await getDatabasesPath();
    String path = p.join(databasePath, dbName);
    if (await Directory(p.dirname(path)).exists()) {
    } else {
      try {
        await Directory(p.dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return path;
  }

  static Future<Database> open() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    // String path = await initDb(DbConstants.DATA_BASE);
    var db = await databaseFactory.openDatabase(inMemoryDatabasePath);

    // var database = await openDatabase(path,
    //     version: _databaseVersion, onCreate: _createDb, onUpgrade: _onUpgrade);
    // return database;
    _createDb(db, _databaseVersion);
    return db;
  }

/*...........................create database all tables............*/

  static void _createDb(Database db, int newVersion) async {
    await _createCustomerListTable(db);
    await _createVisitListTable(db);
  }

/*..........................function for upgrade database tables if database version change...................*/

  static void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    db.execute("DROP TABLE IF EXISTS ${DbConstants.TABLE_VISIT_LIST}");
    _onCreateAfter(db);
  }


  static _createCustomerListTable(Database db) async {
    await db.execute('CREATE TABLE ${DbConstants.TABLE_CUSTOMER_LIST} ('
        '${DbConstants.COL_ID} INTEGER PRIMARY KEY AUTOINCREMENT,'
        '${DbConstants.COL_NAME} TEXT,'
        '${DbConstants.COL_MOBILE_NUMBER} TEXT,'
        '${DbConstants.COL_ADDRESS} TEXT,'
        '${DbConstants.COL_LOCALITY} TEXT,'
        '${DbConstants.COL_LAST_CONTACT_DATE} TEXT,'
        '${DbConstants.COL_PURIFIER_TYPE} TEXT'
    ')');
    }

  static _createVisitListTable(Database db) async {
    await db.execute('CREATE TABLE ${DbConstants.TABLE_VISIT_LIST} ('
        '${DbConstants.COL_ID} INTEGER PRIMARY KEY AUTOINCREMENT,'
        '${DbConstants.COL_CUSTOMER_ID} INTEGER,'
        '${DbConstants.COL_VISIT_DATE} TEXT,'
        '${DbConstants.COL_BILLING_AMOUNT} TEXT,'
        '${DbConstants.COL_VISIT_STATUS} TEXT,'
        '${DbConstants.COL_VISIT_REMARKS} TEXT,'
        '${DbConstants.COL_SERVICE_DURATION} TEXT,'
        '${DbConstants.COL_GUARANTEE_PERIOD} TEXT,'
        '${DbConstants.COL_SERVICE_TYPE} TEXT'
    ')');
  }

/*Function call after update db version for create table*/
  static Future<void> _onCreateAfter(Database db) async {
    await _createCustomerListTable(db);
    await _createVisitListTable(db);
  }

/*...................................................................Insert  Operation: Insert object to db..........................................................................................*/
  static Future<int?> insertDataInTable(
      String tableName, Map<String, dynamic> mapData) async {
    Database? db = await database;
    var result = await db?.insert(tableName, mapData);
    return result;
  }

/*..........................................................................Update Operation: Update Object and save it to db..........................................................................*/
  Future<int?> updateTableRow(
      String tableName, Map<String, dynamic> mapData, where, whereArg) async {
    var db = await database;
    var result =
        await db?.update(tableName, mapData, where: where, whereArgs: whereArg);
    return result;
  }

/*............................................................................*/

/*Get number of Note object in db*/
  Future<int?> getCount(String table) async {
    Database? db = await database;
    List<Map<String, dynamic>> x = await db!.rawQuery('SELECT COUNT (*) from '
        '$table');
    int? result = Sqflite.firstIntValue(x);
    return result;
  }

/*............................................................................Clear all data to table............................................................................*/
  static Future<int> clearDBTable(String tableName) async {
    var db = await database;
    int rowId = await db!.delete(tableName);
    return rowId;
  }

/*............................................................................Clear all data to table............................................................................*/
  Future<int> deleteRowTable(
      String tableName, String where, List<dynamic> whereArgs) async {
    var db = await database;
    int rowId = await db!.delete(tableName, where: where, whereArgs: whereArgs);
    return rowId;
  }

/*......................................................................Fetch Operation: Get all game objects from database..........................................................................*/
  static Future<List<Map<String, dynamic>>> fetchMapList(
      {String? tableName,
      List<String>? columns,
      String? where,
      List<dynamic>? whereArgs,
      String? groupBy,
      String? having,
      String? orderBy,
      int? limit,
      int? offset}) async {
    Database? db = await database;
    var result = await db!.query(tableName ?? "",
        columns: columns,
        where: where,
        whereArgs: whereArgs,
        groupBy: groupBy,
        having: having,
        orderBy: orderBy,
        limit: limit,
        offset: offset);
    return result;
  }
}
