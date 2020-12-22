import 'dart:io';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/init/storage/firebase_storage_manager.dart';
import 'package:ciphermaster/views/settings/storage/settings_cache_storage.dart';

class SettingsRemoteStorage {
  static SettingsRemoteStorage _instance;

  static SettingsRemoteStorage get instance {
    if (_instance == null) _instance = SettingsRemoteStorage._internal();
    return _instance;
  }

  SettingsRemoteStorage._internal();
  
final _firebaseStorageManager = FirebaseStorageManager.instance;
  final _settingsCacheStorage = SettingsCacheStorage.instance;

  Future<String> updateAvatar(User updatedUser) async {

  }

  Future<String> downloadAvatar(User signInUser) async {
    
  }
}
