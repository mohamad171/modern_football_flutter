// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/CountDownTimerController.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../../assets/values/AppColors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  bool _onEditing = true;
  String _code = "";
  var data = Get.arguments;
  var count_controller = Get.find<CountDownTimerController>();
  var auth_controller = Get.find<AuthApiController>();
  void CheckCode() {
    auth_controller.CheckCode(data, _code);
  }

  @override
  void dispose() {
    Get.delete<CountDownTimerController>();
    Get.delete<AuthApiController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: Color(AppColors.primary),
          body: 
              Column(children: [
                Container(width: Get.width,height: Get.height*.4,
              child: Stack(children: [
              Positioned(
                left: 20,
                top: Get.height*.06,
                child: Image.asset("lib/assets/images/football.png"),
              ),
              Positioned(
                right: 20,
                top: Get.height*.06,
                child: Image.asset("lib/assets/images/goal.png"),
              ),
              Positioned(
                right: 20,
                bottom: 0,
                child: Image.asset(height: 80,width:80,"lib/assets/images/football_2.png"),
              ),
              Positioned(
                left: 20,
                bottom: Get.height*.05,
                child: Image.asset(height: 80,width:80,"lib/assets/images/soccer.png"),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width / 3,
                top: MediaQuery.of(context).size.height / 7,
                child:
                    Image.asset("lib/assets/images/soccer_player.png"),
              ),
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
                  child: Container(
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height),
                      painter: WhiteWave(),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 50),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "کد پیامک شده را وارد کنید",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        child: VerificationCode(
                                          fullBorder: true,
                                          keyboardType: TextInputType.number,
                                          underlineColor: Colors.black,
                                          length: 4,
                                          cursorColor: Colors.blue,
                                          onCompleted: (String value) {
                                            setState(() {
                                              _code = value;
                                              CheckCode();
                                            });
                                          },
                                          onEditing: (bool value) {
                                            setState(() {
                                              _onEditing = value;
                                            });
                                            if (!_onEditing)
                                              FocusScope.of(context)
                                                  .unfocus();
                                          },
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        margin: const EdgeInsets.only(
                                            right: 75, top: 10),
                                        child: Text(
                                          "کد چهار رقمی به شماره 0${data} ارسال شد",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 55,
                                      ),
                                      GestureDetector(
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              right: 60, left: 60),
                                          height: 45,
                                          width: MediaQuery.of(context)
                                              .size
                                              .width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            border: Border.all(
                                                color: Colors.white,
                                                width: 3),
                                            color: Color(AppColors.primary),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 0,
                                                blurRadius: 3,
                                                offset: const Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Center(
                                            child: Obx(() {
                                              if(auth_controller.is_loading.value)
                                                return CircularProgressIndicator(color: Colors.white,);
                                              else
                                                return Text(
                                                  "بررسی کد تایید",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  ),
                                                );
                                            }),
                                          ),
                                        ),
                                        onTap: () => CheckCode(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Obx(() => Text(
                                "ارسال مجدد کد تایید: ${count_controller.SCount}"))
                          ]),
                    ),
                  ),
                ),
              ]),),
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
