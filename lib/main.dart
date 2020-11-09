import 'package:avatende/pages/splash/splash_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'RK4IIwMLpvtCCOlP3MyvJYUNGtTnbJIovtPX9XvE',
    'https://parseapi.back4app.com/',
    clientKey: 'BAcjCVFCZWXmKe0zLNrbDKqBJJBDnIlghIagdcwM',
    autoSendSessionId: true,
    debug: true,
  );
}

void setupLocators() {
  GetIt.I.registerSingleton(AppStore());
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatende',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          color: Colors.purple[400],
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}
