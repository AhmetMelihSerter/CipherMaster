import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/core/components/card/my_card.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/enums/app_mode_enum.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';
import 'package:ciphermaster/views/photos/view_model/photos_view_model.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/core/components/progress_indicator/my_liquid_progress.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  ///
  final settingsKey = Key('settings');

  ///
  AuthViewModel _authViewModel;

  ///
  AppsViewModel _appsViewModel;

  ///
  PhotosViewModel _photosViewModel;

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _appsViewModel = Provider.of<AppsViewModel>(context);
    _photosViewModel = Provider.of<PhotosViewModel>(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          MyCard(
            child: Column(
              children: [
                buildFirstCardFirst(),
                buildFirstCardLast(),
              ],
            ),
          ),
          SizedBox(
            height: context.dynamicHeight(0.02),
          ),
          MyCard(
            child: Column(
              children: [
                buildSecondCardFirst(),
                buildSecondCardLast(),
              ],
            ),
          )
        ],
      ),
    );
  }

 ///------------------------------hidden------------------------------
}
