import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard/community_screen.dart';
import 'dashboard/articles_screen.dart';
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
    print(FirebaseAuth.instance.currentUser);
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
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
        currentIndex: _currentTabIdx,
        onTap: (idx) {
          setState(() {
            _currentTabIdx = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            title: Text("Articles"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: Text("Swap"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Community"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("My Profile"),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
