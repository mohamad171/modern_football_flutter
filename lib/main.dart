import 'package:flutter/material.dart';
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
        });
  }
}
