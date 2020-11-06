import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/pages/companys/components/custom_scaffold/custom_scaffold.dart';
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
    return CustomScaffold(
      title: 'Usuários',
      actives: 'Usuários ativos',
      inactives: 'Usuários inativos',
    );
  }
}
