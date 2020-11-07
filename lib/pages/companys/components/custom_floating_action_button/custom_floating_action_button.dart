import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;

  CustomFloatingActionButton({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      elevation: 8.0,
      child: Icon(
        Icons.add,
        color: Colors.purple[400],
      ),
      onPressed: onPressed,
    );
  }
}
