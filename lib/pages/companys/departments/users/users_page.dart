import 'package:avatende/components/custom_drawer/custom_drawer.dart';
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

class UsersPage extends StatefulWidget {
  UsersPage({Key key, this.title = "Usuários"}) : super(key: key);

  final String title;

  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text('Atendentes'),
        centerTitle: true,
      ),
      body: Container(
        child: Text('Tela dos Atendentes'),
      ),
    );
  }
}
