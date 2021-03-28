import 'package:avatende/pages/avaliation/avaliation_page.dart';
import 'package:avatende/pages/base/base_page.dart';
import 'package:avatende/pages/login/login_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';
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
  final pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      pageStore.setPage(0);
      if (appStore.userViewModel.userType == 'Admin' ||
          appStore.userViewModel.userType == 'Admin-Dev') {
        if (appStore.companyViewModel.active && appStore.userViewModel.active) {
          return BasePage();
        } else {
          return LoginPage();
        }
      } else if (appStore.userViewModel.userType == 'Atendente' ||
          appStore.userViewModel.userType == 'Atendente-Dev') {
        if (appStore.companyViewModel.active &&
            appStore.departmentViewModel.active &&
            appStore.userViewModel.active) {
          return BasePage();
        } else {
          return LoginPage();
        }
      } else {
        return BasePage();
      }
    } else {
      return LoginPage();
    }
  }
}
