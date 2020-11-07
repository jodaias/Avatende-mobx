import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/companys/components/custom_floating_action_button/custom_floating_action_button.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

enum ActivesOrOrderBy {
  actives,
  inactives,
  orderByAZ,
  orderByZA,
}

class CustomScaffold extends StatefulWidget {
  CustomScaffold({
    Key key,
    this.title,
    this.actives,
    this.inactives,
    this.widget,
    this.drawer,
    this.floatingActionButton,
  }) : super(key: key);

  final String title;
  final String actives;
  final String inactives;
  final Widget widget;
  final CustomDrawer drawer;
  final CustomFloatingActionButton floatingActionButton;

  @override
  _CustomScaffoldState createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  final appStore = GetIt.I<AppStore>();

  bool active = true;
  bool orderZA = true;

  void _activeOrOrderList(ActivesOrOrderBy result) {
    switch (result) {
      case ActivesOrOrderBy.actives:
        print('${widget.actives}');
        setState(() {
          active = true;
        });
        break;
      case ActivesOrOrderBy.inactives:
        print('${widget.inactives}');
        setState(() {
          active = false;
        });
        break;
      case ActivesOrOrderBy.orderByAZ:
        print('${widget.title} ordenado(a)s de A a Z');
        setState(() {
          orderZA = true;
        });
        break;
      case ActivesOrOrderBy.orderByZA:
        print('${widget.title} ordenado(a)s de Z a A');
        setState(() {
          orderZA = false;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: widget.drawer,
      floatingActionButton: widget.floatingActionButton,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: PopupMenuButton<ActivesOrOrderBy>(
              itemBuilder: (context) => <PopupMenuEntry<ActivesOrOrderBy>>[
                PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('${widget.actives}'),
                  value: ActivesOrOrderBy.actives,
                ),
                PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('${widget.inactives}'),
                  value: ActivesOrOrderBy.inactives,
                ),
                PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Ordenar de A-Z'),
                  value: ActivesOrOrderBy.orderByAZ,
                ),
                PopupMenuItem<ActivesOrOrderBy>(
                  child: Text('Ordenar de Z-A'),
                  value: ActivesOrOrderBy.orderByZA,
                ),
              ],
              onSelected: _activeOrOrderList,
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 30.0,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: widget.widget,
      ),
    );
  }
}
