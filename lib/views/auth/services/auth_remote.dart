import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/core/base/model/base_count.dart';
import 'package:ciphermaster/views/apps/model/app_count.dart';
import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:ciphermaster/core/init/services/firebase_cloud_manager.dart';
import 'package:ciphermaster/views/auth/services/auth_base_services.dart';

class AuthRemote implements AuthBaseServices {
  static AuthRemote _instance;

  static AuthRemote get instance {
    if (_instance == null) _instance = AuthRemote._internal();
    return _instance;
  }

  AuthRemote._internal();

  final _firebaseManager = FirebaseCloudManager.instance;

  /// The method is FirebaseAuth.
  /// * if [mailVerified] == 1 keep working
  /// * if [mailVerified] == 1 throw exception
  Future<User> signInAuth(User signInUser) async {

  }

  @override
  Future<User> signInWithEmailAndPassword(User signInUser) async {

  }

  Future<User> updateUser(User updatedUser) async {

  }

  Future<void> _signUpAuth(User createUser) async {

  }

  @override
  Future<User> createUserWithEmailAndPassword(User createUser) async {

  }

  Future<void> _createAppCount(User createUser) async {

  }

  Future<void> _createPhotoCount(User createUser) async {

  }
}
