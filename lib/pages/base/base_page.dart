import 'package:avatende/pages/companys/companys_page.dart';
import 'package:avatende/pages/companys/departments/departments_page.dart';
import 'package:avatende/pages/home/home_page.dart';
import 'package:avatende/pages/root/root_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BasePage extends StatefulWidget {
  BasePage({Key key, this.title = "Base"}) : super(key: key);

  final String title;

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final pageController = PageController();

  final appStore = GetIt.I<AppStore>();
  final pageStore = GetIt.I<PageStore>();

  @override
  initState() {
    super.initState();
    reaction(
      (_) => pageStore.page,
      (page) => pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        HomePage(),
        appStore.userModel.userType == "1" ? CompanysPage() : DepartmentsPage(),
        CompanysPage(),
        CompanysPage(),
        CompanysPage(),
        CompanysPage(),
        CompanysPage(),
        CompanysPage(),
        RootPage(),
      ],
    ));
  }
}
