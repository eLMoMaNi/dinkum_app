//TODO
import 'package:dinkum_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Loging screen"),
          FlatButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(DashboardScreen.route);
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
