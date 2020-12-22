import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class AppThemeLight {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._internal();
    return _instance;
  }

  AppThemeLight._internal();

  ThemeData get themeData {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
      brightness: Brightness.light,
      primaryColor: ApplicationConstants.PRIMARY_COLOR,
      accentColor: ApplicationConstants.SECONDARY_COLOR,
      cursorColor: ApplicationConstants.PRIMARY_COLOR,
      focusColor: ApplicationConstants.PRIMARY_COLOR,
      scaffoldBackgroundColor: ApplicationConstants.SECONDARY_COLOR,
    );
  }
}
