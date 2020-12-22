import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/scheduler.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/photos/view_model/photos_view_model.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/core/components/alert_dialog/platform_alert_dialog.dart';
import 'package:ciphermaster/core/components/float_action_button/my_floating_action_button.dart';

class PhotosView extends StatefulWidget {
  @override
  _PhotosViewState createState() => _PhotosViewState();
}

class _PhotosViewState extends State<PhotosView> {
  /// [_scrollController] Grid View ScrollController
  final _scrollController = ScrollController();

  ///
  AuthViewModel _authViewModel;

  ///
  PhotosViewModel _photosViewModel;


  Future<void> addControl() async {
   
  }

  /// [Timer] Internet check is done every 5 seconds
  Future<void> getPhotos() async {
   
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getPhotos();
    });
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        getPhotos();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _photosViewModel = Provider.of<PhotosViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('photos_app_bar'.locale),
      ),
      floatingActionButton: MyFloatingActionButton(
        onPressed: buildShowModalBottomSheet,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: context.dynamicHeight(0.01),
              ),
              buildGridView(),
            ],
          ),
          _photosViewModel.progressControl(),
        ],
      ),
    );
  }

  void buildShowModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 55.0 * 2.0,
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('photos_show_modal'.locale),
                onTap: addControl,
              ),
            ],
          ),
        );
      },
    );
  }

  ///-----------------------hidden----------------------
}
