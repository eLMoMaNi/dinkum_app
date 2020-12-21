import 'package:flutter/material.dart';

import 'dashboard/community_screen.dart';
import 'dashboard/home_screen.dart';
import 'dashboard/profile_screen.dart';
import 'dashboard/swap_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String route = "/dashboard";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Widget> tabs = [
    ArticlesScreen(),
    SwapScreen(),
    CommunityScreen(),
    ProfileScreen(),
  ];
  int _currentTabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dinkum"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {}, //TODO Implement search screen
        ),
      ),
      body: tabs[_currentTabIdx],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTabIdx,
        onTap: (idx) {
          setState(() {
            _currentTabIdx = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined), title: Text("Articles")),
          BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz), title: Text("Swap")),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), title: Text("Community")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_pin), title: Text("My Profile")),
        ],
      ),
    );
  }
}
