import 'package:flutter/material.dart';
import 'package:ciphermaster/views/home/view/home.dart';
import 'package:ciphermaster/views/main/view/main_view.dart';
import 'package:ciphermaster/views/apps/view/apps_view.dart';
import 'package:ciphermaster/views/auth/view/login_view.dart';
import 'package:ciphermaster/views/photos/view/photos_view.dart';
import 'package:ciphermaster/views/apps/view/apps_add_view.dart';
import 'package:ciphermaster/views/auth/view/register_view.dart';
import 'package:ciphermaster/views/apps/view/apps_icon_view.dart';
import 'package:ciphermaster/views/settings/view/backup_view.dart';
import 'package:ciphermaster/views/folders/view/folders_view.dart';
import 'package:ciphermaster/views/apps/view/apps_detail_view.dart';
import 'package:ciphermaster/views/settings/view/profile_view.dart';
import 'package:ciphermaster/views/settings/view/security_view.dart';
import 'package:ciphermaster/views/language/view/language_view.dart';
import 'package:ciphermaster/views/settings/view/settings_view.dart';
import 'package:ciphermaster/views/not_found/view/not_found_view.dart';
import 'package:ciphermaster/views/photos/view/photos_detail_view.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  final Map<String, dynamic> routes = {
    NavigationConstants.loginView: (context) => LoginView(),
    NavigationConstants.registerView: (context) => RegisterView(),
    NavigationConstants.bottomNavigationView: (context) => Home(),
    NavigationConstants.mainView: (context) => MainView(),
    NavigationConstants.appsView: (context) => AppsView(),
    NavigationConstants.appsAddView: (context) => AppsAddView(),
    NavigationConstants.appsDetailView: (context) => AppsDetailView(),
    NavigationConstants.appsIconView: (context) => AppsIconView(),
    NavigationConstants.photosView: (context) => PhotosView(),
    NavigationConstants.photosDetailView: (context) => PhotosDetailView(),
    NavigationConstants.foldersView: (context) => FoldersView(),
    NavigationConstants.profileView: (context) => ProfileView(),
    NavigationConstants.settingsView: (context) => SettingsView(),
    NavigationConstants.languageView: (context) => LanguageView(),
    NavigationConstants.securityView: (context) => SecurityView(),
    NavigationConstants.backupView: (context) => BackupView(),
  };

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.baseView:
        return null;
      case NavigationConstants.loginView:
        return normalNavigate(LoginView());
      case NavigationConstants.registerView:
        return normalNavigate(RegisterView(), fullscreenDialog: true);
      case NavigationConstants.bottomNavigationView:
        return normalNavigate(Home());
      case NavigationConstants.mainView:
        return normalNavigate(MainView());
      case NavigationConstants.appsView:
        return normalNavigate(AppsView());
      case NavigationConstants.appsAddView:
        return normalNavigate(AppsAddView());
      case NavigationConstants.appsDetailView:
        return normalNavigate(AppsDetailView());
      case NavigationConstants.appsIconView:
        return normalNavigate(AppsIconView(), fullscreenDialog: true);
      case NavigationConstants.photosView:
        return normalNavigate(PhotosView(), fullscreenDialog: true);
      case NavigationConstants.photosDetailView:
        return normalNavigate(PhotosDetailView());
      case NavigationConstants.foldersView:
        return normalNavigate(FoldersView());
      case NavigationConstants.profileView:
        return normalNavigate(ProfileView(), fullscreenDialog: true);
      case NavigationConstants.settingsView:
        return normalNavigate(SettingsView());
      case NavigationConstants.languageView:
        return normalNavigate(LanguageView(), fullscreenDialog: true);
      case NavigationConstants.securityView:
        return normalNavigate(SecurityView());
      case NavigationConstants.backupView:
        return normalNavigate(BackupView());
      default:
        return normalNavigate(NotFoundView());
    }
  }

  MaterialPageRoute<dynamic> normalNavigate(Widget widget,
      {bool fullscreenDialog = false}) {
    return MaterialPageRoute(
      builder: (context) => widget,
      fullscreenDialog: fullscreenDialog,
    );
  }
}
