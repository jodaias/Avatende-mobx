import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class CustomScaffold extends StatefulWidget {
  CustomScaffold({
    Key key,
    this.title,
    this.widget,
    this.drawer,
    this.actions,
    this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final List<Widget> actions;
  final Widget widget;
  final CustomDrawer drawer;
  final CustomFloatingActionButton floatingActionButton;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      floatingActionButton: widget.floatingActionButton,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: widget.actions,
      ),
      body: Container(
        child: widget.widget,
      ),
    );
  }
}
