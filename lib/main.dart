import 'package:flutter/material.dart';
import 'package:modern_football/screens/Intro/Intro1.dart';
import 'package:modern_football/screens/Intro/Intro2.dart';
import 'package:modern_football/screens/Intro/Intro3.dart';
import 'package:modern_football/screens/MainScreen.dart';
import 'package:modern_football/screens/auth/CodeScreen.dart';
import 'package:modern_football/screens/auth/PhoneScreen.dart';
import 'package:modern_football/screens/auth/ProfileScreen.dart';
import 'screens/SplashScreen.dart';

void main() {
  runApp(const ModerFootballApp());
}

class ModerFootballApp extends StatelessWidget {
  const ModerFootballApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Modern Football',
        theme: ThemeData(fontFamily: 'IranSans'),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/intro1': (context) => Intro1(),
          '/intro2': (context) => Intro2(),
          '/intro3': (context) => Intro3(),
          '/phone': (context) => PhoneScreen(),
          '/code': (context) => CodeScreen(),
          '/profile': (context) => ProfileScreen(),
          '/main': (context) => MainScreen(),
        });
  }
}
