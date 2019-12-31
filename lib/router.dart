import 'package:acazia_jenkins/screens/login/login.dart';
import 'package:acazia_jenkins/screens/tab-container/tab_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:acazia_jenkins/common/static_data.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.AJTablayout:
      return MaterialPageRoute(builder: (_) => TabLayout());

    case routes.LoginRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No path for ${settings.name}'),
                ),
              ));
  }
}
