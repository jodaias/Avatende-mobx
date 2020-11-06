import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomIconSlideAction extends StatelessWidget {
  CustomIconSlideAction({
    Key key,
    this.labelContent,
    this.labelAction,
    this.labelCaption,
    this.onPressed,
  }) : super(key: key);

  final String labelContent;
  final String labelCaption;
  final String labelAction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconSlideAction(
      caption: labelCaption,
      icon: Icons.block,
      color: Colors.red,
      onTap: () => _showdialog(context),
    );
  }

  void _showdialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Text('Tem certeza?'),
            content: Text(labelContent),
            actions: <Widget>[
              RaisedButton(
                color: Colors.greenAccent,
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              RaisedButton(
                color: Colors.white,
                child: Text(
                  labelAction,
                  style: TextStyle(color: Colors.red),
                ),
                //Irá desativar ou ativar
                onPressed: onPressed,
              )
            ],
          );
        });
  }
}
