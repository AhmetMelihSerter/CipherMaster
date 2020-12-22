import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';

class MyAvatar extends StatelessWidget {
  final double radius;
  final double personSize;
  final File backgroundImage;
  final IconData icon;

  const MyAvatar(
      {this.radius,
      this.personSize,
      this.backgroundImage,
      @required this.icon}) : assert(icon != null);

  @override
  Widget build(BuildContext context) {
    if (backgroundImage != null && personSize == null)
      return CircleAvatar(
        radius: context.dynamicWidth(radius),
        foregroundColor: ApplicationConstants.PRIMARY_COLOR,
        backgroundColor: Colors.grey.shade400,
        backgroundImage: FileImage(backgroundImage),
      );
    else
      return CircleAvatar(
        radius: context.dynamicWidth(radius),
        foregroundColor: ApplicationConstants.PRIMARY_COLOR,
        backgroundColor: Colors.grey.shade400,
        child: Icon(
          icon,
          size: context.dynamicWidth(personSize),
        ),
      );
  }
}
