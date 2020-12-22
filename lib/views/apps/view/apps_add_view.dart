import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/components/avatar/my_avatar.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';
import 'package:ciphermaster/core/components/textbox/my_textformfield.dart';
import 'package:ciphermaster/core/components/buttons/my_contained_button.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

/// Drawer Ekle

class AppsAddView extends StatefulWidget {
  @override
  _AppsAddViewState createState() => _AppsAddViewState();
}

class _AppsAddViewState extends State<AppsAddView> {
  /// [_appsKey] Form Key
  final _appsKey = GlobalKey<FormState>();

  /// [_focusTitle] Node
  final _focusTitle = FocusNode();

  /// [_focusEmail] Node
  final _focusEmail = FocusNode();

  /// [_focusPassword] Node
  final _focusPassword = FocusNode();

  ///
  AuthViewModel _authViewModel;

  ///
  AppsViewModel _appsViewModel;

  /// Add App
  Future<void> addControl() async {
    /// Form Validate
    if (_appsKey.currentState.validate()) {
      _appsKey.currentState.save();
      try {
        await _appsViewModel.addApp(_authViewModel.user);
        MyToast(toastText: 'apps_add_toast_added'.locale).show(context);
        Navigator.of(context).pop();
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    _appsViewModel = Provider.of<AppsViewModel>(context, listen: false);
    _appsViewModel.processApp = App(_authViewModel.user.id);
  }

  @override
  void dispose() {
    _focusTitle.dispose();
    _focusEmail.dispose();
    _focusPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _appsViewModel = Provider.of<AppsViewModel>(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: GestureDetector(
        onTap: () {
          _focusTitle.unfocus();
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('apps_add_app_bar'.locale),
          ),
          body: Stack(
            children: [
              Form(
                key: _appsKey,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: context.dynamicHeight(0.02),
                        ),
                        buildAvatar(),
                        SizedBox(
                          height: context.dynamicHeight(0.02),
                        ),
                        buildTitle(),
                        SizedBox(
                          height: context.dynamicHeight(0.02),
                        ),
                        buildMail(),
                        SizedBox(
                          height: context.dynamicHeight(0.02),
                        ),
                        buildPassword(),
                        SizedBox(
                          height: context.dynamicHeight(0.02),
                        ),
                        buildButton(),
                      ],
                    ),
                  ],
                ),
              ),
              _appsViewModel.progressControl(),
            ],
          ),
        ),
      ),
    );
  }
  /// -----------------hidden ----------------

}
