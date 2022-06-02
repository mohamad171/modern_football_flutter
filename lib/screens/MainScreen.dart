import 'package:flutter/material.dart';
import '../assets/values/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<BoxShadow> box_shadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0,
    blurRadius: 3,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

class MainScreen extends StatelessWidget {
  var more_key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.bg_gray),
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.person_outline_rounded,
                  size: 30,
                ),
                Text(
                  "مدرن فوتبال",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.menu,
                  size: 30,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 160.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return const LeaguesItem();
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MainButtonsItem(
                "lib/assets/images/football_icon.png",
                "برترین گلزنان",
              ),
              MainButtonsItem(
                "lib/assets/images/ranking.png",
                "جدول لیگ",
              ),
              MainButtonsItem(
                "lib/assets/images/soccer_ic.png",
                "برنامه بازی ها",
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          MoreWidget("بازی های هفته جاری")
        ],
      )),
    );
  }
}

class LeaguesItem extends StatelessWidget {
  const LeaguesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      width: 350,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                "لیگ برتر انگلیس",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "بنیانگذاری: 20 فوریه 1992",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Text(
                "کشور: انگلستان",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Text(
                "کنفدراسیون: یوفا",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Text(
                "تعداد تیم های لیگ: 20 تیم",
                style: TextStyle(),
                textAlign: TextAlign.right,
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox.fromSize(
              size: Size.fromRadius(60),
              child: Image.asset('lib/assets/images/premier.png',
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}

class MainButtonsItem extends StatelessWidget {
  String image_path;
  String text;
  MainButtonsItem(this.image_path, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 50,
      padding: const EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
      decoration: BoxDecoration(
          color: Color(AppColors.primary),
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: box_shadow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          Image.asset(this.image_path),
        ],
      ),
    );
  }
}

class MoreWidget extends StatelessWidget {
  String text;
  MoreWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(color: Color(AppColors.bg_gray)),
          child: Row(
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
              Text(
                ("بیشتر"),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.black),
          height: 1,
          width: MediaQuery.of(context).size.width / 2,
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(color: Color(AppColors.bg_gray)),
          child: Text(
            (text),
          ),
        ),
      ],
    );
  }
}
