import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/apps/model/app_count.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:ciphermaster/core/init/network/network_manager.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ciphermaster/views/apps/repository/apps_repository.dart';
import 'package:ciphermaster/views/auth/repository/auth_repository.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';
import 'package:ciphermaster/views/photos/repository/photos_repository.dart';
import 'package:ciphermaster/views/settings/repository/settings_repository.dart';

class BackgroundManager {
  static BackgroundManager _instance;

  static BackgroundManager get instance {
    if (_instance == null) _instance = BackgroundManager._internal();
    return _instance;
  }

  ///
  AppMode appMode = AppMode.BACKGROUND;

  BackgroundManager._internal() {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: android);
    _flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  /// [_networkManager] used to change mode.
  NetworkManager _networkManager = NetworkManager.instance;

  /// [_authRepository] used to sign in.
  AuthRepository _authRepository = AuthRepository.instance;

  /// [_settingsRepository] used to back up settings.
  SettingsRepository _settingsRepository = SettingsRepository.instance;

  /// [_appsRepository] used to back up apps.
  AppsRepository _appsRepository = AppsRepository.instance;

  /// [_photosRepository] used to back up photos.
  PhotosRepository _photosRepository = PhotosRepository.instance;

  /// [isBackedUp] == true when data was backed up.
  bool isBackedUp = false;

  /// Flutter Local Notification
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  Future<void> showNotification(
      String title, String content, bool isPersistent) async {
    final android = AndroidNotificationDetails(
        'my_channel_01', 'Backup Service', 'Backup to Server',
        playSound: false,
        importance: Importance.max,
        priority: Priority.high,
        ongoing: isPersistent);
    final platform = NotificationDetails(android: android);
    await _flutterLocalNotificationsPlugin.show(0, title, content, platform);
  }

  /// -----------------------------------Hidden--------------------------------
}
