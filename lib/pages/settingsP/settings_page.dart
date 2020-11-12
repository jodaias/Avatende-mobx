import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
    );
  }
}
