import 'package:flutter/material.dart';
import 'package:ciphermaster/core/extensions/string_extension.dart';
import 'package:ciphermaster/core/constants/enums/app_menu_enum.dart';

class TabItemData {

  final String title;
  final IconData icon;

  TabItemData(this.title, this.icon);

  static Map<TabItem, TabItemData> allTab = {
    TabItem.MainPage: TabItemData('main_app_bar'.locale, Icons.home),
    TabItem.AppsPage: TabItemData('apps_app_bar'.locale, Icons.apps),
    TabItem.PhotosPage: TabItemData('photos_app_bar'.locale, Icons.photo),
    TabItem.FoldersPage: TabItemData('folders_app_bar'.locale, Icons.folder),
  };
}
