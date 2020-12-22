import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/views/_model/photo_select.dart';
import 'package:ciphermaster/views/photos/model/photo_count.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/core/base/view_model/base_view_model.dart';
import 'package:ciphermaster/core/constants/enums/view_state_enum.dart';
import 'package:ciphermaster/views/photos/repository/photos_repository.dart';

class PhotosViewModel extends BaseViewModel {

  /// [maxVisibleAppCount] The number of photos that will appear on the screen
  final int maxVisiblePhotoCount = 20;

  ///
  final photosApi = PhotoSelect(imageCount: 25, quality: 80);

  ///
  final _photosRepository = PhotosRepository.instance;

  ///
  Photo processPhoto;

  ///
  int heroPhoto;

  ///
  bool hasMorePhoto = true;

  ///
  PhotoCount photoCount;

  ///
  bool _show = true;

  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }

  void signOut() {
    _photosList.clear();
    hasMorePhoto = true;
    photoCount = null;
  }


  void sortList() =>
      _photosList.sort((b, a) => a.updateDate.compareTo(b.updateDate));

  Future<void> _downloadPhotos(User signInUser) async {

  }

  Future<void> addPhoto(User user) async {

  }

  Future<void> deletePhoto(User user) async {

  }

  Future<void> getPhotos(User user) async {

  }

  Future<void> sharePhoto() async {
    await Share.file('ciphermaster', 'photo.png',
        await File(processPhoto.photo).readAsBytes(), 'image/png');
  }

  Future<void> savePhoto() async {
    await GallerySaver.saveImage(processPhoto.photo);
  }

  Future<void> readPhotoCount(User user, AppMode mode) async {
    photoCount = await _photosRepository.readPhotoCount(user, mode);
  }
}
