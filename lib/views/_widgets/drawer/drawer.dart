/* import 'package:flutter/material.dart';
import 'package:ciphermaster/views/_model/user.dart';
import 'package:ciphermaster/views/apps/view/apps_view.dart';
import 'package:ciphermaster/views/main/view/main_view.dart';
import 'package:ciphermaster/views/login/view/login_view.dart';
import 'package:ciphermaster/views/about/view/about_view.dart';
import 'package:ciphermaster/views/photos/view/photos_view.dart';
import 'package:ciphermaster/views/profile/view/profile_view.dart';
import 'package:ciphermaster/views/folders/view/folders_view.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';

@Deprecated
class AppDrawer extends StatelessWidget{

  final User _user;
  AppDrawer(this._user);


  _activePage(BuildContext context, String activePage, String pages) {

    if (activePage == pages) {
      Navigator.pop(context);
    } else {
      Navigator.of(context).pushNamed(pages);
    }
  }
  Color _activePageColor(String activePage, String pages) {
    if (activePage == pages) {
      return ApplicationConstants.PRIMARY_COLOR;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String pageName = ModalRoute.of(context).settings.name;
    return Drawer(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => _activePage(context, pageName, ProfileView.routeName),
            /// GestureDetector eklememizin sebebi kullanıcı profil
            /// resmine basarsa settings sayfasına gitsin fakat settings
            /// sayfasında ise drawer kapansın.
            child: UserAccountsDrawerHeader(
              accountName: Text(_user.personName),
              accountEmail: Text(_user.mail),
              //currentAccountPicture: _photoControl(_user.personPhotoPath),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                InkWell(
                  onTap: () => _activePage(context, pageName, AppsView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: _activePageColor(pageName, MainView.routeName),
                    ),
                    title: Text("Main"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, MainView.routeName),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () => _activePage(context, pageName, AppsView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.apps,
                      color: _activePageColor(pageName, AppsView.routeName),
                    ),
                    title: Text("Apps"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, AppsView.routeName),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _activePage(context, pageName, PhotosView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.photo,
                      color: _activePageColor(pageName, PhotosView.routeName),
                    ),
                    title: Text("Photos"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, PhotosView.routeName),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _activePage(context, pageName, FoldersView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.folder,
                      color: _activePageColor(pageName, FoldersView.routeName),
                    ),
                    title: Text("Folders"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, FoldersView.routeName),
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                ),
                InkWell(
                  onTap: () => _activePage(context, pageName, ProfileView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: _activePageColor(pageName, ProfileView.routeName),
                    ),
                    title: Text("Settings"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, ProfileView.routeName),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => _activePage(context, pageName, AboutView.routeName),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: _activePageColor(pageName, AboutView.routeName),
                    ),
                    title: Text("About"),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: _activePageColor(pageName, AboutView.routeName),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginView.routeName);
                  },
                  child: ListTile(
                    leading: Icon(Icons.power_settings_new),
                    title: Text("Sign Out"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 */