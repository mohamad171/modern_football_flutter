import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../assets/values/AppColors.dart';
import '../controllers/auth_api_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var profile_controller = Get.put(ProfileController());

  @override
  void dispose() {
    super.dispose();
  }

  void ready() {
    GetStorage storage = GetStorage();
    var token = storage.read("token");
    if (token == null) {
      var is_seen_intro = storage.read("is_seen_intro");
      if (is_seen_intro == null) {
        // Get.offAllNamed("/intro1");
        print("Go to phone");
        Get.offAllNamed("/phone");
      } else {
        Get.offAllNamed("/phone");
      }
    } else {
      profile_controller.get_profile();
    }
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      // ready();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ready();
    });

    // print("ok");
    // count_controller.start_timer();
    // var current = count_controller.current_vall;
    // if (current == 2) {
    //   print("From controller ${count_controller.current_vall}");
    //   Get.toNamed("/intro1");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: Color(AppColors.primary),
        child: GestureDetector(
          child: Stack(
            children: [
              Align(
                alignment: FractionalOffset.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.snackbar('توسعه دهنده', 'محمد محمدی',
                            snackPosition: SnackPosition.BOTTOM,
                            maxWidth: MediaQuery.of(context).size.width - 30,
                            titleText: const Text(
                              "توسعه دهنده",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            messageText: const Text(
                              "محمد محمدی",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                            ));
                      },
                      child: Container(
                          padding: EdgeInsets.only(top: 10,left: 20,right: 20,bottom: 30),
                          width: Get.width * .6,
                          height: Get.width * .6,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 25,
                                  offset: Offset(5, 5),
                                )
                              ]),
                          child:
                              Image.asset("lib/assets/images/md_logo_green.png")),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
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
              ),
              Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
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
              ),
            ],
          ),
          onTap: () => print("ok"),
        ),
      ),
    );
  }
}
