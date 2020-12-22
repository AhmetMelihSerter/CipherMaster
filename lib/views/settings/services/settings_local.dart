import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/base/model/base_model.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/init/services/local_db_manager.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';
import 'package:ciphermaster/views/settings/storage/settings_local_storage.dart';
import 'package:ciphermaster/views/settings/services/settings_base_services.dart';

class SettingsLocal implements SettingsBaseServices {
  static SettingsLocal _instance;

  static SettingsLocal get instance {
    if (_instance == null) _instance = SettingsLocal._internal();
    return _instance;
  }

  SettingsLocal._internal();

  final _dbManager = LocalDbManager.instance;
  final _settingsLocaleStorage = SettingsLocalStorage.instance;

  Future<User> createUser(User updatedUser, Function stateControl) async {
    
  }

  @override
  Future<User> updateUser(User updatedUser, Function stateControl) async {
    
  }

  @override
  Future<User> readUser(User user, Function stateControl) async {
    
  }

  @override
  Future<Setting> createSetting(
      User createUser, Setting setting, Function stateControl) async {
    
  }

  @override
  Future<Setting> updateSetting(
      User signInUser, Setting updatedSetting, Function stateControl) async {
    
  }

  @override
  Future<Setting> readSetting(User signInUser, Function stateControl) async {
    
  }
}
