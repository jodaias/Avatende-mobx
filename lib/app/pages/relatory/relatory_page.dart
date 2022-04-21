import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class RelatoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Relatórios'),
        centerTitle: true,
      ),
    );
  }
}
