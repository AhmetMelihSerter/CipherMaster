import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:ciphermaster/core/components/toast/my_toast.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/views/apps/view_model/apps_view_model.dart';

class AppsIconView extends StatefulWidget {
  @override
  _AppsIconViewState createState() => _AppsIconViewState();
}

class _AppsIconViewState extends State<AppsIconView> {
  final _scrollController = ScrollController();

  AppsViewModel _appsViewModel;

  void selectedIcon(int index) {
    MyToast(toastText: 'apps_add_toast_selected'.locale).show(context);
    Navigator.of(context).pop(_appsViewModel.findIcon(index));
  }

  Future<void> getIcon() async {
    await _appsViewModel.getIcon();
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      getIcon();
    });
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {}
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appsViewModel = Provider.of<AppsViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('icon_app_bar'.locale),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2),
              ),
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 2,
                  ),
                  itemCount: _appsViewModel.iconList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () => selectedIcon(index),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                      File(_appsViewModel.findIcon(index))),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          _appsViewModel.progressControl(),
        ],
      ),
    );
  }
}
