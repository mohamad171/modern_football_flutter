import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/values/AppColors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      color: Color(AppColors.primary),
      child: Stack(
        children: [
          Align(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.offNamed('/intro1');
                  },
                  child: Image.asset("lib/assets/images/logo.png"),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "مدرن فوتبال",
                  style: TextStyle(
                    fontFamily: "IranSans",
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w100,
                    fontSize: 30,
                  ),
                ),
                const Divider(
                  indent: 40,
                  endIndent: 40,
                  color: Colors.white,
                ),
                const Text(
                  "بروزترین مرجع اخبار و اطلاعات فوتبالی",
                  style: TextStyle(
                    fontFamily: "IranSans",
                    color: Colors.white,
                    fontSize: 17,
                    wordSpacing: 1.0,
                    fontWeight: FontWeight.w100,
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 10,
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "نسخه 1.0",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "IranSans",
                        decoration: TextDecoration.none,
                        color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
