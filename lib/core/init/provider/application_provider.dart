import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/photos/view_model/photos_view_model.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';

class ApplicationProvider {
  static ApplicationProvider _instance;
  static ApplicationProvider get instance {
    if (_instance == null) _instance = ApplicationProvider._init();
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> uiChangesItems = [
    ChangeNotifierProvider(create: (context) => AuthViewModel()),
    ChangeNotifierProvider(create: (context) => SettingsViewModel()),
    ChangeNotifierProvider(create: (context) => AppsViewModel()),
    ChangeNotifierProvider(create: (context) => PhotosViewModel()),
  ];
}
