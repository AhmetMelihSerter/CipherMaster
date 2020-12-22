import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/views/apps/model/app.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/components/avatar/my_avatar.dart';
import 'package:ciphermaster/core/extensions/context_extension.dart';
import 'package:ciphermaster/core/constants/enums/apps_sort_enum.dart';
import 'package:ciphermaster/core/constants/error/error_constants.dart';
import 'package:ciphermaster/views/auth/view_model/auth_view_model.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';
import 'package:ciphermaster/core/components/textbox/my_textformfield.dart';
import 'package:ciphermaster/core/constants/navigation/navigation_constants.dart';
import 'package:ciphermaster/core/components/float_action_button/my_floating_action_button.dart';

class AppsView extends StatefulWidget {
  @override
  _AppsViewState createState() => _AppsViewState();
}

class _AppsViewState extends State<AppsView> {
  /// [_focusSearch] Search Node
  final _focusSearch = FocusNode();

  /// [_scrollController] Grid View ScrollController
  final _scrollController = ScrollController();

  ///
  AuthViewModel _authViewModel;

  ///
  AppsViewModel _appsViewModel;

  /// [Timer] Internet check is done every 5 seconds
  Future<void> getApps() async {
    try {
      await _appsViewModel.getApps(_authViewModel.user);
    } on PlatformException catch (e) {
      debugPrint(e.code.toString());
      MyToast(toastText: ErrorConstants.error(e.code)).show(context);
      Timer(Duration(seconds: 5), () => getApps());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getApps();
    });
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        getApps();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _authViewModel = Provider.of<AuthViewModel>(context);
    _appsViewModel = Provider.of<AppsViewModel>(context);
    return GestureDetector(
      onTap: () => _focusSearch.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('apps_app_bar'.locale),
        ),
        floatingActionButton: MyFloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(NavigationConstants.appsAddView);
          },
        ),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                buildTitleAndSort(),
                SizedBox(
                  height: context.dynamicHeight(0.01),
                ),
                buildListView(),
                //buildGridView(),
              ],
            ),
            _appsViewModel.progressControl(),
          ],
        ),
      ),
    );
  }
 ///------------------hidden-----------------------------------
}
