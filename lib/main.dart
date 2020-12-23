import 'package:dinkum_app/screens/warpper_screen.dart';
import 'package:dinkum_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import './screens/dashboard/community_screen.dart';
import 'screens/dashboard/articles_screen.dart';
import './screens/dashboard/profile_screen.dart';
import './screens/dashboard/swap_screen.dart';
import './screens/dashboard_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().userStream,
      child: MaterialApp(
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
        home: WarpperScreen(),
        routes: {
          "/dashboard": (_) => DashboardScreen(),
          "/articles": (_) => ArticlesScreen(),
          "/swap": (_) => SwapScreen(),
          "/community": (_) => CommunityScreen(),
          "/profile": (_) => ProfileScreen(),
        },
      ),
    );
  }
}
