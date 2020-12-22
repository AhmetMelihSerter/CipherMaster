import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/apps/model/app_count.dart';
import 'package:ciphermaster/core/init/services/firebase_cloud_manager.dart';
import 'package:ciphermaster/views/apps/storage/apps_remote_storage.dart';
import 'package:ciphermaster/views/apps/services/apps_base_services.dart';

class AppsRemote implements AppsBaseServices {
  static AppsRemote _instance;

  static AppsRemote get instance {
    if (_instance == null) _instance = AppsRemote._internal();
    return _instance;
  }

  AppsRemote._internal();

  final _firebaseManager = FirebaseCloudManager.instance;
  final _appsRemoteStorage = AppsRemoteStorage.instance;

  @override
  Future<App> createApp(
      User signInUser, App newApp, Function stateControl) async {
    
  }

  @override
  Future<App> updateApp(
      User signInUser, App updatedApp, Function stateControl) async {
   
  }

  @override
  Future<App> deleteApp(
      User signInUser, App deletedApp, Function stateControl) async {
    
  }

  Future<App> readApp(User signInUser, App lastApp) async {
    
  }

  @override
  Future<List<App>> readApps(
      User signInUser, App lastApp, int getAppCount, Function stateControl) {
    // TODO: implement getApps
    throw UnimplementedError();
  }

  Future<AppCount> getAppCount(User user) async {
    
  }

  Future<void> _incrementAppCount(User signInUser) async {
    
  }

  Future<void> _decrementAppCount(User signInUser) async {
    
  }
}
