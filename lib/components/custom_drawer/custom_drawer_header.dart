import 'package:avatende/pages/perfil/perfil_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawerHeader extends StatelessWidget {
  final appStore = GetIt.I<AppStore>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => PerfilPage()));
      },
      child: Container(
          color: Colors.purple[400],
          height: 95,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      appStore.userModel.email != null
                          ? appStore.userModel.email
                          : '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      appStore.userModel.name != null
                          ? appStore.userModel.name
                          : '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            )
          ])),
    );
  }
}
