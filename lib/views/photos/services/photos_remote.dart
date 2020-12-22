import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:ciphermaster/core/init/services/firebase_cloud_manager.dart';
import 'package:ciphermaster/views/photos/storage/photos_remote_storage.dart';
import 'package:ciphermaster/views/photos/services/photos_base_services.dart';

class PhotosRemote implements PhotosBaseServices {
  static PhotosRemote _instance;

  static PhotosRemote get instance {
    if (_instance == null) _instance = PhotosRemote._internal();
    return _instance;
  }

  PhotosRemote._internal();

  final _firebaseManager = FirebaseCloudManager.instance;
  final _photosRemoteStorage = PhotosRemoteStorage.instance;

  @override
  Future<Photo> createPhoto(
      User signInUser, Photo insertedPhoto, Function stateControl) async {

  }

  @override
  Future<Photo> deletePhoto(
      User signInUser, Photo deletedPhoto, Function stateControl) async {

  }

  Future<Photo> getPhoto(User signInUser, Photo lastPhoto) async {

  }

  Future<PhotoCount> readPhotoCount(User user) async {

  }

  Future<void> _incrementPhotoCount(User signInUser) async {

  }

  Future<void> _decrementPhotoCount(User signInUser) async {

  }
}
