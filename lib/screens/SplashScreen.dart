import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/controllers/SocialController.dart';
import '../assets/values/AppColors.dart';
import '../controllers/auth_api_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var profile_controller = Get.find<ProfileController>();
   var socialController = Get.find<SocialController>();

  @override
  void dispose() {
    super.dispose();
  }

  void ready() {
    GetStorage storage = GetStorage();
    var token = storage.read("token");
    if (token == null) {
        Get.offAllNamed("/phone");
    } else {
      profile_controller.get_profile();
    }
  }

  @override
  void initState() {
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((_) {
      ready();
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.only(bottom: 20),
          width: Get.width,
          color: Color(AppColors.primary),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                        width: Get.width * .6,
                        child:
                        Column(
                          children: [
                            Image.asset("lib/assets/images/logo_mf.png"),
                            Text("مدرن فوتبال",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.w700),),

                          ],
                        )),

                    const Divider(
                      indent: 40,
                      endIndent: 40,
                      color: Colors.white,
                    ),
                    SizedBox(height: 10,),
                    const Text(
                      "هیچ خبر و مسابقه فوتبالی رو از دست نده...",
                      textDirection: TextDirection.rtl,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircularProgressIndicator(strokeWidth: 2,backgroundColor: Color.fromARGB(255, 0, 114, 59),
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
              ],
            ),

        ),
      ),
    );
  }
}
