import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './dashboard_screen.dart';
import './login_screen.dart';

class WarpperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider.of<User>(context) == null
        ? LoginScreen()
        : DashboardScreen();
  }
}
