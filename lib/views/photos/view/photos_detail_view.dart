import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/photos/model/photo.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/photos/view_model/photos_view_model.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';

class PhotosDetailView extends StatefulWidget {
  @override
  _PhotosDetailViewState createState() => _PhotosDetailViewState();
}

class _PhotosDetailViewState extends State<PhotosDetailView> {
  /// [PreferredSize] default [AppBar] height 56
  ///
  AuthViewModel _authViewModel;

  ///
  PhotosViewModel _photosViewModel;

  Future<void> _saveGallery() async {

  }

  Future<void> _sharePhoto() async {

  }

  Future<void> _deletePhoto() async {

  }

  @override
  void initState() {
    super.initState();
    _photosViewModel = Provider.of<PhotosViewModel>(context, listen: false);
    final clonePhotoMap =
        _photosViewModel.findPhoto(_photosViewModel.heroPhoto).toMap();
    _photosViewModel.processPhoto = Photo.fromMap(clonePhotoMap);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _photosViewModel = Provider.of<PhotosViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _photosViewModel.show
          ? AppBar(
              backgroundColor: Colors.black,
            )
          : PreferredSize(
              preferredSize: Size(0.0, 56.0),
              child: Container(),
            ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () => _photosViewModel.show = !(_photosViewModel.show),
              child: InteractiveViewer(
                child: Hero(
                  tag: 'heroPhoto${_photosViewModel.heroPhoto}',
                  child: Image.file(File(_photosViewModel.processPhoto.photo)),
                ),
              ),
            ),
          ),
          _photosViewModel.progressControl(),
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

 ///--------------------------------- hidden-------------------------------
}
