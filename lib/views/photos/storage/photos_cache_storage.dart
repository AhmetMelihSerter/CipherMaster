import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/core/init/storage/cache_storage_manager.dart';

class PhotosCacheStorage {
  static PhotosCacheStorage _instance;

  static PhotosCacheStorage get instance {
    if (_instance == null) _instance = PhotosCacheStorage._internal();
    return _instance;
  }

  PhotosCacheStorage._internal();

  final _cacheManager = CacheStorageManager.instance;

  Future<String> createSelectedPhoto(User signInUser, ByteData photo) async {

  }

  /// * Photos are cached on first login.
  Future<String> downloadPhoto(User signInUser, Photo insertedPhoto, Uint8List avatar) async {

  }

  Future<String> deletePhoto(Photo deletedPhoto) async {

  }

}
