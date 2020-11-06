import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/departments/departments_page.dart';
import 'package:avatende/pages/signup/signup_page.dart';
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
    return Scaffold(
      drawer: CustomDrawer(),
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
        title: Text('Empresas'),
        centerTitle: true,
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DepartmentsPage(),
              ),
            );
          },
          child: Text('ir para a página dos departamentos'),
        ),
      ),
    );
  }
}
