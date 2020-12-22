import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/settings/model/setting.dart';
import 'package:ciphermaster/views/auth/services/auth_local.dart';
import 'package:ciphermaster/views/auth/services/auth_remote.dart';
import 'package:ciphermaster/core/init/network/network_manager.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/views/settings/repository/settings_repository.dart';

class AuthRepository {
  static AuthRepository _instance;

  static AuthRepository get instance {
    if (_instance == null) _instance = AuthRepository._internal();
    return _instance;
  }

  AuthRepository._internal();

  final _networkManager = NetworkManager.instance;
  final _settingsRepository = SettingsRepository.instance;
  final _authLocal = AuthLocal.instance;
  final _authRemote = AuthRemote.instance;

  Future<User> _mailVerified(User user) async {

  }

  Future<User> downloadUser(User signInUser) async {

  }

  Future<List<User>> readUser(AppMode mode) async {

  }

  Future<User> signInWithEmailAndPassword(User signInUser, AppMode mode) async {

  }

  Future<User> createUserWithEmailAndPassword(
      User createUser, AppMode mode) async {

  }

  /// * User will download data when user lost account or when user sign in different account.
  /// **Important**: Don't use other than this !!!
  /// * Kullanıcı hesabını kaybettiğinde veya farklı hesaba girerken kullanılır.
  /// **Important**: Bunun dışında kullanmayın !!!

}
