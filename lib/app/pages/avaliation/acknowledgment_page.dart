import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AcknowledgmentPage extends StatefulWidget {
  @override
  _AcknowledgmentPageState createState() => _AcknowledgmentPageState();
}

class _AcknowledgmentPageState extends State<AcknowledgmentPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Future.delayed(Duration(seconds: 7)).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
            height: data.size.height,
            width: data.size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Obrigado pela sua colaboração!",
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Icon(Icons.sentiment_very_satisfied,
                    size: 100.0, color: Colors.purple[400]),
                Text(
                  "Volte Sempre!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            )),
      )),
    );
  }
}
