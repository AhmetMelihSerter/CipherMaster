import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/core/constants/enums/view_state_enum.dart';
import 'package:ciphermaster/core/components/progress_indicator/my_circular_progress.dart';

abstract class BaseViewModel extends ChangeNotifier {

  AppMode appMode = AppMode.FOREGROUND;

  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  Locale _locale;

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
  // ---------------------------------------- Hidden--------------------------
}
