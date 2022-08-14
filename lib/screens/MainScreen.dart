// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/competition.dart';
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
  VideosController videosController = Get.put(VideosController());
  MatchesController matchesController = Get.put(MatchesController());
  String? selected_competition_title;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      competitions_controller.get_competitions();
    });
  }

  void league_changed(int index, CarouselPageChangedReason reason) {
    Competition competition = competitions_controller.competitions[index];
    newsController
        .get_news(competitions_controller.competitions[index].id.toString());

    matchesController.get_matches(competition.id.toString(), competition.currentMatchday.toString());

    videosController
        .get_videos(competition.id.toString());
    selected_competition_title =
        competition.faName.toString();
    videosController
        .set_competition_id(competition.id);
    videosController.set_competition_title(
        competition.faName);
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
              () {
                if (competitions_controller.show_loading == true) {
                  return CircularProgressIndicator(
                      color: Color(AppColors.primary));
                } else {
                  newsController.get_news(
                      competitions_controller.competitions[0].id.toString());

                  videosController.get_videos(
                      competitions_controller.competitions[0].id.toString());

                  matchesController.get_matches(
                      competitions_controller.competitions[0].id.toString(),competitions_controller.competitions[0].currentMatchday.toString());

                  return CarouselSlider.builder(
                    itemCount: competitions_controller.competitions.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        LeaguesItem(
                      competitions_controller.competitions[itemIndex].faName
                          .toString(),
                      competitions_controller.competitions[itemIndex].foundYear
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
                  );
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainButtonsItem("lib/assets/images/football_icon.png",
                    "برترین گلزنان", "/main"),
                MainButtonsItem(
                    "lib/assets/images/ranking.png", "جدول لیگ", "/main"),
                MainButtonsItem("lib/assets/images/soccer_ic.png",
                    "برنامه بازی ها", "/matches")
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MoreWidget("بازی های هفته جاری", "/matches",
                "برنامه بازی های ${selected_competition_title}"),
            SizedBox(
              height: 10,
            ),
            Obx(
                  () {
                if (matchesController.show_loading == true) {
                  return CircularProgressIndicator(
                      color: Color(AppColors.primary));
                } else {
                  return CarouselSlider.builder(
                    itemCount: matchesController.matches.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                        MatcheItem(
                            matchesController.matches[itemIndex].homeTeam!,
                            matchesController.matches[itemIndex].awayTeam!,
                            matchesController.matches[itemIndex].homeTeamScore!,
                            matchesController.matches[itemIndex].awayTeamScore!,
                            matchesController.matches[itemIndex].matchDay!,
                            matchesController.matches[itemIndex].matchDate!
                        ),
                    options: CarouselOptions(
                      height: 150.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.9,
                    ),
                    carouselController: cc,
                  );
                }
              },
            ),

            SizedBox(
              height: 20,
            ),
            MoreWidget("جدیدترین اخبار لیگ", "/news",
                "اخبار ${selected_competition_title}"),
            SizedBox(
              height: 10,
            ),
            Obx(() {
              if (newsController.show_loading == true) {
                return SizedBox(
                  height: newsController.heigth.toDouble(),
                  child: CircularProgressIndicator(
                      color: Color(AppColors.primary)),
                );
              } else {
                if (newsController.news.length > 0) {
                  return SizedBox(
                    height: newsController.heigth.toDouble(),
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newsController.news.length,
                      itemBuilder: (context, index) {
                        return NewsItem(newsController.news[index], index);
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    height: newsController.heigth.toDouble(),
                    child: Center(
                      child: Column(
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
                          ]),
                    ),
                  );
                }
              }
            }),
            SizedBox(
              height: 20,
            ),
            MoreWidget("جدیدترین ویدئو ها", "/videos",
                "ویدئوهای ${selected_competition_title}"),
            SizedBox(
              height: 10,
            ),
            Obx((() {
              if (newsController.show_loading == true) {
                return SizedBox(
                  height: videosController.heigth.toDouble(),
                  child: CircularProgressIndicator(
                      color: Color(AppColors.primary)),
                );
              } else {
                if (videosController.videos.length > 0) {
                  return SizedBox(
                    height: videosController.heigth.toDouble(),
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: videosController.videos.length,
                      itemBuilder: (context, index) {
                        return VideoItem(videosController.videos[index], index);
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    height: videosController.heigth.toDouble(),
                    child: Center(
                      child: Column(
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
                            Text(".ویدئویی برای نمایش وجود ندارد")
                          ]),
                    ),
                  );
                }
              }
            }))
          ],
        ),
      )),
    );
  }
}
