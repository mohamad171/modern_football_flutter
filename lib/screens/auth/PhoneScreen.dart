// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../assets/values/AppColors.dart';
import 'package:flutter_svg/avd.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final phone_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(AppColors.primary),
          body: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(children: [
                  Expanded(
                    child: Stack(children: [
                      Positioned(
                        left: 20,
                        top: 90,
                        child: Image.asset("lib/assets/images/football.png"),
                      ),
                      Positioned(
                        right: 20,
                        top: 90,
                        child: Image.asset("lib/assets/images/goal.png"),
                      ),
                      Positioned(
                        right: 20,
                        bottom: 0,
                        child: Image.asset("lib/assets/images/football_2.png"),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 25,
                        child: Image.asset("lib/assets/images/soccer.png"),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 3,
                        top: MediaQuery.of(context).size.height / 6,
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
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      child: CustomPaint(
                        size: Size(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height),
                        painter: WhiteWave(),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 70),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      ".شماره موبایل خود را وارد کنید",
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
                                              const Expanded(
                                                flex: 2,
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
                                              const Expanded(
                                                flex: 1,
                                                child: VerticalDivider(
                                                  color: Colors.grey,
                                                  indent: 5,
                                                  endIndent: 5,
                                                ),
                                              ),
                                              Expanded(
                                                child: TextField(
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
                                                flex: 8,
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
                                            child: const Center(
                                              child: Text(
                                                "ارسال کد تایید",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () => Get.toNamed("/code"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                alignment: Alignment.bottomCenter,
                                child: Row(
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
                                ),
                              )
                            ]),
                      ),
                    ),
                    flex: 1,
                  ),
                ]),
              ),
            ],
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
