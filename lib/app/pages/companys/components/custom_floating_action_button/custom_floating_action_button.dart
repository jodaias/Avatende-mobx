import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton(
      {Key? key, required this.onPressed, required this.iconData})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      hoverColor: Colors.purple[500],
      elevation: 8.0,
      child: Icon(
        iconData,
        color: Colors.purple[400],
      ),
      onPressed: onPressed,
    );
  }
}
