import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/components/avatar/my_avatar.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/core/components/show_modal/my_show_modal.dart';
import 'package:ciphermaster/core/components/textbox/my_textformfield.dart';
import 'package:ciphermaster/core/components/buttons/my_contained_button.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _profileKey = GlobalKey<FormState>();
  final _focusName = FocusNode();
  AuthViewModel _authViewModel;
  SettingsViewModel _settingsViewModel;

  void _avatarControl() async {

  }

  void _updateControl() async {
  
  }

  @override
  void initState() {
    super.initState();
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _settingsViewModel = Provider.of<SettingsViewModel>(context, listen: false);
    final cloneUser = _authViewModel.user.toMap();
    _settingsViewModel.processUser = User.fromMap(cloneUser);
  }

  @override
  void dispose() {
    _focusName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _settingsViewModel = Provider.of<SettingsViewModel>(context);
    return GestureDetector(
      onTap: () => _focusName.unfocus(),
      child: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            Form(
              key: _profileKey,
              child: ListView(
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: context.dynamicHeight(0.02),
                      ),
                      buildAvatar(),
                      SizedBox(
                        height: context.dynamicHeight(0.02),
                      ),
                      buildName(),
                      SizedBox(
                        height: context.dynamicHeight(0.02),
                      ),
                      buildMail(),
                      SizedBox(
                        height: context.dynamicHeight(0.02),
                      ),
                      buildPassword(),
                      /* SizedBox(
                        height: context.dynamicHeight(0.02),
                      ),
                      buildUpdateButton(), */
                    ],
                  )
                  //Expanded(child: buildCipher()),
                ],
              ),
            ),
            _settingsViewModel.progressControl(),
          ],
        ),
      ),
    );
  }

 ///------------------------hidden---------------------------------
}
