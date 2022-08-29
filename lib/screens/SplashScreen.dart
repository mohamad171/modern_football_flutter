import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_football/controllers/CountDownTimerController.dart';
import '../assets/values/AppColors.dart';
import '../controllers/auth_api_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  var profile_controller = Get.put(ProfileController());
  late final AnimationController _controller;

  @override
  void dispose() {
    super.dispose();
  }
void ready(){
  GetStorage storage = GetStorage();
  var token = storage.read("token");
  if (token == null) {
    var is_seen_intro = storage.read("is_seen_intro");
    if (is_seen_intro == null) {
      Get.offAllNamed("/intro1");
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
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
       ready();
      }
    });


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {


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
    return Container(
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
                    child: Lottie.asset('lib/assets/ball.zip',controller: _controller,onLoaded: (composition) {

                      _controller.duration = composition.duration;
                      _controller.forward();

                    }),
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
        onTap: () => print("ok"),
      ),
    );
  }
}
