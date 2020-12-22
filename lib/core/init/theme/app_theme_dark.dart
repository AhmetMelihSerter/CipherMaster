import 'package:flutter/material.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class AppThemeDark {
  static AppThemeDark _instance;
  static AppThemeDark get instance {
    if (_instance == null) _instance = AppThemeDark._internal();
    return _instance;
  }

  AppThemeDark._internal();

  ThemeData get themeData {
    return ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
      brightness: Brightness.dark,
      primaryColor: ApplicationConstants.PRIMARY_COLOR,
      accentColor: ApplicationConstants.SECONDARY_COLOR,
      cursorColor: ApplicationConstants.PRIMARY_COLOR,
      focusColor: ApplicationConstants.PRIMARY_COLOR,
      scaffoldBackgroundColor: ApplicationConstants.SECONDARY_COLOR,
    );
  }
}
