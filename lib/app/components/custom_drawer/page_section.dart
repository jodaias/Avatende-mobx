import 'package:avatende/app/components/custom_drawer/page_tile.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {
  final pageStore = GetIt.I<PageStore>();
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: appStore.userMasterHasAccessGranted()
            ? <Widget>[
                PageTile(
                  label: 'Home',
                  iconData: Icons.home,
                  onTap: () => pageStore.setPage(0),
                  highlighted: pageStore.page == 0,
                ),
                PageTile(
                  label: 'Empresas',
                  iconData: Icons.business,
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
                  onTap: () async => await appStore.signOut(context),
                  highlighted: false,
                ),
              ]
            : appStore.userAdminHasAccessGranted()
                ? <Widget>[
                    PageTile(
                      label: 'Home',
                      iconData: Icons.home,
                      onTap: () => pageStore.setPage(0),
                      highlighted: pageStore.page == 0,
                    ),
                    PageTile(
                      label: 'Departamentos',
                      iconData: Icons.people_alt,
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
                      onTap: () async => await appStore.signOut(context),
                      highlighted: false,
                    ),
                  ]
                : <Widget>[
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
                      onTap: () async => await appStore.signOut(context),
                      highlighted: false,
                    ),
                  ],
      );
    });
  }
}
