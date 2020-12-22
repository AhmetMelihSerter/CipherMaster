import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';

abstract class AppsBaseServices {
  Future<App> createApp(User signInUser, App newApp, Function stateControl);
  Future<App> updateApp(User signInUser, App updatedApp,
      Function stateControl);
  Future<App> deleteApp(
      User signInUser, App deletedApp, Function stateControl);
  Future<List<App>> readApps(
      User signInUser, App lastApp, int getAppCount, Function stateControl);
}
