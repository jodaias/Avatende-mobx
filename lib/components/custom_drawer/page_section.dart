import 'package:avatende/components/custom_drawer/page_tile.dart';
import 'package:avatende/models/views/user_view_model.dart';
import 'package:avatende/pages/root/root_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {
  final pageStore = GetIt.I<PageStore>();
  final appStore = GetIt.I<AppStore>();
  var _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Home',
          iconData: Icons.home,
          onTap: () => pageStore.setPage(0),
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: appStore.userViewModel.userType == "1"
              ? 'Empresas'
              : 'Departamentos',
          iconData: appStore.userViewModel.userType == "1"
              ? Icons.business
              : Icons.people_alt,
          onTap: () => pageStore.setPage(1),
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Avaliação',
          iconData: Icons.event_available,
          onTap: () => pageStore.setPage(2),
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Relatórios',
          iconData: Icons.event_note,
          onTap: () => pageStore.setPage(3),
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Configurações',
          iconData: Icons.settings,
          onTap: () => pageStore.setPage(4),
          highlighted: pageStore.page == 4,
        ),
        PageTile(
          label: 'Ajuda',
          iconData: Icons.help,
          onTap: () => pageStore.setPage(5),
          highlighted: pageStore.page == 5,
        ),
        PageTile(
          label: 'Sobre',
          iconData: Icons.info,
          onTap: () => pageStore.setPage(6),
          highlighted: pageStore.page == 6,
        ),
        PageTile(
          label: 'Sair',
          iconData: Icons.logout,
          onTap: () {
            UserViewModel userViewModel;
            appStore.setUser(userViewModel);
            _auth.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => RootPage()),
                (route) => false);
          },
          highlighted: pageStore.page == 7,
        ),
      ],
    );
  }
}
