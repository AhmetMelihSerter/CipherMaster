import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MyFloatingActionButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.14),
      height: context.dynamicHeight(0.14),
      padding: EdgeInsets.only(
        bottom: context.dynamicHeight(0.07),
      ),
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: ApplicationConstants.PRIMARY_COLOR,
        foregroundColor: ApplicationConstants.SECONDARY_COLOR,
        onPressed: onPressed,
        child: Icon(Icons.add),
      ),
    );
  }
}
