import 'package:avatende/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.orangeAccent,
      elevation: 8.0,
      child: Icon(
        Icons.add,
        color: Colors.purple[400],
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
    );
  }
}
