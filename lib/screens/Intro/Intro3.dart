import 'package:flutter/material.dart';
import '../../assets/values/AppColors.dart';

class Intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              alignment: Alignment.topLeft,
              child: const Icon(Icons.arrow_back),
            ),
            onTap: () => Navigator.pop(context),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset("lib/assets/images/video.png"),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  " ویدئوهای جذاب از مسابقات لیگ های برتر",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  height: 2,
                  color: Colors.grey,
                  indent: 30,
                  endIndent: 30,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 30, left: 30),
                  child: Text(
                    "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است",
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 80),
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: CircleButton(
                Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class CircleButton extends StatelessWidget {
  Icon icon;

  CircleButton(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: this.icon,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(AppColors.primary),
          border: Border.all(
              color: Colors.white, width: 4, style: BorderStyle.solid),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ]),
    );
  }
}
