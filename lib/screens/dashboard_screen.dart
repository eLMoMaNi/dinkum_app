import 'package:dinkum_app/screens/create_article_screen.dart';
import 'package:dinkum_app/screens/dashboard/create_screen.dart';
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
  List<Color> _tabColors = [
    Colors.blue,
    Colors.indigo,
    Colors.cyan,
    Colors.deepPurple,
    Colors.teal
  ];
  List<Widget> tabs = [
    ArticlesScreen(),
    SwapScreen(),
    CreateScreen(),
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
        backgroundColor: _tabColors[_currentTabIdx],
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
            TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        currentIndex: _currentTabIdx,
        onTap: (idx) {
          setState(() {
            _currentTabIdx = idx;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            title: Text("مقالات"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            title: Text("تبادل"),
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
            backgroundColor: _tabColors[_currentTabIdx],
            title: Text("إنشاء"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("مُجتمع"),
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text("حِسابي"),
            backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
