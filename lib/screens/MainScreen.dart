// ignore_for_file: sort_child_properties_last

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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: SafeArea(
          child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
      )),
      backgroundColor: Color(AppColors.bg_gray),
      body: SafeArea(
          child: SingleChildScrollView(
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
                children: [
                  GestureDetector(
                    child: const Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                    ),
                    onTap: () => Navigator.pushNamed(context, "/profile"),
                  ),
                  const Text(
                    "مدرن فوتبال",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: true,
                height: 180.0,
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
            MoreWidget("بازی های هفته جاری"),
            SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 150.0,
                aspectRatio: 16 / 9,
                viewportFraction: 0.9,
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return const MatcheItem();
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            MoreWidget("جدیدترین اخبار لیگ"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  NewsItem(),
                  NewsItem(),
                  NewsItem(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MoreWidget("جدیدترین ویدئو ها"),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                children: [
                  VideoItem(),
                  VideoItem(),
                  VideoItem(),
                ],
              ),
            )
          ],
        ),
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
          decoration: BoxDecoration(color: Colors.grey),
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

class MatcheItem extends StatelessWidget {
  const MatcheItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      width: 350,
      height: 140,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.fromSize(
                  size: Size(80, 80),
                  child: Image.network(
                      'https://www.realmadrid.com/StaticFiles/RealMadridResponsive/images/static/og-image.png',
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "رئال مادرید",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.calendar_month),
                  SizedBox(
                    width: 5,
                  ),
                  Text("1401/04/08")
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text("هفته 5"),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Icon(Icons.access_time_rounded),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "23:30",
                    textAlign: TextAlign.center,
                  )
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.fromSize(
                  size: Size(60, 60),
                  child: Image.network(
                      'https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png',
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "بارسلونا",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      width: 300,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Stack(
        textDirection: TextDirection.rtl,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(40),
                  child: Image.asset('lib/assets/images/m_ch.jpg',
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "قهرمانی منچستر سیتی",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "...لورم ایپسوم متنی ساختگی",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Color(AppColors.primary),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6))),
                    child: const Text(
                      "ورزش 3",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            child: const Text(
              "5 دقیقه پیش",
              textDirection: TextDirection.rtl,
              style: TextStyle(color: Colors.grey, fontSize: 11),
            ),
            alignment: Alignment.bottomLeft,
          )
        ],
      ),
    );
  }
}

class VideoItem extends StatelessWidget {
  const VideoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      width: 190,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        textDirection: TextDirection.rtl,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.fromSize(
                        size: const Size(190, 110),
                        child: Image.asset('lib/assets/images/m_ch.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.6)),
                    child: Text(
                      "3:30 دقیقه",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "جشن قهرمانی منچسترسیتی",
                textAlign: TextAlign.center,
              )
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    color: Color(AppColors.primary),
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: const Text(
                  "ورزش 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "5 دقیقه پیش",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}
