import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyOutlineButton extends StatelessWidget {
  final Key customKey;
  final double width;
  final double height;
  final double margin;
  final double padding;
  final String text;
  final Color borderSide;
  final Color highlightedBorderColor;
  final VoidCallback onPressed;

  const MyOutlineButton(
      {this.customKey, this.width,
      this.height,
      this.text = "Outline Button",
      this.margin = 5,
      this.padding = 5,
      this.borderSide = ApplicationConstants.PRIMARY_COLOR,
      this.highlightedBorderColor = ApplicationConstants.PRIMARY_COLOR,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: OutlineButton(
        key: customKey,
        textColor: ApplicationConstants.PRIMARY_COLOR,
        child: Text(text),
        borderSide: BorderSide(
          color: borderSide,
        ),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        highlightedBorderColor: highlightedBorderColor,
        onPressed: onPressed,
      ),
    );
  }
}
