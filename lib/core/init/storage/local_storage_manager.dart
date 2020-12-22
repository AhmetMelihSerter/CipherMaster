import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class LocalStorageManager {
  static LocalStorageManager _instance = LocalStorageManager._internal();

  static LocalStorageManager get instance => _instance;

  LocalStorageManager._internal(){
    getApplicationDocumentsDirectory().then((value) => _directory = value);
  }

  Directory _directory;

  /// return directory.path
  String get storagePath => _directory.path;

  /// return Uuid().v1();
  String get getRandomName => Uuid().v1();
}
