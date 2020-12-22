import 'dart:io';
import 'package:path/path.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/photos/storage/i_photos_storage.dart';
import 'package:ciphermaster/views/photos/storage/photos_cache_storage.dart';
import 'package:ciphermaster/core/init/storage/firebase_storage_manager.dart';

class PhotosRemoteStorage implements IPhotosStorage {
  static PhotosRemoteStorage _instance;

  static PhotosRemoteStorage get instance {
    if (_instance == null) _instance = PhotosRemoteStorage._internal();
    return _instance;
  }

  PhotosRemoteStorage._internal();

  final _firebaseStorageManager = FirebaseStorageManager.instance;
  final _photosCacheStorage = PhotosCacheStorage.instance;

  Future<String> downloadPhoto(User signInUser, Photo downloadedPhoto) async {

  }

  @override
  Future<String> createPhoto(User signInUser, Photo insertedPhoto) async {

  }

  @override
  Future<String> deletePhoto(User signInUser, Photo deletedPhoto) async {

  }
}
