import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/departments/users/users_page.dart';
import 'package:avatende/pages/signup/signup_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum ActivesOrOrderBy {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title = "Departamentos"}) : super(key: key);

  final String title;

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final appStore = GetIt.I<AppStore>();

  bool active = true;
  bool orderZA = true;

  void _activeOrOrderList(ActivesOrOrderBy result) {
    switch (result) {
      case ActivesOrOrderBy.actives:
        print('Departamentos ativos');
        setState(() {
          active = true;
        });
        break;
      case ActivesOrOrderBy.inactives:
        print('Departamentos inativos');
        setState(() {
          active = false;
        });
        break;
      case ActivesOrOrderBy.orderByAZ:
        print('Departamentos ordenados de A a Z');
        setState(() {
          orderZA = true;
        });
        break;
      case ActivesOrOrderBy.orderByZA:
        print('Departamentos ordenados de Z a A');
        setState(() {
          orderZA = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appStore.userModel.userType == "2" ? CustomDrawer() : null,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orangeAccent,
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: Colors.purple[400],
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          }),
      appBar: AppBar(
        title: Text('Departamentos'),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: PopupMenuButton<ActivesOrOrderBy>(
              itemBuilder: (context) => <PopupMenuEntry<ActivesOrOrderBy>>[
                const PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Departamentos Ativos'),
                  value: ActivesOrOrderBy.actives,
                ),
                const PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Departamentos Inativos'),
                  value: ActivesOrOrderBy.inactives,
                ),
                const PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Ordenar de A-Z'),
                  value: ActivesOrOrderBy.orderByAZ,
                ),
                const PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Ordenar de Z-A'),
                  value: ActivesOrOrderBy.orderByZA,
                ),
              ],
              onSelected: _activeOrOrderList,
              child: Icon(
                Icons.more_vert,
                color: Colors.orangeAccent,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UsersPage(),
              ),
            );
          },
          child: Text('ir para a página de usuarios'),
        ),
      ),
    );
  }
}
