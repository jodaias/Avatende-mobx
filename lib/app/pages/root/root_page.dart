import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/pages/base/base_page.dart';
import 'package:avatende/app/pages/login/login_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
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
    if (_auth.currentUser != null &&
        (userMasterHasAccessGranted() ||
            userHasAccessGranted() ||
            userAdminAccessGranted())) {
      pageStore.setPage(0);
      return BasePage();
    }
    return LoginPage();
  }

  bool userMasterHasAccessGranted() =>
      appStore.userViewModel != null &&
      appStore.userViewModel.userType == UserType.Master &&
      appStore.userViewModel.active;

  bool userAdminAccessGranted() =>
      appStore.userViewModel != null &&
      appStore.userViewModel.userType == UserType.Admin &&
      appStore.companyViewModel.active &&
      appStore.userViewModel.active;

  bool userHasAccessGranted() =>
      appStore.userViewModel != null &&
      appStore.userViewModel.userType == UserType.User &&
      appStore.companyViewModel.active &&
      appStore.departmentViewModel.active &&
      appStore.userViewModel.active;
}
