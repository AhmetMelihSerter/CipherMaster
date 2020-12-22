import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyToast {
  final toast = FToast();
  final toastText;
  final durationSeconds;

  MyToast({@required this.toastText, this.durationSeconds = 2});

  void show(BuildContext context) {
    toast.init(context);
    toast.showToast(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: ApplicationConstants.TOAST_COLOR,
        ),
        child: Text(toastText),
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: durationSeconds),
    );
  }
}
