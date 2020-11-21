// This is actually a wrapper for another 5 screens: Guard, Profile, Store, Chat, Account
// It should have its own navigator.
import 'package:acazia_jenkins/screens/tab-container/dashboard/dashboard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class TabLayout extends StatefulWidget {
  @override
  _TabLayoutState createState() => _TabLayoutState();
}

class _TabLayoutState extends State<TabLayout>
    with TickerProviderStateMixin<TabLayout> {
  int _currentTabIndex = 1;
  final _kTabPages = <Widget>[Dashboard(), Dashboard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentTabIndex,
        children: _kTabPages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.amber[100],
        height: 60,
        items: <Widget>[
          Icon(Icons.pie_chart, size: 30, color: Colors.black54),
          Icon(Icons.dashboard, size: 30, color: Colors.black54),
          Icon(Icons.computer, size: 30, color: Colors.black54),
        ],
      ),
    );
  }
}
