import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/photos/storage/i_photos_storage.dart';
import 'package:ciphermaster/core/init/storage/local_storage_manager.dart';
import 'package:ciphermaster/views/photos/storage/photos_cache_storage.dart';

class PhotosLocalStorage implements IPhotosStorage {
  static PhotosLocalStorage _instance;

  static PhotosLocalStorage get instance {
    if (_instance == null) _instance = PhotosLocalStorage._internal();
    return _instance;
  }

  PhotosLocalStorage._internal();

  final _storageLocalManager = LocalStorageManager.instance;
  final _cacheStorageManager = PhotosCacheStorage.instance;

  @override
  Future<String> createPhoto(User signInUser, Photo insertedPhotos) async {

  }

  Future<String> updatePhoto(User signInUser, Photo updatedPhotos) async {

  }

  @override
  Future<String> deletePhoto(User signInUser, Photo deletedPhoto) async {

  }
}
