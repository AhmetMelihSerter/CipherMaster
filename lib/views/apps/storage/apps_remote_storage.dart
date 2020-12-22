import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/apps/storage/i_apps_storage.dart';
import 'package:ciphermaster/views/apps/storage/apps_cache_storage.dart';
import 'package:ciphermaster/core/init/storage/firebase_storage_manager.dart';

class AppsRemoteStorage implements IAppsStorage {
  static AppsRemoteStorage _instance;

  static AppsRemoteStorage get instance {
    if (_instance == null) _instance = AppsRemoteStorage._internal();
    return _instance;
  }

  AppsRemoteStorage._internal();

  final _firebaseStorageManager = FirebaseStorageManager.instance;
  final _appsCacheStorage = AppsCacheStorage.instance;

  Future<App> downloadAppAvatar(User signInUser, App downloadApp) async {
    
  }

  @override
  Future<String> createAppAvatar(User signInUser, App insertedApp) async {
    
  }

  @override
  Future<String> deleteAppAvatar(User signInUser, App deletedApp) async {
    
  }
}
