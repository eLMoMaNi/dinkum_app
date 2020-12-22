import 'package:dinkum_app/screens/dashboard/community_screen.dart';
import 'package:dinkum_app/screens/dashboard/home_screen.dart';
import 'package:dinkum_app/screens/dashboard/profile_screen.dart';
import 'package:dinkum_app/screens/dashboard/swap_screen.dart';
import 'package:dinkum_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        // Locale("en", "US"),//TODO add English support
        Locale("ar", "AE"),
      ],
      theme: ThemeData(
        //Todo change it
        primarySwatch: Colors.blue,
        accentColor: Colors.blueGrey,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              subtitle2: TextStyle(
                fontFamily: "Tajawal",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              //
            ),
      ),
      home:
          //LoginScreen(),
          DashboardScreen(),
      routes: {
        "/dashboard": (_) => DashboardScreen(),
        "/articles": (_) => ArticlesScreen(),
        "/swap": (_) => SwapScreen(),
        "/community": (_) => CommunityScreen(),
        "/profile": (_) => ProfileScreen(),
      },
    );
  }
}
