import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Ajuda'),
        centerTitle: true,
      ),
    );
  }
}
