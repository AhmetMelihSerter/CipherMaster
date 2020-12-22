import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';

abstract class IAppsStorage {
  Future<String> createAppAvatar(User signInUser, App insertedApp);
  Future<String> deleteAppAvatar(User signInUser, App deletedApp);
}
