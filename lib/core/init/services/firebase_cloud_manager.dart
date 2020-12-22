import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

class FirebaseCloudManager {
  static FirebaseCloudManager _instance = FirebaseCloudManager._internal();

  static FirebaseCloudManager get instance => _instance;

  FirebaseCloudManager._internal();

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  // * User First Login Tester
  Future<void> deleteAuth(String cloudID) async {
    if (ApplicationConstants.ISTEST) {
      Timer(Duration(seconds: 5), () async {
        await firestore.collection("users").doc(cloudID).delete();
        await firebaseAuth.currentUser.delete();
      });
    }
  }
}
