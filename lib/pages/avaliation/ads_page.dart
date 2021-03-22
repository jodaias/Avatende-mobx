import 'package:avatende/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/pages/avaliation/avaliation_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class AdsPage extends StatefulWidget {
  @override
  _AdsPageState createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  final appStore = GetIt.I<AppStore>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

    return Stack(
      children: <Widget>[
        WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            drawer: CustomDrawer(),
            resizeToAvoidBottomInset: false,
            body: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection("Companys")
                    .doc('C5tMulO3zaMOOxeDEx8i')
                    .collection("AdsImages")
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    List<String> imagens = [];

                    for (DocumentSnapshot doc in snapshot.data.docs) {
                      for (String url in doc.data()['Images']) {
                        imagens.add(url);
                      }
                    }

                    return Container(
                      child: Carousel(
                        images: imagens.map((url) {
                          return NetworkImage(url);
                        }).toList(),
                        dotSize: 6.0,
                        dotSpacing: 20.0,
                        dotBgColor: Colors.purple.withOpacity(0.5),
                        dotColor: primaryColor,
                        autoplay: true,
                        autoplayDuration: Duration(seconds: 5),
                        borderRadius: false,
                        moveIndicatorFromBottom: 18.0,
                        noRadiusForIndicator: true,
                        indicatorBgPadding: 2.0,
                        overlayShadow: true,
                        overlayShadowColors: Colors.white,
                        onImageTap: nextPage,
                        animationCurve: Curves.fastOutSlowIn,
                        animationDuration: Duration(milliseconds: 2000),
                      ),
                    );
                  }
                }),
          ),
        )
      ],
    );
  }

  void nextPage(int i) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AvaliationPage()));
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Tem certeza?'),
            content: new Text('Você irá sair do App!'),
            actions: <Widget>[
              new TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('Cancelar'),
              ),
              new TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
