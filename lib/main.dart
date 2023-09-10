import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/bindings.dart';
import 'package:modern_football/screens/Intro/Intro1.dart';
import 'package:modern_football/screens/Intro/Intro2.dart';
import 'package:modern_football/screens/Intro/Intro3.dart';
import 'package:modern_football/screens/MainScreen.dart';
import 'package:modern_football/screens/TodayMatches.dart';
import 'package:modern_football/screens/auth/CodeScreen.dart';
import 'package:modern_football/screens/auth/PhoneScreen.dart';
import 'package:modern_football/screens/auth/ProfileScreen.dart';
import 'package:modern_football/screens/details/LeagueStanding.dart';
import 'package:modern_football/screens/details/MatchesDetails.dart';
import 'package:modern_football/screens/details/NewsDetailsScreen.dart';
import 'package:modern_football/screens/details/TopGoals.dart';
import 'package:modern_football/screens/more/MatchesMoreScreen.dart';
import 'package:modern_football/screens/more/NewsMoreScreen.dart';
import 'package:modern_football/screens/more/VideosMoreScreen.dart';
import 'package:modern_football/screens/social/explore_social.dart';
import 'package:modern_football/screens/social/post_details.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'screens/SplashScreen.dart';
import 'package:get/get.dart';

main() async {
  await GetStorage.init();
  changestatusbarcolor();
  runApp(ModerFootballApp());

}

class ModerFootballApp extends StatelessWidget {
  const ModerFootballApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'مدرن فوتبال',
        theme: ThemeData(fontFamily: 'IranSans'),
        initialRoute: '/explore',
        initialBinding: ModernfootballBinding(),

        routes: {
          '/splash': (context) => SplashScreen(),
          '/phone': (context) => PhoneScreen(),
          '/code': (context) => CodeScreen(),
          '/profile': (context) => ProfileScreen(),
          '/main': (context) => MainScreen(),
          '/matches': (context) => MatchesMoreScreen(),
          '/news': (context) => NewsMoreScreen(),
          '/videos': (context) => VideosMoreScreen(),
          '/news-details': (context) => NewsDetailsScreen(),
          '/matches-details': (context) => MatchesDetails(),
          '/competition-standing': (context) => LeagueStandingScreen(),
          '/today-matches': (context) => TodayMatchesScreen(),
          '/top-goals': (context) => TopGoalsScreen(),
          '/explore': (context) => ExploreSocialScreen(),
          '/post-details': (context) => PostDetailsScreen(),
          
        });
  }
}
changestatusbarcolor() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light, statusBarColor: Color.fromARGB(255, 0, 89, 46)));
}
