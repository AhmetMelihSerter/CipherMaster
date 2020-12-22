import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/core/init/storage/cache_storage_manager.dart';

class AppsCacheStorage {
  static AppsCacheStorage _instance;

  static AppsCacheStorage get instance {
    if (_instance == null) _instance = AppsCacheStorage._internal();
    return _instance;
  }

  AppsCacheStorage._internal();

  final _cacheManager = CacheStorageManager.instance;

  Future<String> createSelectedIcon(User signInUser, ByteData icon) async {
    
  }

  /// * Apps are cached on first login.
  Future<String> downloadAppIcon(
      User signInUser, App downloadApp, Uint8List icon) async {
    
  }

  Future<String> deleteAppIcon(App deletedApp) async {
    
  }
}
