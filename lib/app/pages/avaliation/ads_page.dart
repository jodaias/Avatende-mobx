import 'package:avatende/app/components/custom_drawer/custom_drawer.dart';
import 'package:avatende/app/models/views/ads_images_view_model.dart';
import 'package:avatende/app/pages/avaliation/avaliation_page.dart';
import 'package:avatende/app/pages/stores/avaliation/avaliation_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AdsPage extends StatefulWidget {
  @override
  _AdsPageState createState() => _AdsPageState();
}

class _AdsPageState extends State<AdsPage> {
  final appStore = GetIt.I<AppStore>();
  final avaliationStore = new AvaliationStore();

  @override
  void initState() {
    super.initState();
    if (appStore.companyViewModel?.companyId() != null)
      avaliationStore.setCompanyId(appStore.companyViewModel?.companyId());
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
              drawer: CustomDrawer(),
              resizeToAvoidBottomInset: false,
              body: Observer(builder: (_) {
                return StreamBuilder<AdsImagesViewModel>(
                  stream: avaliationStore.listAdsImages,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }

                    if (snapshot.data!.images.isEmpty) {
                      return Container(
                        padding: EdgeInsets.all(30),
                        child: Text('Desculpe, nenhum anúncio cadastrado.'),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.none) {
                      return Center(child: Text('Verifique sua conexão'));
                    }

                    if (snapshot.hasError) {
                      return Center(
                          child: Text("Erro ao tentar recuperar os dados"));
                    }

                    return GestureDetector(
                      onTap: nextPage,
                      child: CarouselSlider(
                        items: snapshot.data!.images.map((url) {
                          return Image.network(url,
                              fit: BoxFit.fitHeight, width: screenSize.width);
                        }).toList(),
                        options: CarouselOptions(
                          clipBehavior: Clip.none,
                          padEnds: true,
                          pageSnapping: false,
                          height: screenSize.height,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    );
                  },
                );
              })),
        )
      ],
    );
  }

  void nextPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AvaliationPage()));
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
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
                  Navigator.of(context).pop(true);
                },
                child: new Text('Sim'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
