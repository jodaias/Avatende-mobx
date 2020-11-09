import 'package:avatende/pages/root/root_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          routeName: "/",
          imageBackground: AssetImage('images/background.jpg'),
          // LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [Color(0xffED213A), Color(0xff93291E)],
          // ),
          navigateAfterSeconds: RootPage(),
          loaderColor: Colors.transparent,
        ),
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/icon.png"),
              fit: BoxFit.none,
            ),
          ),
        ),
      ],
    );
  }
}
