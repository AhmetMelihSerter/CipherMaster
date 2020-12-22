import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/apps/storage/i_apps_storage.dart';
import 'package:ciphermaster/views/apps/storage/apps_cache_storage.dart';
import 'package:ciphermaster/core/init/storage/local_storage_manager.dart';

class AppsLocalStorage implements IAppsStorage  {
  static AppsLocalStorage _instance;

  static AppsLocalStorage get instance {
    if (_instance == null) _instance = AppsLocalStorage._internal();
    return _instance;
  }

  AppsLocalStorage._internal();

  final _storageLocalManager = LocalStorageManager.instance;
  final _appsCacheStorage = AppsCacheStorage.instance;

  @override
  Future<String> createAppAvatar(User signInUser, App insertedApp) async {
    
  }

  /// Download edildiğinde veritabanına kaydederken farklı isim oluyor.
  /// Hesap silinmişken giriş yapıyorken.
  Future<String> updateAppAvatar(User signInUser, App updatedApp) async {
    
  }

  @override
  Future<String> deleteAppAvatar(User signInUser, App deletedApp) async {
    
  }
}
