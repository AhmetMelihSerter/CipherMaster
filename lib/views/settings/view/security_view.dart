import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';

class SecurityView extends StatefulWidget {
  @override
  _SecurityViewState createState() => _SecurityViewState();
}

class _SecurityViewState extends State<SecurityView> {
  ///
  AuthViewModel _authViewModel;

  ///
  SettingsViewModel _settingsViewModel;

  Future<void> _updateSetting() async {
    await _settingsViewModel.updateSetting(_authViewModel.user);
  }

  /// * This method not support for ios
  Future<void> screenShootControl() async {

  }

  @override
  void initState() {
    super.initState();

    _settingsViewModel = Provider.of<SettingsViewModel>(context, listen: false);
    final cloneSetting = _settingsViewModel.setting.toMap();
    _settingsViewModel.processSetting = Setting.fromMap(cloneSetting);
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _settingsViewModel = Provider.of<SettingsViewModel>(context);
    screenShootControl();
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildAutoSignOut(),
          buildFingerPrint(),
          buildScreenShoot(),
        ],
      ),
    );
  }

 ///--------------------------hidden--------------------------------
}
