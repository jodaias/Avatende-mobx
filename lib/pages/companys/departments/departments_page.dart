import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/companys/departments/users/users_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DepartmentsPage extends StatefulWidget {
  DepartmentsPage({Key key, this.title = "Departamentos"}) : super(key: key);

  final String title;

  @override
  _DepartmentsPageState createState() => _DepartmentsPageState();
}

class _DepartmentsPageState extends State<DepartmentsPage> {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      drawer: appStore.userModel.userType == "2" ? CustomDrawer() : null,
      title: 'Departamentos',
      actives: 'Departamentos ativos',
      inactives: 'Departamentos inativos',
      button: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UsersPage(),
            ),
          );
        },
        child: Text('Ir para a página de usuários'),
      ),
    );
  }
}
