// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../../assets/values/AppColors.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  var phone_controller = TextEditingController();
  var auth_controller = Get.put(AuthApiController());


  void submit_phone() {
    var phone = phone_controller.text;
    print(phone);
    var regex = RegExp(r"9\d{9}");
    if (regex.hasMatch(phone)) {
      auth_controller.SendCode(phone);
      // Get.toNamed('/code', arguments: phone);
    } else {
      Get.snackbar('خطا', 'شماره موبایل را صحیح وارد کنید',
          snackPosition: SnackPosition.BOTTOM,
          maxWidth: MediaQuery.of(context).size.width - 30,
          titleText: const Text(
            "خطا",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ),
          messageText: const Text(
            "شماره موبایل را صحیح وارد کنید",
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
          ));
    }
  }

  @override
  void dispose() {
    Get.delete<AuthApiController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
          backgroundColor: Color(AppColors.primary),
          body: Column(children: [
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
                  painter: WhiteWave(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 10,),
                              const Text(
                                "شماره موبایل خود را وارد کنید",
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Column(
                                children: [
                                  Container(
                                    width: 250,
                                    height: 40,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius:
                                          const BorderRadius.all(
                                              Radius.circular(10)),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(width: 10,),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 4),
                                          child: Text(
                                            "+98",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.none,
                                              fontSize: 18,
                                              color: Colors.grey,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.grey,
                                          indent: 5,
                                          endIndent: 5,
                                        ),
                                        Expanded(
                                          child: TextField(
                                            keyboardType: TextInputType.phone,
                                            inputFormatters: [LengthLimitingTextInputFormatter(10),FilteringTextInputFormatter.digitsOnly],
                                            style: const TextStyle(
                                                decoration:
                                                    TextDecoration.none,
                                                color: Colors.black),
                                            textAlign: TextAlign.center,
                                            cursorColor: Colors.black,
                                            decoration:
                                                const InputDecoration(
                                              hintStyle: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                              ),
                                              contentPadding:
                                                  EdgeInsets.only(
                                                      bottom: 10),
                                              border: InputBorder.none,
                                              hintText:
                                                  "شماره موبایل خود را وارد کنید",
                                            ),
                                            controller: phone_controller,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    margin: const EdgeInsets.only(
                                        right: 75, top: 10),
                                    child: const Text(
                                      ".کد تایید برای شماره بالا ارسال خواهد شد",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(height: 20,),
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
                                            return Container(width: 25,height: 25,child: CircularProgressIndicator(strokeWidth: 1.5,color: Colors.white,));
                                          else
                                            return Text(
                                              "ارسال کد تایید",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                              ),
                                            );
                                        }),
                                      ),
                                    ),
                                    onTap: () => submit_phone(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "شرایط استفاده از خدمات",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "و",
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "حریم خصوصی",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "را میپذیرم",
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ]
                  )),
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
