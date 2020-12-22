import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/core/base/model/base_model.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class LocalDbManager {
  static LocalDbManager _instance = LocalDbManager._internal();
  static LocalDbManager get instance => _instance;

  LocalDbManager._internal();

  Database _database;

  Future<Database> get getDatabase async {
    if (_database == null) _database = await _initializeDatabase();
    return _database;
  }

  Future<Database> _initializeDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, "cryptocipher.db");
    // * User First Login Tester
    if (ApplicationConstants.ISTEST) await deleteDatabase(dbPath);

    return await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('PRAGMA foreign_keys = ON');
      await db.execute(
          "----hidden----");
      await db.execute(
          "----hidden----");
      await db.execute(
          "----hidden----");
      await db.execute(
          "----hidden----");
      /*await db.execute(
          "----hidden----");*/
    });
  }
}
