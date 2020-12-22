import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/init/services/firebase_cloud_manager.dart';
import 'package:ciphermaster/views/settings/storage/settings_remote_storage.dart';
import 'package:ciphermaster/views/settings/services/settings_base_services.dart';

class SettingsRemote implements SettingsBaseServices {
  static SettingsRemote _instance;

  static SettingsRemote get instance {
    if (_instance == null) _instance = SettingsRemote._internal();
    return _instance;
  }

  SettingsRemote._internal();

  final _firebaseManager = FirebaseCloudManager.instance;
  final _settingsRemoteStorage = SettingsRemoteStorage.instance;

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
