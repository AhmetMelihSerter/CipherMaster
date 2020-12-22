import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cryptociphersoftware/views/_model/user.dart';
import 'package:cryptociphersoftware/core/base/model/base_model.dart';
import 'package:cryptociphersoftware/core/init/services/local_db_manager.dart';
import 'package:cryptociphersoftware/views/auth/services/auth_base_services.dart';
import 'package:cryptociphersoftware/core/constants/enums/service_state_enum.dart';

class AuthLocal implements AuthBaseServices {
  static AuthLocal _instance = AuthLocal._internal();
  static AuthLocal get instance => _instance;

  AuthLocal._internal();

  final _dbManager = LocalDbManager.instance;

  Future<User> _getUser(int userID) async {

  }

  Future<List<User>> readUser() async {

  }

  @override
  Future<User> signInWithEmailAndPassword(User signInUser) async {

  }

  // * This method is used when the email is verified. Don't use other than that.
  Future<User> updateUser(User updatedUser) async {

  }

  @override
  Future<User> createUserWithEmailAndPassword(User createUser) async {

  }
}
