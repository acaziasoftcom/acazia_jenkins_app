// This is actually a wrapper for another 5 screens: Guard, Profile, Store, Chat, Account
// It should have its own navigator.
import 'package:acazia_jenkins/screens/tab-container/dashboard/dashboard.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';

class TabLayout extends StatefulWidget {
  @override
  _TabLayoutState createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout>
    with TickerProviderStateMixin<TabLayout> {
  int _currentTabIndex = 1;
  final _kTabPages = <Widget>[
    Dashboard(),
    Dashboard()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _currentTabIndex,
          children: _kTabPages,
        ),
        bottomNavigationBar: FancyBottomNavigation(
            initialSelection: _currentTabIndex,
            circleColor: Colors.amber,
            tabs: [
              TabData(iconData: Icons.pie_chart, title: "Statistic"),
              TabData(iconData: Icons.dashboard, title: "Dashboard"),
              TabData(iconData: Icons.computer, title: "Nodes")
            ],
            onTabChangedListener: (position) {}));
  }
}
