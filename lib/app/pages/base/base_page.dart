import 'package:avatende/app/pages/about/about_page.dart';
import 'package:avatende/app/pages/addImages/add_images_page.dart';
import 'package:avatende/app/pages/avaliation/ads_page.dart';
import 'package:avatende/app/pages/companys/companys_page.dart';
import 'package:avatende/app/pages/departments/departments_page.dart';
import 'package:avatende/app/pages/help/help_page.dart';
import 'package:avatende/app/pages/home/home_page.dart';
import 'package:avatende/app/pages/relatory/relatory_page.dart';
import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/pages/settingsP/settings_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key, this.title = "Base"}) : super(key: key);

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
      (int page) {
        if (pageController.hasClients) pageController.jumpToPage(page);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Observer(builder: (_) {
      return PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: appStore.userMasterHasAccessGranted()
            ? <Widget>[
                HomePage(),
                CompanysPage(),
                HelpPage(),
                AboutPage(),
                SettingsPage(),
                RootPage(),
              ]
            : appStore.userAdminHasAccessGranted()
                ? <Widget>[
                    HomePage(),
                    DepartmentsPage(
                      companyId: appStore.userViewModel!.companyId,
                    ),
                    RelatoryPage(),
                    AddImagesPage(),
                    HelpPage(),
                    AboutPage(),
                    SettingsPage(),
                    RootPage(),
                  ]
                : appStore.userHasAccessGranted()
                    ? [
                        HomePage(),
                        AdsPage(),
                        HelpPage(),
                        AboutPage(),
                        SettingsPage(),
                        RootPage(),
                      ]
                    : [],
      );
    }));
  }
}
