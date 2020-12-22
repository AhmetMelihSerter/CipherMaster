import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';

abstract class SettingsBaseServices {
  Future<User> updateUser(User updatedUser, Function stateControl);
  Future<User> readUser(User user, Function stateControl);
  Future<Setting> createSetting(
      User createUser, Setting setting, Function stateControl);
  Future<Setting> updateSetting(
      User signInUser, Setting updatedSetting, Function stateControl);
  Future<Setting> readSetting(User signInUser, Function stateControl);
}
