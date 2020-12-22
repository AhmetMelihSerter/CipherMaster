import 'package:flutter/material.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';

class MyCard extends StatelessWidget {
  final Widget child;

  const MyCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.3),
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        elevation: 5,
        child: child,
      ),
    );
  }
}
