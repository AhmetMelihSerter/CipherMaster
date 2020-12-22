import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class CacheStorageManager {
  static CacheStorageManager _instance = CacheStorageManager._internal();

  static CacheStorageManager get instance => _instance;

  CacheStorageManager._internal() {
    getTemporaryDirectory().then((value) => _directory = value);
  }

  Directory _directory;

  /// return directory.path
  String get storagePath => _directory.path;

  /// return Uuid().v1();
  String get getRandomName => Uuid().v1();
}
