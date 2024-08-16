import 'dart:io';
import 'package:dashmesh_ro/core/shared/db_constants.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static const int _databaseVersion = 1;
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._createInstance();

  static Future close() async => _database?.close();

  // static DatabaseHelper? _databaseHelperInstance;

  static Future<Database?> get database async {
    _database ??= await open();
    return _database;
  }

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper as DatabaseHelper;
  }

  static Future<String> initDb(String dbName) async {
    var databasePath =
        Directory(Platform.environment['LOCALAPPDATA'] ?? '.').path;
    String path = p.join(databasePath, dbName);
    print(path);
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
    String path = await initDb(DbConstants.DATA_BASE);
    var database = await databaseFactoryFfi.openDatabase(path,
        options: OpenDatabaseOptions(
            version: _databaseVersion,
            onCreate: _createDb,
            onUpgrade: _onUpgrade));
    return database;
  }

  static void _createDb(Database db, int newVersion) async {
    await _createCustomerListTable(db);
    await _createVisitListTable(db);
  }

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
        '${DbConstants.COL_NOTIFICATION_DATE} TEXT,'
        '${DbConstants.COL_BILLING_AMOUNT} TEXT,'
        '${DbConstants.COL_PAID_AMOUNT} TEXT,'
        '${DbConstants.COL_VISIT_STATUS} TEXT,'
        '${DbConstants.COL_VISIT_REMARKS} TEXT,'
        '${DbConstants.COL_SERVICE_DURATION} TEXT,'
        '${DbConstants.COL_GUARANTEE_PERIOD} TEXT,'
        '${DbConstants.COL_SERVICE_TYPE} TEXT'
        ')');
  }

  static Future<void> _onCreateAfter(Database db) async {
    await _createCustomerListTable(db);
    await _createVisitListTable(db);
  }

  static Future<int?> insertDataInTable(
      String tableName, Map<String, dynamic> mapData) async {
    Database? db = await database;
    var result = await db?.insert(tableName, mapData);
    return result;
  }

  Future<int?> updateTableRow(
      String tableName, Map<String, dynamic> mapData, where, whereArg) async {
    var db = await database;
    var result =
        await db?.update(tableName, mapData, where: where, whereArgs: whereArg);
    return result;
  }

  // Future<int?> getCount(String table) async {
  //   Database? db = await database;
  //   List<Map<String, dynamic>> x = await db!.rawQuery('SELECT COUNT (*) from '
  //       '$table');
  //   int? result = Sqflite.firstIntValue(x);
  //   return result;
  // }

  static Future<int> clearDBTable(String tableName) async {
    var db = await database;
    int rowId = await db!.delete(tableName);
    return rowId;
  }

  Future<int> deleteRowTable(
      String tableName, String where, List<dynamic> whereArgs) async {
    var db = await database;
    int rowId = await db!.delete(tableName, where: where, whereArgs: whereArgs);
    return rowId;
  }

  static Future<List<Map<String, Object?>>> fetchJoinResult(String date) async {
    Database? db = await database;
    var query = '''
    SELECT *
    FROM ${DbConstants.TABLE_CUSTOMER_LIST} AS u
    JOIN ${DbConstants.TABLE_VISIT_LIST} AS o ON u.id = o.customerId
    where ${DbConstants.COL_NOTIFICATION_DATE} = '$date';
  ''';

    final result = await db!.rawQuery(query);
    print('Hello $result');
    return result;
  }

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
