import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/init/storage/cache_storage_manager.dart';

class SettingsCacheStorage {
  static SettingsCacheStorage _instance;

  static SettingsCacheStorage get instance {
    if (_instance == null) _instance = SettingsCacheStorage._internal();
    return _instance;
  }

  SettingsCacheStorage._internal();

  final _cacheManager = CacheStorageManager.instance;

  Future<String> createSelectedAvatar(User signInUser, ByteData avatar) async {
    
  }

  /// * User Avatar are cached on first login.
  Future<String> downloadAvatar(User downloadUser, Uint8List avatar) async {
    
  }

  Future<String> deleteAvatar(User user) async {
    
  }
}
