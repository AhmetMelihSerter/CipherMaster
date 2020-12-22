import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/views/settings/services/settings_local.dart';
import 'package:ciphermaster/views/settings/services/settings_remote.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';

class SettingsRepository {
  static SettingsRepository _instance;

  static SettingsRepository get instance {
    if (_instance == null) _instance = SettingsRepository._internal();
    return _instance;
  }

  final _settingsLocal = SettingsLocal.instance;
  final _settingsRemote = SettingsRemote.instance;

  SettingsRepository._internal();

  Future<Setting> downloadSetting(User signInUser) async {
    
  }

  Future<User> updateUser(User updatedUser, AppMode mode) async {
    
  }

  Future<User> readUser(User signInUser, AppMode mode) async {
    
  }

  Future<Setting> createSetting(
      User createUser, Setting updatedSetting, AppMode mode) async {
    
  }

  Future<Setting> updateSetting(
      User signInUser, Setting updatedSetting, AppMode mode) async {
    
  }

  Future<Setting> readSetting(User signInUser, AppMode mode) async {
    
  }
}
