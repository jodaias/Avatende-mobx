import 'package:avatende/pages/avaliation/avaliation_page.dart';
import 'package:avatende/pages/base/base_page.dart';
import 'package:avatende/pages/login/login_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RootPage extends StatefulWidget {
  final String title;
  const RootPage({Key key, this.title = "Root"}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  var _auth = FirebaseAuth.instance;

  //use 'controller' variable to access controller
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    print('usertype root: ${appStore.userViewModel?.userType}');
    if (_auth.currentUser != null) {
      if (appStore.userViewModel?.userType == "3" ||
          appStore.userViewModel?.userType == "3-Dev") {
        return AvaliationPage();
      }
      return BasePage();
    } else {
      return LoginPage();
    }
  }
}
