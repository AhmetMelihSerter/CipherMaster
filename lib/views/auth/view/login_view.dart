import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';
import 'package:ciphermaster/core/components/buttons/my_text_button.dart';
import 'package:ciphermaster/core/constants/images/images_constants.dart';
import 'package:ciphermaster/core/components/textbox/my_textformfield.dart';
import 'package:ciphermaster/views/photos/view_model/photos_view_model.dart';
import 'package:ciphermaster/core/components/buttons/my_contained_button.dart';
import 'package:ciphermaster/views/settings/view_model/settings_view_model.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  /// [_loginKey] Login Form Key
  final _loginKey = GlobalKey<FormState>();

  /// [_focusLoginMail] Node
  final _focusLoginMail = FocusNode();

  /// [_focusLoginPassword] Node
  final _focusLoginPassword = FocusNode();

  /// [_controllerMail] Mail TextFormField doldurmak için tutarız.
  final _controllerMail = TextEditingController();

  /// [_controllerPassword] Password TextFormField doldurmak için tutarız.
  final _controllerPassword = TextEditingController();

  ///
  AuthViewModel _authViewModel;

  /// Test
  final mailKey = Key('mail');
  final mailPassword = Key('password');

  void _buildUnFocus() => FocusScope.of(context).unfocus();

  /// Login Control
  void loginControl() async {
    /// Form Validate
    if (_loginKey.currentState.validate()) {
      debugPrint("LoginPage Form Validate");

      _loginKey.currentState.save();
      debugPrint("LoginPage Form Save");

      /// Keyboard Close
      _buildUnFocus();

      /// Go to [_userModel]
      try {
        await _authViewModel.signInWithEmailAndPassword();
        _controllerPassword.text = "";
        Navigator.of(context)
            .pushNamed(NavigationConstants.bottomNavigationView);
      } on PlatformException catch (e) {
        debugPrint(e.code);
        PlatformAlertDialog(
          title: 'alert_dialog_title_error'.locale,
          content: ErrorConstants.error(e.code),
          okButtonText: 'alert_dialog_ok_button'.locale,
        ).show(context);
      } catch (e) {
        debugPrint(e.toString());
        PlatformAlertDialog(
          title: 'alert_dialog_title_error'.locale,
          content: ErrorConstants.error(e.toString()),
          okButtonText: 'alert_dialog_ok_button'.locale,
        ).show(context);
      }
    }

    /// Not Validate
    else {
      debugPrint("LoginPage Form Not Validate");
    }
  }

  Future<void> getMail() async {
    String getMail = await _authViewModel.getPrefMail();
    if (getMail != "") {
      _controllerMail.text = getMail;
      FocusScope.of(context).requestFocus(_focusLoginPassword);
    }
  }

  void signOut() {
    final _settingsViewModel =
        Provider.of<SettingsViewModel>(context, listen: false);
    final _appsViewModel = Provider.of<AppsViewModel>(context, listen: false);
    final _photosViewModel =
        Provider.of<PhotosViewModel>(context, listen: false);
    _authViewModel.signOut();
    _settingsViewModel.signOut();
    _appsViewModel.signOut();
    _photosViewModel.signOut();
  }

  @override
  void initState() {
    super.initState();
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getMail();
      signOut();
    });
    // * Create Mail Tester
    //Timer(Duration(seconds: 1), () => _authViewModel.setPrefMail(""));
    // * First Login Tester
    //Timer(Duration(seconds: 1), () => _authViewModel.setPrefFirst("test@test.com", 1));
  }

  @override
  void dispose() {
    _focusLoginMail.dispose();
    _focusLoginPassword.dispose();
    _controllerMail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    return GestureDetector(
      onTap: _buildUnFocus,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            Form(
              key: _loginKey,
              child: buildListView(),
            ),
            _authViewModel.progressControl(),
          ],
        ),
      ),
    );
  }

  Widget buildListView() {
    return ListView(
      children: <Widget>[
        buildMainImage(),
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
        buildForgotPassword(),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
        buildLoginButton(),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
        buildRegisterButton(),
        SizedBox(
          height: context.dynamicHeight(0.02),
        ),
      ],
    );
  }

  ///------------------------------hidden---------------------------------
}
