// import 'package:avatende/app/models/views/user_view_model.dart';
import 'package:avatende/app/enums/user-type.dart';
import 'package:avatende/app/pages/root/root_page.dart';
import 'package:avatende/app/pages/stores/avaliation/avaliation_store.dart';
import 'package:avatende/app/pages/stores/notification/notification_store.dart';
import 'package:avatende/app/pages/stores/relatory/relatory_store.dart';
import 'package:avatende/app/storesGlobal/app_store.dart';
import 'package:avatende/app/storesGlobal/page_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firedart/firedart.dart';
import 'firebase_options.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // var apiKey = "AIzaSyBT9GzdPW-Aw-IoYvzZF9slEHwfmplBOX4";
  // var projectId = 'avatende-7ae97';

  // FirebaseAuth.initialize(apiKey, VolatileStore());
  // Firestore.initialize(projectId);

  setupLocators();
  await getUser();
  runApp(MyApp());
}

Future<void> getUser() async {
  final appStore = GetIt.I<AppStore>();

  // final _auth = FirebaseAuth.instance;

  // final _instance = FirebaseFirestore.instance;

  // var user =
  //     await _instance.collection("Users").doc(_auth.currentUser?.uid).get();

  // if (user.data() != null) {
  await appStore.getUser();

  if (appStore.userViewModel?.name != null &&
      appStore.userViewModel?.userType != UserType.Master)
    await appStore.getCompanyAndDepartment();
  // }
}

void setupLocators() {
  GetIt.I.registerSingleton(NotificationStore());
  GetIt.I.registerSingleton(AppStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(AvaliationStore());
  GetIt.I.registerSingleton(RelatoryStore());
}

class MyApp extends StatelessWidget {
  final globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Avatende',
      key: globalKey,
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
