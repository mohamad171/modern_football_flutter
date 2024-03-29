// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../../assets/values/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final first_name_controller = TextEditingController();
  final last_name_controller = TextEditingController();
  final email_controller = TextEditingController();
  ProfileController profile_controller = Get.find();

  @override
  void initState() {
    super.initState();

    first_name_controller.text =
        profile_controller.user.value.firstName.toString();
    last_name_controller.text =
        profile_controller.user.value.lastName.toString();
    email_controller.text = profile_controller.user.value.email.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(AppColors.primary),
        body: Column(children: [
          Container(
            width: Get.width,
            height: Get.height * .45,
            child: Stack(children: [
              Positioned(
                  left: 10,
                  top: 10,
                  child: IconButton(splashRadius: 20,
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ))),
              Positioned(
                left: 20,
                top: Get.height * .06,
                child: Image.asset("lib/assets/images/football.png"),
              ),
              Positioned(
                right: 20,
                top: Get.height * .06,
                child: Image.asset("lib/assets/images/goal.png"),
              ),
              Positioned(
                right: 20,
                bottom: 0,
                child: Image.asset("lib/assets/images/football_2.png"),
              ),
              Positioned(
                left: 20,
                bottom: Get.height * .05,
                child: Image.asset(
                    height: 80, width: 80, "lib/assets/images/soccer.png"),
              ),
              Positioned(
                  left: MediaQuery.of(context).size.width / 3,
                  top: MediaQuery.of(context).size.height / 7,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("lib/assets/images/ic_player_default.png"),
                        radius: 60,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 15, right: 15),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(
                            0.15,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Text(
                          (profile_controller.user.value.firstName != "")
                              ? "${profile_controller.user.value.firstName.toString()} ${profile_controller.user.value.lastName.toString()}"
                              : "نامشخص",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  )),
              Positioned(
                left: MediaQuery.of(context).size.width / 4,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  width: 190,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(
                      0.15,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "مدرن فوتبال",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: WhiteWave(),
              child: Container(width: Get.width,
              height: Get.height,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 70),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "فرم زیر را تکمیل کنید",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextField(
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: "نام خود را وارد کنید",
                            ),
                            controller: first_name_controller,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 250,
                          height: 40,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextField(
                            style: const TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black),
                            textAlign: TextAlign.center,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.only(bottom: 10),
                              border: InputBorder.none,
                              hintText: "نام خانوادگی خود را وارد کنید",
                            ),
                            controller: last_name_controller,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 60, left: 60),
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  color: Color(AppColors.primary),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 0,
                                      blurRadius: 3,
                                      offset: const Offset(
                                          0, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Obx(() {
                                    if (profile_controller.show_loading.value)
                                      return CircularProgressIndicator(
                                        color: Colors.white,
                                      );
                                    return Text(
                                      "ثبت تغییرات",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    );
                                  }),
                                ),
                              ),
                              onTap: () => profile_controller.set_profile(
                                  first_name_controller.text,
                                  last_name_controller.text),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class WhiteWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.2675234, size.height * 0.0008912656);
    path_0.cubicTo(size.width * 0.09591332, size.height * 0.0008912460, 0,
        size.height * 0.06684492, 0, size.height * 0.06684492);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, size.height * 0.04109875);
    path_0.cubicTo(
        size.width,
        size.height * 0.04109875,
        size.width * 0.7751752,
        size.height * 0.09358289,
        size.width * 0.6440280,
        size.height * 0.08556150);
    path_0.cubicTo(
        size.width * 0.5128808,
        size.height * 0.07754011,
        size.width * 0.4391332,
        size.height * 0.0008912852,
        size.width * 0.2675234,
        size.height * 0.0008912656);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
