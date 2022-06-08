import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/screens/Intro/Intro1.dart';
import 'package:modern_football/screens/Intro/Intro2.dart';
import 'package:modern_football/screens/Intro/Intro3.dart';
import 'package:modern_football/screens/MainScreen.dart';
import 'package:modern_football/screens/auth/CodeScreen.dart';
import 'package:modern_football/screens/auth/PhoneScreen.dart';
import 'package:modern_football/screens/auth/ProfileScreen.dart';
import 'package:modern_football/screens/details/NewsDetailsScreen.dart';
import 'package:modern_football/screens/more/MatchesMoreScreen.dart';
import 'package:modern_football/screens/more/NewsMoreScreen.dart';
import 'package:modern_football/screens/more/VideosMoreScreen.dart';
import 'screens/SplashScreen.dart';
import 'package:get/get.dart';

main() async {
  await GetStorage.init();
  runApp(const ModerFootballApp());
}

class ModerFootballApp extends StatelessWidget {
  const ModerFootballApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          '/matches': (context) => MatchesMoreScreen(),
          '/news': (context) => NewsMoreScreen(),
          '/videos': (context) => VideosMoreScreen(),
          '/news-details': (context) => NewsDetailsScreen(),
        });
  }
}
