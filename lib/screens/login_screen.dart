//TODO
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Loging screen"),
          FlatButton(onPressed: null, child: Text("Login"))
        ],
      ),
    );
  }
}
