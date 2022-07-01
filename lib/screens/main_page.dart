import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app_web/auth/auth_page.dart';
import 'package:hotel_app_web/screens/login_page.dart';
import 'package:hotel_app_web/screens/root_app.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RootApp();
            } else {
              return AuthPage();
            }
          }),
    );
  }
}
