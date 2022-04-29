import 'package:avatende/app/components/custom_drawer/page_tile.dart';
import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {
  final pageStore = GetIt.I<PageStore>();
  final appStore = GetIt.I<AppStore>();
  final _auth = FirebaseAuth.instance;

  bool isAtendente() {
    if (appStore.userViewModel.userType == UserType.User) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: !isAtendente()
            ? [
                PageTile(
                  label: 'Home',
                  iconData: Icons.home,
                  onTap: () => pageStore.setPage(0),
                  highlighted: pageStore.page == 0,
                ),
                PageTile(
                  label: appStore.userViewModel.userType == UserType.Master
                      ? 'Empresas'
                      : 'Departamentos',
                  iconData: appStore.userViewModel.userType == UserType.Master
                      ? Icons.business
                      : Icons.people_alt,
                  onTap: () => pageStore.setPage(1),
                  highlighted: pageStore.page == 1,
                ),
                PageTile(
                  label: 'Relatórios',
                  iconData: Icons.event_note,
                  onTap: () => pageStore.setPage(2),
                  highlighted: pageStore.page == 2,
                ),
                PageTile(
                  label: 'Add Imagens',
                  iconData: Icons.add_a_photo_rounded,
                  onTap: () => pageStore.setPage(3),
                  highlighted: pageStore.page == 3,
                ),
                PageTile(
                  label: 'Ajuda',
                  iconData: Icons.help,
                  onTap: () => pageStore.setPage(4),
                  highlighted: pageStore.page == 4,
                ),
                PageTile(
                  label: 'Sobre',
                  iconData: Icons.info,
                  onTap: () => pageStore.setPage(5),
                  highlighted: pageStore.page == 5,
                ),
                PageTile(
                  label: 'Configurações',
                  iconData: Icons.settings,
                  onTap: () => pageStore.setPage(6),
                  highlighted: pageStore.page == 6,
                ),
                PageTile(
                  label: 'Sair',
                  iconData: Icons.logout,
                  onTap: () async {
                    appStore.setUser(new UserViewModel());
                    await _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => RootPage()),
                        (route) => false);
                  },
                  highlighted: pageStore.page == 7,
                ),
              ]
            : [
                PageTile(
                  label: 'Home',
                  iconData: Icons.home,
                  onTap: () => pageStore.setPage(0),
                  highlighted: pageStore.page == 0,
                ),
                PageTile(
                  label: 'Avaliação',
                  iconData: Icons.event_available,
                  onTap: () => pageStore.setPage(1),
                  highlighted: pageStore.page == 1,
                ),
                PageTile(
                  label: 'Ajuda',
                  iconData: Icons.help,
                  onTap: () => pageStore.setPage(2),
                  highlighted: pageStore.page == 2,
                ),
                PageTile(
                  label: 'Sobre',
                  iconData: Icons.info,
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
                  label: 'Sair',
                  iconData: Icons.logout,
                  onTap: () async {
                    await _auth.signOut();
                    appStore.setUser(new UserViewModel());
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => RootPage()),
                        (route) => false);
                  },
                  highlighted: pageStore.page == 5,
                ),
              ],
      );
    });
  }
}
