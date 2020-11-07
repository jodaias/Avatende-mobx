import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
import 'package:avatende/pages/companys/departments/departments_page.dart';
import 'package:avatende/pages/signup/signup_company_page.dart';
import 'package:flutter/material.dart';

enum Actives {
  actives,
  desactives,
}

enum OrderBy {
  orderAZ,
  orderZA,
}

class CompanysPage extends StatefulWidget {
  CompanysPage({Key key, this.title = "Empresas"}) : super(key: key);

  final String title;

  @override
  _CompanysPageState createState() => _CompanysPageState();
}

class _CompanysPageState extends State<CompanysPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      drawer: CustomDrawer(),
      floatingActionButton: CustomFloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SignUpCompanyPage()));
        },
      ),
      title: 'Empresas',
      actives: 'Empresas ativas',
      inactives: 'Empresas inativas',
      widget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DepartmentsPage(),
                ),
              );
            },
            child: Text('Ir para a página de departamentos'),
          ),
        ],
      ),
    );
  }
}
