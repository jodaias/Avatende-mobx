import 'package:avatende/consonents.dart';
import 'package:avatende/pages/root/root_page.dart';
import 'package:avatende/storesGlobal/app_store.dart';
import 'package:avatende/storesGlobal/page_store.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initializeParse();
  setupLocators();
  runApp(MyApp());
}

// Future<void> initializeParse() async {
//   await Parse().initialize(
//     kParseApplicationId,
//     kUrl,
//     clientKey: kParseClientKey,
//     autoSendSessionId: true,
//     debug: true,
//   );
// }

void setupLocators() {
  GetIt.I.registerSingleton(AppStore());
  GetIt.I.registerSingleton(PageStore());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      kUrlGraphql,
      defaultHeaders: {
        'X-Parse-Application-Id': kParseApplicationId,
        'X-Parse-Client-Key': kParseClientKey,
        'X-Parse-Master-Key': kParseMasterKey,
      }, //getheaders()
    );
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),
        link: httpLink,
      ),
    );
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
      home: GraphQLProvider(
        child: RootPage(),
        client: client,
      ),
    );
  }
}
