import 'package:flutter/material.dart';

extension ColorExtension on Color{

  String toHex(Color color) => '#${color.value.toRadixString(16).substring(2)}';

}