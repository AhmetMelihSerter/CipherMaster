import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptociphersoftware/core/components/float_action_button/my_floating_action_button.dart';
class FoldersView extends StatelessWidget {

  /// [heroTag] bottom navigation bar butonlar çakışmaması için bütün sayfalarda null veya farklı isim verilir.
  @override
  Widget build(BuildContext context) {
    //final _userModel = Provider.of<UserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Folder Page"),
      ),
      floatingActionButton: MyFloatingActionButton(
        onPressed:() {
            //_appsModel.processApp = App();
            //Navigator.of(context).pushNamed(AppsAddPage.routeName);
          },
      ),
      body: Stack(
        children: [
          Container(),
        ],
      ),
    );
  }
}
