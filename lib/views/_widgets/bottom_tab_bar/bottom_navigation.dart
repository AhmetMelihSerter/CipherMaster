import 'package:flutter/cupertino.dart';
import 'package:ciphermaster/core/constants/app/app_constants.dart';
import 'package:ciphermaster/core/constants/enums/app_menu_enum.dart';
import 'package:ciphermaster/core/init/navigation/navigation_route.dart';
import 'package:ciphermaster/views/_widgets/bottom_tab_bar/tab_items.dart';

class BottomNavigation extends StatelessWidget {
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> pageCreate;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  const BottomNavigation(
      {@required this.currentTab,
      @required this.onSelectedTab,
      @required this.pageCreate,
      @required this.navigatorKeys});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          _navItemCreate(TabItem.MainPage),
          _navItemCreate(TabItem.AppsPage),
          _navItemCreate(TabItem.PhotosPage),
          _navItemCreate(TabItem.FoldersPage),
        ],
        onTap: (index) => onSelectedTab(TabItem.values[index]),
        activeColor: ApplicationConstants.PRIMARY_COLOR,
      ),
      tabBuilder: (context, index) {
        final showItem = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[showItem],
          builder: (context) {
            return pageCreate[showItem];
          },
          //routes: NavigationRoute.instance.routes,
          onGenerateRoute: NavigationRoute.instance.generateRoute,
        );
      },
    );
  }

  BottomNavigationBarItem _navItemCreate(TabItem tabItem) {
    final createTab = TabItemData.allTab[tabItem];

    return BottomNavigationBarItem(
      icon: Icon(createTab.icon),
      label: createTab.title,
    );
  }
}
