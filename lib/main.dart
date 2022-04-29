import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/pages/stores/avaliation/avaliation_store.dart';
import 'package:avatende/app/pages/stores/relatory/relatory_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  setupLocators();
  await getUser();
  runApp(MyApp());
}

Future<void> getUser() async {
  //use 'controller' variable to access controller
  final appStore = GetIt.I<AppStore>();

  final _auth = FirebaseAuth.instance;

  final _instance = FirebaseFirestore.instance;

  var items = ["Users", "UsersMaster"];
  var user;

  for (var item in items) {
    user = await _instance.collection(item).doc(_auth.currentUser?.uid).get();
    print('userFor ${user.data()}');
    if (user.data() != null) {
      appStore.setUser(new UserViewModel.fromMap(user));
      await appStore.getCompanyAndDepartment();
    }
  }
}

void setupLocators() {
  GetIt.I.registerSingleton(AppStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(AvaliationStore());
  GetIt.I.registerSingleton(RelatoryStore());
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
      home: RootPage(),
    );
  }
}
