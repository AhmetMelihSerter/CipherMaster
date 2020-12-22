import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/core/base/model/base_model.dart';
import 'package:ciphermaster/core/init/services/local_db_manager.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';
import 'package:ciphermaster/views/photos/storage/photos_local_storage.dart';
import 'package:ciphermaster/views/photos/services/photos_base_services.dart';

class PhotosLocal implements PhotosBaseServices {
  static PhotosLocal _instance;

  static PhotosLocal get instance {
    if (_instance == null) _instance = PhotosLocal._internal();
    return _instance;
  }

  PhotosLocal._internal();

  final _dbManager = LocalDbManager.instance;
  final _photosStorage = PhotosLocalStorage.instance;

  Future<Photo> _getPhoto(int photoID) async {

  }

  @override
  Future<Photo> createPhoto(
      User signInUser, Photo insertedPhoto, Function stateControl) async {

  }

  Future<Photo> updatePhoto(
      User signInUser, Photo updatedPhoto, Function stateControl) async {

  }

  @override
  Future<Photo> deletePhoto(
      User signInUser, Photo deletedPhoto, Function stateControl) async {

  }

  Future<List<Photo>> readPhotos(User signInUser, Photo lastPhoto,
      int getPhotoCount, Function stateControl) async {

  }

  Future<List<Photo>> backUpPhoto(
      User signInUser, Function stateControl) async {

  }

  Future<PhotoCount> readPhotoCount(User user) async {

  }
}
