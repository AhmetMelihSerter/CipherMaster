import 'package:flutter/material.dart';

class ApplicationConstants {
  static const APP_NAME = "Cipher Master";
  static const APP_VERSION = "1.0.0";
  static const DESCRIPTION = "Description.";
  static const LANGUAGE_PATH = "assets/translations";

  static const ISTEST = false;

  static const PRIMARY_COLOR = Color(0xFF6200EE);
  static const SECONDARY_COLOR = Colors.white;
  static const MESSAGEBOX_COLOR = Color(0xFFF5F5F5);
  static const TOAST_COLOR = Color(0xEEF1F3F8);

  static const MAIL_REGEXP =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
}
