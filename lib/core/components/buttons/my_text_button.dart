import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyTextButton extends StatelessWidget {
  final Key customKey;
  final double width;
  final double height;
  final String text;
  final VoidCallback onPressed;

  const MyTextButton(
      {this.customKey, this.width,
      this.height,
      this.text = "Text Button",
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        key: customKey,
        textColor: ApplicationConstants.PRIMARY_COLOR,
        child: Text(text),
        onPressed: onPressed,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: ApplicationConstants.SECONDARY_COLOR,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
      ),
    );
  }
}
