import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ciphermaster/views/_widgets/platform_widget/platform_widget.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class PlatformAlertDialog extends PlatformWidget {
  final String title;
  final String content;
  final String okButtonText;
  final String cancelButtonText;

  PlatformAlertDialog(
      {@required this.title,
      @required this.content,
      @required this.okButtonText,
      this.cancelButtonText});

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog<bool>(
            context: context, builder: (context) => this)
        : await showDialog<bool>(
            context: context,
            builder: (context) => this,
            barrierDismissible: false);
  }

  @override
  Widget buildAndroidWidget(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonSetting(context),
    );
  }

  @override
  Widget buildIOSWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _dialogButtonSetting(context),
    );
  }

  List<Widget> _dialogButtonSetting(BuildContext context) {
    final buttonList = <Widget>[];

    if (Platform.isIOS) {
      if (cancelButtonText != null) {
        buttonList.add(
          CupertinoDialogAction(
            child: Text(cancelButtonText),
            onPressed: () => Navigator.of(context).pop(false),
          ),
        );
      }
      buttonList.add(
        CupertinoDialogAction(
          child: Text(okButtonText),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      );
    } else {
      if (cancelButtonText != null) {
        buttonList.add(
          FlatButton(
            child: Text(cancelButtonText),
            textColor: ApplicationConstants.PRIMARY_COLOR,
            onPressed: () => Navigator.of(context).pop(false),
          ),
        );
      }
      buttonList.add(
        FlatButton(
          child: Text(okButtonText),
          textColor: ApplicationConstants.PRIMARY_COLOR,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      );
    }
    return buttonList;
  }
}
