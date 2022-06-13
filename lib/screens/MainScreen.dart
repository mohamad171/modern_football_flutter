// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import '../assets/values/AppColors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:modern_football/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  CompetitionsController competitions_controller =
      Get.put(CompetitionsController());

  NewsController newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      competitions_controller.get_competitions();
    });
  }

  void league_changed(int index, CarouselPageChangedReason reason) {
    print("${index} --- ${competitions_controller.competitions[index].faName}");
    newsController
        .get_news(competitions_controller.competitions[index].id.toString());
  }

  @override
  Widget build(BuildContext context) {
    CarouselController cc = CarouselController();

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
                    onTap: () => Get.toNamed("/profile"),
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
            Obx(
              () => (competitions_controller.show_loading == true)
                  ? CircularProgressIndicator(color: Color(AppColors.primary))
                  : CarouselSlider.builder(
                      itemCount: competitions_controller.competitions.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          LeaguesItem(
                        competitions_controller.competitions[itemIndex].faName
                            .toString(),
                        competitions_controller
                            .competitions[itemIndex].foundYear
                            .toString(),
                        competitions_controller.competitions[itemIndex].country
                            .toString(),
                        competitions_controller
                            .competitions[itemIndex].confedrasion
                            .toString(),
                        competitions_controller
                            .competitions[itemIndex].numberOfTeams
                            .toString(),
                      ),
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          height: 180.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.9,
                          onPageChanged: league_changed),
                      carouselController: cc,
                    ),
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
            MoreWidget("بازی های هفته جاری", "/matches"),
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
            MoreWidget("جدیدترین اخبار لیگ", "/news"),
            SizedBox(
              height: 10,
            ),
            Obx(() => SizedBox(
                  height: newsController.heigth.toDouble(),
                  child: (newsController.show_loading == true)
                      ? SizedBox(
                          width: 40,
                          height: 30,
                          child: CircularProgressIndicator(
                              color: Color(AppColors.primary)),
                        )
                      : ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: newsController.news.length,
                          itemBuilder: (context, index) {
                            return NewsItem(
                                newsController.news[index].title,
                                newsController.news[index].description,
                                newsController.news[index].image);
                          },
                        ),
                )),
            SizedBox(
              height: 20,
            ),
            MoreWidget("جدیدترین ویدئو ها", "/videos"),
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
