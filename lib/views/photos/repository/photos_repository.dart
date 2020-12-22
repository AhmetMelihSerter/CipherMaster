import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:ciphermaster/core/init/network/network_manager.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/views/photos/services/photos_local.dart';
import 'package:ciphermaster/views/photos/services/photos_remote.dart';
import 'package:ciphermaster/core/constants/enums/service_state_enum.dart';

class PhotosRepository {
  static PhotosRepository _instance;

  static PhotosRepository get instance {
    if (_instance == null) _instance = PhotosRepository._internal();
    return _instance;
  }

  final _networkManager = NetworkManager.instance;
  final _photosLocal = PhotosLocal.instance;
  final _photosRemote = PhotosRemote.instance;

  PhotosRepository._internal();

  Future<Photo> downloadPhotos(User signInUser, Photo lastPhoto) async {

  }

  Future<Photo> addPhoto(
      User signInUser, Photo insertedPhoto, AppMode mode) async {

  }

  Future<Photo> deletePhoto(
      User signInUser, Photo deletedPhoto, AppMode mode) async {

  }

  Future<List<Photo>> readPhotos(
      User signInUser, Photo lastPhoto, int getPhotoCount, AppMode mode) async {

  }

  Future<PhotoCount> readPhotoCount(User user, AppMode mode) async {

  }
}
