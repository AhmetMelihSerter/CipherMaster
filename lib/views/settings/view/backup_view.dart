import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/core/components/buttons/my_text_button.dart';
import 'package:ciphermaster/core/init/background/background_manager.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';

class BackupView extends StatefulWidget {
  @override
  _BackupViewState createState() => _BackupViewState();
}

class _BackupViewState extends State<BackupView> {
  ///
  AuthViewModel _authViewModel;

  ///
  SettingsViewModel _settingsViewModel;

  Future<void> _updateSetting() async {
    
  }

  Future<void> letsBackUp() async {
    
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
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          buildBackup(),
          buildConnectionType(),
          buildBackupNowButton(),
        ],
      ),
    );
  }

  ///-----------------------hidden----------------------------
}
