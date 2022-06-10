import 'package:avatende/app/components/custom_card/custom_card.dart';
import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/pages/perfil/perfil_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title = 'Home'}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageStore = GetIt.I<PageStore>();
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
            children: appStore.userMasterHasAccessGranted()
                ? listCardMaster(context)
                : appStore.userAdminHasAccessGranted()
                    ? listCardAdmin(context)
                    : appStore.userHasAccessGranted()
                        ? listCardUser(context)
                        : []),
      ),
    );

    //  SingleChildScrollView(
    //   child: Observer(
    //     builder: (_) {
    //       return Column(
    //         children: appStore.userMasterHasAccessGranted()
    //             //Se é User master
    //             ? <Widget>[
    //                 //Inicio linha - 01
    //                 Row(
    //                   children: [
    //                     CustomCard(
    //                       onTap: () => Navigator.push(
    //                           context,
    //                           MaterialPageRoute(
    //                               builder: (_) => PerfilPage())),
    //                       label: 'Perfil',
    //                       iconData: Icons.person,
    //                       edgeInsets: EdgeInsets.only(
    //                         top: screenSize.height * 0.02,
    //                         bottom: screenSize.height * 0.02,
    //                         left: 18.0,
    //                         right: 18.0,
    //                       ),
    //                     ),

    //                     ///Dividimento dos cards
    //                     CustomCard(
    //                       onTap: () => pageStore.setPage(1),
    //                       label: 'Empresas',
    //                       iconData: Icons.business,
    //                       edgeInsets: EdgeInsets.only(
    //                         top: 20.0,
    //                         bottom: 20.0,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 //Dividimento da Linha - 02
    //                 Row(
    //                   children: [
    //                     CustomCard(
    //                       onTap: () => pageStore.setPage(2),
    //                       label: 'Sobre',
    //                       iconData: Icons.info,
    //                       edgeInsets: EdgeInsets.only(
    //                         left: 18.0,
    //                         right: 18.0,
    //                         bottom: 20.0,
    //                       ),
    //                     ),

    //                     ///Dividimento dos cards
    //                     CustomCard(
    //                       onTap: () => pageStore.setPage(3),
    //                       label: 'Ajuda',
    //                       iconData: Icons.help,
    //                       edgeInsets: EdgeInsets.only(
    //                         bottom: 20.0,
    //                       ),
    //                     ),
    //                   ],
    //                 ),

    //                 //Dividimento da Linha - 03

    //                 Row(
    //                   children: [
    //                     CustomCard(
    //                       onTap: () => pageStore.setPage(4),
    //                       label: 'Configurações',
    //                       iconData: Icons.settings,
    //                       edgeInsets: EdgeInsets.only(
    //                         bottom: 20.0,
    //                         left: 18.0,
    //                         right: 18.0,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ]
    //             : appStore.userAdminHasAccessGranted()
    //                 //Dividimento se é User Admin
    //                 ? <Widget>[
    //                     //Inicio linha - 01
    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (_) => PerfilPage())),
    //                           label: 'Perfil',
    //                           iconData: Icons.person,
    //                           edgeInsets: EdgeInsets.only(
    //                             top: 20.0,
    //                             bottom: 20.0,
    //                             left: 18.0,
    //                             right: 18.0,
    //                           ),
    //                         ),

    //                         ///Dividimento dos cards
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(1),
    //                           label: 'Departamentos',
    //                           iconData: Icons.people_alt,
    //                           edgeInsets: EdgeInsets.only(
    //                             top: 20.0,
    //                             bottom: 20.0,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     //Dividimento da Linha - 02
    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(2),
    //                           label: 'Relatórios',
    //                           iconData: Icons.event_available_outlined,
    //                           edgeInsets: EdgeInsets.only(
    //                             left: 18.0,
    //                             right: 18.0,
    //                             bottom: 20.0,
    //                           ),
    //                         ),

    //                         ///Dividimento dos cards
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(3),
    //                           label: 'Adicionar \nImagens',
    //                           iconData: Icons.add_a_photo_outlined,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: 20.0,
    //                           ),
    //                         ),
    //                       ],
    //                     ),

    //                     //Dividimento da Linha - 03

    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(4),
    //                           label: 'Sobre',
    //                           iconData: Icons.info,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: 20.0,
    //                             left: 18.0,
    //                             right: 18.0,
    //                           ),
    //                         ),

    //                         ///Dividimento dos cards
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(5),
    //                           label: 'Ajuda',
    //                           iconData: Icons.help,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: 20.0,
    //                           ),
    //                         ),
    //                       ],
    //                     ),

    //                     //Dividimento da Linha - 04

    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(6),
    //                           label: 'Configurações',
    //                           iconData: Icons.settings,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: 20.0,
    //                             left: 18.0,
    //                             right: 18.0,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ]
    //                 : //Dividimento se é Atendente
    //                 <Widget>[
    //                     //Inicio linha - 01
    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => Navigator.push(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (_) => PerfilPage())),
    //                           label: 'Perfil',
    //                           iconData: Icons.person,
    //                           edgeInsets: EdgeInsets.only(
    //                             top: screenSize.height * 0.02,
    //                             bottom: screenSize.height * 0.02,
    //                             left: screenSize.width * 0.04,
    //                             right: screenSize.width * 0.04,
    //                           ),
    //                         ),

    //                         ///Dividimento dos cards
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(1),
    //                           label: 'Avaliação',
    //                           iconData: Icons.receipt_long_sharp,
    //                           edgeInsets: EdgeInsets.only(
    //                             top: screenSize.height * 0.02,
    //                             bottom: screenSize.height * 0.02,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     //Dividimento da Linha - 02
    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(2),
    //                           label: 'Ajuda',
    //                           iconData: Icons.help,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: screenSize.height * 0.02,
    //                             left: screenSize.width * 0.04,
    //                             right: screenSize.width * 0.04,
    //                           ),
    //                         ),
    //                         //Dividimento dos cards
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(3),
    //                           label: 'Sobre',
    //                           iconData: Icons.info,
    //                           edgeInsets: EdgeInsets.only(
    //                             bottom: screenSize.height * 0.02,
    //                           ),
    //                         ),
    //                       ],
    //                     ),

    //                     //Dividimento da Linha - 03
    //                     Row(
    //                       children: [
    //                         CustomCard(
    //                           onTap: () => pageStore.setPage(4),
    //                           label: 'Configurações',
    //                           iconData: Icons.settings,
    //                           edgeInsets: EdgeInsets.only(
    //                           bottom: screenSize.height * 0.02,
    //                             left: screenSize.width * 0.04,
    //                             right: screenSize.width * 0.04,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //       );
    //     },
    //   ),
    // ),
  }

  List<Widget> listCardMaster(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return <Widget>[
      //Inicio linha - 01
      Row(
        children: [
          CustomCard(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => PerfilPage())),
            label: 'Perfil',
            iconData: Icons.person,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.02,
            ),
          ),

          ///Dividimento dos cards
          CustomCard(
            onTap: () => pageStore.setPage(1),
            label: 'Empresas',
            iconData: Icons.business,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(2),
            label: 'Sobre',
            iconData: Icons.info,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
        ],
      ),
      //Dividimento da Linha - 02
      Row(
        children: [
          ///Dividimento dos cards
          CustomCard(
            onTap: () => pageStore.setPage(3),
            label: 'Ajuda',
            iconData: Icons.help,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(4),
            label: 'Configurações',
            iconData: Icons.settings,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> listCardAdmin(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return <Widget>[
      //Inicio linha - 01
      Row(
        children: [
          CustomCard(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => PerfilPage())),
            label: 'Perfil',
            iconData: Icons.person,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.02,
            ),
          ),

          ///Dividimento dos cards
          CustomCard(
            onTap: () => pageStore.setPage(1),
            label: 'Departamentos',
            iconData: Icons.people_alt,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(2),
            label: 'Relatórios',
            iconData: Icons.event_available_outlined,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
        ],
      ),
      //Dividimento da Linha - 02
      Row(
        children: [
          ///Dividimento dos cards
          CustomCard(
            onTap: () => pageStore.setPage(3),
            label: 'Adicionar \nImagens',
            iconData: Icons.add_a_photo_outlined,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(4),
            label: 'Sobre',
            iconData: Icons.info,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(5),
            label: 'Ajuda',
            iconData: Icons.help,
            edgeInsets: EdgeInsets.only(
              top: screenSize.height * 0.02,
            ),
          ),
        ],
      ),

      //Dividimento da Linha - 03

      Row(
        children: [
          CustomCard(
            onTap: () => pageStore.setPage(6),
            label: 'Configurações',
            iconData: Icons.settings,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              top: screenSize.height * 0.02,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> listCardUser(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return <Widget>[
      //Inicio linha - 01
      Row(
        children: [
          Wrap(
            direction: Axis.horizontal,
            children: [
              CustomCard(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => PerfilPage())),
                label: 'Perfil',
                iconData: Icons.person,
                edgeInsets: EdgeInsets.only(
                  left: screenSize.width * 0.02,
                  top: screenSize.height * 0.02,
                ),
              ),

              ///Dividimento dos cards
              CustomCard(
                onTap: () => pageStore.setPage(1),
                label: 'Avaliação',
                iconData: Icons.receipt_long_sharp,
                edgeInsets: EdgeInsets.only(
                  top: screenSize.height * 0.02,
                ),
              ),
              CustomCard(
                onTap: () => pageStore.setPage(2),
                label: 'Ajuda',
                iconData: Icons.help,
                edgeInsets: EdgeInsets.only(
                  top: screenSize.height * 0.02,
                ),
              ),
            ],
          )
        ],
      ),
      //Dividimento da Linha - 02
      Row(
        children: [
          //Dividimento dos cards
          CustomCard(
            onTap: () => pageStore.setPage(3),
            label: 'Sobre',
            iconData: Icons.info,
            edgeInsets: EdgeInsets.only(
              left: screenSize.width * 0.02,
              bottom: screenSize.height * 0.02,
            ),
          ),
          CustomCard(
            onTap: () => pageStore.setPage(4),
            label: 'Configurações',
            iconData: Icons.settings,
            edgeInsets: EdgeInsets.only(
              bottom: screenSize.height * 0.02,
            ),
          ),
        ],
      ),
    ];
  }
}
