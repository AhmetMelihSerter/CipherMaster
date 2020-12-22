import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/apps/model/app_count.dart';
import 'package:ciphermaster/views/apps/services/apps_local.dart';
import 'package:ciphermaster/views/apps/services/apps_remote.dart';
import 'package:ciphermaster/core/init/network/network_manager.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';

class AppsRepository {
  static AppsRepository _instance;

  static AppsRepository get instance {
    if (_instance == null) _instance = AppsRepository._internal();
    return _instance;
  }

  AppsRepository._internal();

  final _networkManager = NetworkManager.instance;
  final _appsLocal = AppsLocal.instance;
  final _appsRemote = AppsRemote.instance;

  Future<App> downloadApp(User signInUser, App lastApp) async {
    
  }

  Future<App> createApp(User signInUser, App newApp, AppMode mode) async {
    
  }

  Future<App> updateApp(User signInUser, App updatedApp, AppMode mode) async {
    
  }

  Future<App> deleteApp(User signInUser, App deletedApp, AppMode mode) async {
    
  }

  Future<List<App>> readApps(
      User signInUser, App lastApp, int getAppCount, AppMode mode) async {
    
  }

  Future<AppCount> readAppCount(User user, AppMode mode) async {
    
  }
}
