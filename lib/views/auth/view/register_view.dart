import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/components/textbox/my_textformfield.dart';
import 'package:ciphermaster/core/components/buttons/my_outline_button.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/core/components/buttons/my_contained_button.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  /// [keyRegisterName] Name Key
  final keyRegisterName = LabeledGlobalKey<FormFieldState>('name');

  /// [focusRegisterName] Name Node
  final focusRegisterName = FocusNode();

  /// [keyRegisterEmail] Email key
  final keyRegisterEmail = LabeledGlobalKey<FormFieldState>('mail');

  /// [focusRegisterEmail] Email node
  final focusRegisterEmail = FocusNode();

  /// [keyRegisterPassword] Password key
  final keyRegisterPassword = LabeledGlobalKey<FormFieldState>('password');

  /// [focusRegisterPassword] Password node
  final focusRegisterPassword = FocusNode();

  /// [keyRegisterRepeat] Password Repeat key
  final keyRegisterRepeat = LabeledGlobalKey<FormFieldState>('passwordRepeat');

  /// [focusRegisterRepeat] Password Repeat node
  final focusRegisterRepeat = FocusNode();

  ///
  AuthViewModel _authViewModel;

  @override
  void initState() {
    super.initState();
    _authViewModel = Provider.of(context, listen: false);
    _authViewModel.createStep();
  }

  @override
  void dispose() {
    focusRegisterName.dispose();
    focusRegisterEmail.dispose();
    focusRegisterPassword.dispose();
    focusRegisterRepeat.dispose();
    super.dispose();
  }

  /// register login
  Future<void> registerControl() async {
    switch (_authViewModel.activeStep) {
      case 0:
        if (keyRegisterName.currentState.validate()) {
          keyRegisterName.currentState.save();
          FocusScope.of(context).requestFocus(focusRegisterEmail);
          _authViewModel.nextStep();
        } else {
          _authViewModel.currentStepError();
        }
        break;
      case 1:
        if (keyRegisterEmail.currentState.validate()) {
          keyRegisterEmail.currentState.save();
          FocusScope.of(context).requestFocus(focusRegisterPassword);
          _authViewModel.nextStep();
        } else {
          _authViewModel.currentStepError();
        }
        break;
      case 2:
        if (keyRegisterPassword.currentState.validate()) {
          keyRegisterPassword.currentState.save();
          FocusScope.of(context).requestFocus(focusRegisterRepeat);
          _authViewModel.nextStep();
        } else {
          _authViewModel.currentStepError();
        }
        break;
      case 3:
        if (keyRegisterRepeat.currentState.validate()) {
          keyRegisterRepeat.currentState.save();
          try {
            await _authViewModel.createUserWithEmailAndPassword();
            _authViewModel.nextStep();
            // * I will think then fix it.
            /*  setState(() {
              _validateError = false;
            }); */

            debugPrint("RegisterPage Save");

            Navigator.of(context).pop();
            PlatformAlertDialog(
              title: 'alert_dialog_title_register_success'.locale,
              content: 'alert_dialog_context_register_success'.locale,
              okButtonText: 'alert_dialog_ok_button'.locale,
            ).show(context);
          } on PlatformException catch (e) {
            debugPrint(e.code.toString());
            PlatformAlertDialog(
              title: "Error",
              content: ErrorConstants.error(e.code),
              okButtonText: "OK",
            ).show(context);
          } catch (e) {
            if (e.toString().contains('email-already-in-use'))
              _authViewModel.mailError();
            debugPrint(e.toString());
            PlatformAlertDialog(
              title: "Error",
              content: ErrorConstants.error(e.toString()),
              okButtonText: "OK",
            ).show(context);
          }
        } else {
          _authViewModel.currentStepError();
          debugPrint("RegisterPage Validate Error");
        }
        break;
    }
  }

  void registerBackControl() {
    _authViewModel.backStep();
    switch (_authViewModel.activeStep) {
      case 0:
        FocusScope.of(context).requestFocus(focusRegisterName);
        break;
      case 1:
        FocusScope.of(context).requestFocus(focusRegisterEmail);
        break;
      case 2:
        FocusScope.of(context).requestFocus(focusRegisterPassword);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    List<Step> stepList = [
      stepName(),
      stepMail(),
      stepPassword(),
      stepPasswordRepeat(),
    ];

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            buildListView(stepList),
            _authViewModel.progressControl(),
          ],
        ),
      ),
    );
  }

  ///-------------------------------hidden--------------------------------
}
