import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/_model/photo_select.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/base/view_model/base_view_model.dart';
import 'package:ciphermaster/core/constants/enums/view_state_enum.dart';
import 'package:ciphermaster/views/settings/repository/settings_repository.dart';

class SettingsViewModel extends BaseViewModel {
  final userAvatar = PhotoSelect.icon();
  final _settingsRepository = SettingsRepository.instance;
  Setting setting;
  User processUser;
  Setting processSetting;

  void signOut() {
    setting = null;
  }

  Future<String> selectAvatar(User signInUser, BuildContext context) async {

  }

  Future<void> updateUser(User user) async {

  }

  Future<void> updateSetting(User user) async {

  }

  Future<void> getSetting(User user) async {

  }
}
