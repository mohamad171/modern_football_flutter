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
  NewsController newsController = Get.find<NewsController>();
  CompetitionsController competitionsController = Get.find();
  void get_news(bool clean){
    newsController.get_news(competitionsController.competition.value.id.toString(), clean);
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      get_news(true);
    });



  }

  @override
  void dispose() {
    // Get.delete<NewsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          color: Colors.black,
          height: MediaQuery.of(context).size.height,
        ),
        backgroundColor: Color(AppColors.bg_gray),
        body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
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
                IconButton(iconSize: 20,splashRadius: 1,
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                  onPressed: () => Get.back(),
                ),
                Text(
                  "اخبار ${competitionsController.competition.value.faName}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                IconButton(iconSize: 25,splashRadius: 1,
                  onPressed: () => print("ok"),
                  icon: const Icon(
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
          Obx(() => SizedBox(
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
                if(newsController.news.length > 0){
                  if(index >= newsController.news.length-1){
                    Future.delayed(Duration.zero,(){
                      newsController.add_page_number();
                      get_news(false);
                    });
                  }
                }
    
                return NewsItem(newsController.news[index], index);
    
              },
            ),
          ))
        ],
          ),
        ),
      ),
    );
  }
}
