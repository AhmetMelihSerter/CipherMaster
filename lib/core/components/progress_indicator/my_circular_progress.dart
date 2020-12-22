import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';

class MyCircularProgress extends StatefulWidget {
  @override
  _MyCircularProgressState createState() => _MyCircularProgressState();
}

class _MyCircularProgressState extends State<MyCircularProgress>
    with SingleTickerProviderStateMixin {
  final Color backgroundColor = Colors.white38;
  final Color progressColor = ApplicationConstants.PRIMARY_COLOR;
  final Color messageBoxBG = ApplicationConstants.MESSAGEBOX_COLOR;
  Duration _duration = Duration(milliseconds: 500);
  bool timeDelayControl = false;
  Timer timer;
  AnimationController _animationController;
  Animation<double> _animationApp;
  Animation<double> _animationApp2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animationApp =
        Tween<double>(begin: 0, end: 170).animate(_animationController);
    _animationApp2 =
        Tween<double>(begin: 0, end: 45).animate(_animationController);
    timer = Timer(Duration(seconds: 2), () {
      setState(() {
        timeDelayControl = true;
      });
    });
  }

  @override
  void dispose() {
    if (timeDelayControl != null) _animationController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (timeDelayControl) _animationController.forward();
    return Container(
      width: context.dynamicHeight(1),
      height: context.dynamicHeight(1),
      color: backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timeDelayControl ? buildAnimatedContainer() : buildContainer(),
        ],
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      child: CircularProgressIndicator(
        backgroundColor: progressColor,
      ),
    );
  }

  Widget buildAnimatedContainer() {
    return AnimatedContainer(
      width: 225,
      height: 50,
      duration: _duration,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: timeDelayControl ? messageBoxBG : backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: _animationApp.value),
                child: CircularProgressIndicator(
                  backgroundColor: progressColor,
                ),
              ),
              Opacity(
                opacity: _animationController.value,
                child: Container(
                  margin: EdgeInsets.only(left: _animationApp2.value),
                  child: Text('custom_long_process'.locale),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
