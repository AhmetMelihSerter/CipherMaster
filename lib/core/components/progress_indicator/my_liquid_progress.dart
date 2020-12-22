import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class MyLiquidProgress extends StatefulWidget {
  final String topText;
  final double topTextFontSize;
  final double progressTextFontSize;
  final double begin;
  final double end;
  final double width;
  final double height;
  final Color textColor;
  final Color valueColor;

  const MyLiquidProgress(
      {this.topText = "Progress Name",
      this.topTextFontSize = 18.0,
      this.progressTextFontSize = 20.0,
      this.textColor = ApplicationConstants.SECONDARY_COLOR,
      this.valueColor = ApplicationConstants.PRIMARY_COLOR,
      this.begin = 0,
      this.end = 0.9,
      this.width = 0.3,
      this.height = 0.15});

  @override
  _MyLiquidProgressState createState() => _MyLiquidProgressState();
}

class _MyLiquidProgressState extends State<MyLiquidProgress>
    with SingleTickerProviderStateMixin {
  /// [_backgroundColor] liquid grey color.
  final _backgroundColor = Colors.grey.shade400;

  /// Animation Controller
  AnimationController _animationController;

  /// Animation [begin] and [end] keep.
  Animation<double> _animationApp;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationApp = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(_animationController);
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            widget.topText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.topTextFontSize,
            ),
          ),
        ),
        Container(
          width: context.dynamicWidth(widget.width),
          height: context.dynamicHeight(widget.height),
          child: LiquidCircularProgressIndicator(
            value: _animationApp.value,
            backgroundColor: _backgroundColor,
            valueColor: AlwaysStoppedAnimation(widget.valueColor),
            center: Text(
              "${(_animationApp.value * 100).toInt()}%",
              style: TextStyle(
                color: widget.textColor,
                fontSize: widget.progressTextFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
