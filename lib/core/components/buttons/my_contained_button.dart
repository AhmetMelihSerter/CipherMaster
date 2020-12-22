import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyContainedButton extends StatelessWidget {
  final Key customKey;
  final double width;
  final double height;
  final double margin;
  final double padding;
  final String text;
  final double elevation;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;

  const MyContainedButton(
      {this.customKey,
      this.width,
      this.height,
      this.margin = 5,
      this.padding = 5,
      this.text = "Button",
      this.elevation = 5,
      this.buttonColor = ApplicationConstants.PRIMARY_COLOR,
      this.textColor = ApplicationConstants.SECONDARY_COLOR,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: RaisedButton(
        key: customKey,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
        color: buttonColor,
        shape: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white10,
          ),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        elevation: elevation,
        onPressed: onPressed,
      ),
    );
  }
}
