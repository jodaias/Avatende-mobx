import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/avaliation/ads_page.dart';
import 'package:avatende/pages/avaliation/observation_page.dart';
import 'package:avatende/pages/stores/avaliation/avaliation_store.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AvaliationPage extends StatefulWidget {
  @override
  _AvaliationPageState createState() => _AvaliationPageState();
}

class _AvaliationPageState extends State<AvaliationPage> {
  final appStore = GetIt.I<AppStore>();
  final avaliationStore = GetIt.I<AvaliationStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 30)).then((_) {
      if (avaliationStore.scores == 0) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) => AdsPage()), (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 18,
                      color: Colors.orangeAccent,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Você está avaliando " + appStore.userViewModel.name,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 18.0,
                      color: Colors.purpleAccent[100],
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                            "Qual foi seu nível de satisfação quanto ao atendimento?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30.0)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Card(
                elevation: 18.0,
                color: Colors.black87,
                child: Observer(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              avaliationStore.setScores(1);
                              print(avaliationStore.scores);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ObservationPage(
                                          // nome: widget.nome,
                                          // pontos: pontos,
                                          // email: widget.email
                                          )));
                            },
                            icon: Icon(
                              Icons.sentiment_very_dissatisfied,
                              size: 40.0,
                              color: Colors.red,
                            ),
                          ),
                          Text('Péssimo',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              avaliationStore.setScores(2);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ObservationPage()));
                            },
                            icon: Icon(
                              Icons.sentiment_dissatisfied,
                              size: 40.0,
                              color: Colors.orange,
                            ),
                          ),
                          Text('Ruim',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              avaliationStore.setScores(3);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ObservationPage()));
                            },
                            icon: Icon(
                              Icons.sentiment_neutral,
                              size: 40.0,
                              color: Colors.yellow,
                            ),
                          ),
                          Text('Regular',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              avaliationStore.setScores(4);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ObservationPage()));
                            },
                            icon: Icon(
                              Icons.sentiment_satisfied,
                              size: 40.0,
                              color: Colors.lightGreen,
                            ),
                          ),
                          Text('Bom',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Column(
                        children: <Widget>[
                          IconButton(
                            iconSize: 40.0,
                            onPressed: () {
                              avaliationStore.setScores(5);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ObservationPage()));
                            },
                            icon: Icon(
                              Icons.sentiment_very_satisfied,
                              size: 40.0,
                              color: Colors.green,
                            ),
                          ),
                          Text('Ótimo',
                              style: TextStyle(
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
