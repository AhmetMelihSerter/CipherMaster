import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/init/storage/local_storage_manager.dart';
import 'package:ciphermaster/views/settings/storage/settings_cache_storage.dart';

class SettingsLocalStorage {
  static SettingsLocalStorage _instance;

  static SettingsLocalStorage get instance {
    if (_instance == null) _instance = SettingsLocalStorage._internal();
    return _instance;
  }

  SettingsLocalStorage._internal();

  final _storageLocalManager = LocalStorageManager.instance;
  final _settingsCacheStorage = SettingsCacheStorage.instance;

  Future<String> updateAvatar(User updatedUser) async {

  }
}
