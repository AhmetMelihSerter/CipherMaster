import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/core/base/model/base_model.dart';
import 'package:ciphermaster/views/apps/model/app_count.dart';
import 'package:ciphermaster/core/init/services/local_db_manager.dart';
import 'package:ciphermaster/views/apps/storage/apps_local_storage.dart';
import 'package:ciphermaster/views/apps/services/apps_base_services.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';

class AppsLocal implements AppsBaseServices {
  static AppsLocal _instance;

  static AppsLocal get instance {
    if (_instance == null) _instance = AppsLocal._internal();
    return _instance;
  }

  AppsLocal._internal();

  final _dbManager = LocalDbManager.instance;
  final _appsLocalStorage = AppsLocalStorage.instance;

  Future<App> _getApp(int appID) async {
    
  }

  @override
  Future<App> createApp(
      User signInUser, App newApp, Function stateControl) async {
   
  }

  // ! equal daima true olur düzenle!!!!!!
  @override
  Future<App> updateApp(
      User signInUser, App updatedApp, Function stateControl) async {
   
  }

  @override
  Future<App> deleteApp(
      User signInUser, App deletedApp, Function stateControl) async {
   
  }

  @override
  Future<List<App>> readApps(User signInUser, App lastApp, int getAppCount,
      Function stateControl) async {
   
  }

  Future<List<App>> backUpApp(User signInUser, Function stateControl) async {
    
  }

  Future<AppCount> getAppCount(User user) async {
    
  }
}
