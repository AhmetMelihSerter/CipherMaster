import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/components/avatar/my_avatar.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/core/components/buttons/my_outline_button.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  ///
  AuthViewModel _authViewModel;

  ///
  SettingsViewModel _settingsViewModel;

  Future<void> getSetting() async {

  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getSetting();
    });
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _settingsViewModel = Provider.of<SettingsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('settings_app_bar'.locale),
      ),
      body: ListView(
        children: [
          buildProfile(),
          buildLanguage(),
          buildSecurity(),
          buildBackup(),
          buildAbout(),
          buildSignOutButton(),
        ],
      ),
    );
  }

///-------------------------------hidden------------------------------
}
