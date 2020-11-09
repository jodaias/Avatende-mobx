import 'package:avatende/pages/perfil/perfil_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final String url =
    'https://i.pinimg.com/236x/12/fa/d7/12fad712035c2df9aa0562d8a6c6afd9.jpg';

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
          height: 150,
          padding: EdgeInsets.symmetric(horizontal: 13),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(url),
                    )),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appStore.userModel.email != null
                        ? appStore.userModel.email
                        : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
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
          ])),
    );
  }
}
