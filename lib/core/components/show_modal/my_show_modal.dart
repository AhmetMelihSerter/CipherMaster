import 'package:flutter/material.dart';

class MyShowModal extends StatelessWidget {
  final double height;
  final Icon leading;
  final Text title;
  final GestureTapCallback onTap;
  final Widget child;

  const MyShowModal(
      {@required this.height,
      @required this.leading,
      @required this.title,
      @required this.onTap,
      this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                height: height,
                child: ListTile(
                  leading: leading,
                  title: title,
                  onTap: onTap,
                ),
              );
            });
      },
      child: child,
    );
  }
}
