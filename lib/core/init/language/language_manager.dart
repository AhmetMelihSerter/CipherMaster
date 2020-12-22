import 'package:flutter/material.dart';

class LanguageManager {
  static LanguageManager _instance = LanguageManager._internal();
  static LanguageManager get instance => _instance;

  LanguageManager._internal();

  final enLocale = Locale('en', 'US');
  final trLocale = Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
