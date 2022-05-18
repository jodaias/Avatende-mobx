import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CustomIconSlideAction extends StatelessWidget {
  CustomIconSlideAction({
    Key? key,
    required this.labelContent,
    required this.labelAction,
    required this.labelCaption,
    required this.onPressed,
  }) : super(key: key);

  final String labelContent;
  final String labelCaption;
  final String labelAction;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: _showdialog,
      foregroundColor: Colors.red,
      icon: Icons.block,
      label: labelCaption,
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
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.greenAccent,
                )),
                child: Text('Cancelar', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                  Colors.white,
                )),

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
