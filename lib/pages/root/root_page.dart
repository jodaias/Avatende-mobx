import 'package:avatende/pages/base/base_page.dart';
import 'package:avatende/pages/login/login_page.dart';
import 'package:avatende/pages/perfil/perfil_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class RootPage extends StatefulWidget {
  final String title;
  const RootPage({Key key, this.title = "Root"}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //use 'controller' variable to access controller
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    if (appStore.userModel != null) {
      print(
        appStore.userModel.userType == "3" ? 'Avaliable page' : 'Home page',
      );
      return appStore.userModel.userType == "3" ? PerfilPage() : BasePage();
    } else {
      print('Login page');
      return LoginPage();
    }
  }
}
