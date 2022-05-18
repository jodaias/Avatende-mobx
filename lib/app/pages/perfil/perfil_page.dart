import 'package:avatende/app/pages/perfil/components/custom_appBar.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PerfilPage extends StatefulWidget {
  PerfilPage({Key? key, this.title = "Perfil"}) : super(key: key);

  final String title;

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final appStore = GetIt.I<AppStore>();

  TextStyle _style() {
    return TextStyle(
      fontWeight: FontWeight.bold,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Observer(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Nome:",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                '${appStore.userViewModel!.name}',
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Email:",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text('${appStore.userViewModel!.email}'),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Idioma:",
                style: _style(),
              ),
              SizedBox(
                height: 4,
              ),
              Text("Português/BR"),
              SizedBox(
                height: 16,
              ),
              Divider(
                color: Colors.grey,
              )
            ],
          );
        }),
      ),
    );
  }
}
