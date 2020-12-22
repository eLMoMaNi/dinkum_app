import 'package:dinkum_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(Icons.logout),
        onPressed: () => AuthService().signOut(),
      ),
    );
  }
}
