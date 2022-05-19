import 'package:avatende/app/pages/base/base_page.dart';
import 'package:avatende/app/pages/login/login_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RootPage extends StatefulWidget {
  final String title;
  const RootPage({Key? key, this.title = "Root"}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //use 'controller' variable to access controller
  final appStore = GetIt.I<AppStore>();
  final pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    if (appStore.isAuthenticated &&
        (appStore.userMasterHasAccessGranted() ||
            appStore.userHasAccessGranted() ||
            appStore.userAdminHasAccessGranted())) {
      pageStore.setPage(0);
      return BasePage();
    }
    return LoginPage();
  }
}
