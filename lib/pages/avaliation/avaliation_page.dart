import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AvaliationPage extends StatelessWidget {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: appStore.userViewModel.userType != "3" ||
              appStore.userViewModel.userType != "3-Dev"
          ? CustomDrawer()
          : null,
      appBar: AppBar(
        title: Text('Avaliações'),
        centerTitle: true,
      ),
      body: Container(),
    );
  }
}
