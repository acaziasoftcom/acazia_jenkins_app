import 'package:acazia_jenkins/locator.dart';
import 'package:acazia_jenkins/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:acazia_jenkins/common/static_data.dart' as routes;
import 'package:acazia_jenkins/router.dart' as router;
import 'package:provider/provider.dart';

Future main() async {
  await DotEnv().load('.env');
  setupLocator();
  runApp(AcaziaJenkinsApp());
}

class AcaziaJenkinsApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'Acazia Jenkins',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: router.generateRoute,
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => Text('Nothing'),
        ),
        initialRoute: routes.AJTablayout,
      ),
    );
  }
}
