// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../../assets/values/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modern_football/widgets.dart';

class NewsMoreScreen extends StatefulWidget {
  const NewsMoreScreen({Key? key}) : super(key: key);

  @override
  State<NewsMoreScreen> createState() => _NewsMoreScreenState();
}

class _NewsMoreScreenState extends State<NewsMoreScreen> {
  NewsController newsController = Get.find();
  CompetitionsController competitionsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                    onTap: () => Get.back(),
                  ),
                  Text(
                    "اخبار ${competitionsController.competition.value.faName}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  GestureDetector(
                    onTap: () => print("ok"),
                    child: const Icon(
                      Icons.filter_alt_outlined,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
              child: (newsController.news.length <= 0)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          Image.asset(
                            "lib/assets/images/empty.png",
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(".اخباری برای نمایش وجود ندارد")
                        ])
                  : ListView.builder(
                      itemCount: newsController.news.length,
                      itemBuilder: (context, index) {
                        return NewsItem(newsController.news[index], index);
                      },
                    ),
            )
          ],
        ),
      )),
    );
  }
}
