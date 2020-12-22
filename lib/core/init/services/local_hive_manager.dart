/*
import 'package:hive/hive.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';*/

class LocalHiveManager {
  static LocalHiveManager _instance;

  static LocalHiveManager get instance {
    if(_instance == null) _instance = LocalHiveManager._internal();
    return _instance;
  }

  LocalHiveManager._internal() {
    /*
    Hive.openLazyBox(User.tableName);
    Hive.openLazyBox(App.tableName);
    Hive.openLazyBox(Photo.tableName);
    Hive.openLazyBox(Setting.tableName);*/
  }
}
