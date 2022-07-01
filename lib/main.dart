import 'package:flutter/material.dart';
import 'package:hotel_app_web/screens/login_page.dart';
import 'package:hotel_app_web/screens/main_page.dart';
import 'screens/root_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'theme/color.dart';

void main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inka Siza',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const LoginPage(),
      //home: const RootApp(),

      home: const MainPage(),
    );
  }
}
