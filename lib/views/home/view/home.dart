import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/main/view/main_view.dart';
import 'package:ciphermaster/views/apps/view/apps_view.dart';
import 'package:ciphermaster/views/photos/view/photos_view.dart';
import 'package:ciphermaster/views/folders/view/folders_view.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/constants/enums/app_menu_enum.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/views/_widgets/bottom_tab_bar/bottom_navigation.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with WidgetsBindingObserver {
  ///
  TabItem _currentTab = TabItem.MainPage;

  ///
  bool _signOut = false;

  ///
  Timer _timer;

  ///
  AuthViewModel _authViewModel;

  ///
  SettingsViewModel _settingsViewModel;

  Future<void> alertDialogs() async {
    if (await _authViewModel.getPrefFirst() == 1) {
      /// First Login
      PlatformAlertDialog(
        title: 'alert_dialog_title_first_login_success'.locale,
        content: 'alert_dialog_context_first_login_success'.locale,
        okButtonText: 'alert_dialog_ok_button'.locale,
      ).show(context);
      _authViewModel.setPrefFirst(_authViewModel.user.mail, 0);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("LifeCycle Resume");
        if (_signOut) {
          debugPrint("SignOut");
         
        } else {
          debugPrint("SignOut Cancel");
          
        }
        break;
      case AppLifecycleState.paused:
        debugPrint("LifeCycle Paused.");
        
        });
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _settingsViewModel = Provider.of<SettingsViewModel>(context, listen: false);
    _settingsViewModel.getSetting(_authViewModel.user);
    alertDialogs();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !(await navigatorKeys[_currentTab].currentState.maybePop()),
      child: BottomNavigation(
        navigatorKeys: navigatorKeys,
        currentTab: _currentTab,
        onSelectedTab: (selectedTab) {
          _currentTab = selectedTab;
        },
        pageCreate: allPages(),
      ),
    );
  }

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.MainPage: GlobalKey<NavigatorState>(),
    TabItem.AppsPage: GlobalKey<NavigatorState>(),
    TabItem.PhotosPage: GlobalKey<NavigatorState>(),
    TabItem.FoldersPage: GlobalKey<NavigatorState>(),
  };

  Map<TabItem, Widget> allPages() {
    return {
      TabItem.MainPage: MainView(),
      TabItem.AppsPage: AppsView(),
      TabItem.PhotosPage: PhotosView(),
      TabItem.FoldersPage: FoldersView(),
    };
  }
}
