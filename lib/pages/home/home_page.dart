import 'package:avatende/components/custom_card/custom_card.dart';
import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/perfil/perfil_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title = 'Home'}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageStore = GetIt.I<PageStore>();
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    pageStore.setPage(0);
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Inicio linha - 01
              Row(
                children: [
                  CustomCard(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PerfilPage())),
                    label: 'Perfil',
                    iconData: Icons.person,
                    edgeInsets: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                      left: 18.0,
                      right: 18.0,
                    ),
                  ),

                  ///Dividimento dos cards
                  CustomCard(
                    onTap: () => pageStore.setPage(1),
                    label: appStore.userViewModel.userType == "1"
                        ? 'Empresas'
                        : 'Departamentos',
                    iconData: appStore.userViewModel.userType == "1"
                        ? Icons.business
                        : Icons.people_alt,
                    edgeInsets: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                  ),
                ],
              ),
              //Dividimento da Linha - 02
              Row(
                children: [
                  CustomCard(
                    onTap: () => pageStore.setPage(2),
                    label: 'Avaliação',
                    iconData: Icons.receipt_long_sharp,
                    edgeInsets: EdgeInsets.only(
                      left: 18.0,
                      right: 18.0,
                      bottom: 20.0,
                    ),
                  ),

                  ///Dividimento dos cards
                  CustomCard(
                    onTap: () => pageStore.setPage(3),
                    label: 'Relatórios',
                    iconData: Icons.event_available_outlined,
                    edgeInsets: EdgeInsets.only(
                      bottom: 20.0,
                    ),
                  ),
                ],
              ),

              //Dividimento da Linha - 03

              Row(
                children: [
                  CustomCard(
                    onTap: () => pageStore.setPage(4),
                    label: 'Configurações',
                    iconData: Icons.info,
                    edgeInsets: EdgeInsets.only(
                      bottom: 20.0,
                      left: 18.0,
                      right: 18.0,
                    ),
                  ),

                  ///Dividimento dos cards
                  CustomCard(
                    onTap: () => pageStore.setPage(5),
                    label: 'Ajuda',
                    iconData: Icons.help,
                    edgeInsets: EdgeInsets.only(
                      bottom: 20.0,
                    ),
                  ),
                ],
              ),
              //Dividimento da Linha - 04
              Row(
                children: [
                  CustomCard(
                    onTap: () => pageStore.setPage(6),
                    label: 'Sobre',
                    iconData: Icons.settings,
                    edgeInsets: EdgeInsets.only(
                      bottom: 20.0,
                      left: 18.0,
                      right: 18.0,
                    ),
                  ),

                  ///Dividimento dos cards
                ],
              ),
            ],
          ),
        ));
  }
}
