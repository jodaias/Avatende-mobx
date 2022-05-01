import 'package:avatende/app/pages/perfil/perfil_page.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
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
        height: 150,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: appStore.userViewModel.image == "" ||
                              appStore.userViewModel.image == null
                          ? NetworkImage(profileUrlDefault)
                          : NetworkImage(appStore.userViewModel.image),
                    )),
              ),
            ),
            SizedBox(height: 5),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    appStore.userViewModel.name != null
                        ? appStore.userViewModel.name
                        : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    appStore.userViewModel.email != null
                        ? appStore.userViewModel.email
                        : '',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
