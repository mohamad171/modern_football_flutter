// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  NewsController newsController = Get.put(NewsController());
  VideosController videosController = Get.put(VideosController());
  MatchesController matchesController = Get.put(MatchesController());
  CompetitionsController competitions_controller =
      Get.put(CompetitionsController());


  String? selected_competition_title;
  Competition? selected_competition;
  int? selected_index = 0;
  String? competition_title;
  bool is_first = true;
  CarouselController cc = CarouselController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      competitions_controller.get_competitions();






    });
  }

  void league_changed(int index, CarouselPageChangedReason reason) {
    competition_title = competitions_controller.competitions[index].faName.toString();
    Competition competition = competitions_controller.competitions[index];
    newsController
        .get_news(competitions_controller.competitions[index].id.toString(),true);

    matchesController.get_matches(competition.id.toString(), competition.currentMatchday.toString(),false);
    competitions_controller.set_selected_competition(competitions_controller.competitions[index]);


    // videosController
    //     .get_videos(competition.id.toString(),true);

    videosController
        .set_competition_id(competition.id);
    videosController.set_competition_title(
        competition.faName);


  }
  @override
  void dispose() {
    // Get.delete<NewsController>();
    // Get.delete<VideosController>();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    int flex = 25;


    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
                IconButton(iconSize: 27,splashRadius: 1,
                  icon: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black87,
                  ),
                  onPressed: () => Get.toNamed("/profile"),
                ),
    
                const Text(
                  "مدرن فوتبال",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(iconSize: 25,splashRadius: 1,
                  icon: Icon(Icons.today,color: Color(AppColors.primary),),
                  onPressed: () => Get.toNamed("/today-matches"),
                )
    
    
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            child: Obx(
                  () {
                if (competitions_controller.show_loading == true) {
                  return CircularProgressIndicator(strokeWidth: 2,
                      color: Color(AppColors.primary));
                } else {
    
    
                  return CarouselSlider.builder(
                    itemCount: competitions_controller.competitions.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                        LeaguesItem(
                          competitions_controller.competitions[itemIndex].image!,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(child: Container(),flex: 1,),
              Expanded(flex: flex,
                child: MainButtonsItem("lib/assets/images/ic_goal.png",
                    "برترین گلزنان", "/top-goals"),
              ),
              Expanded(child: Container(),flex: 1,),
              Expanded(flex: flex,
                child: MainButtonsItem(
                    "lib/assets/images/ic_league.png", "جدول لیگ", "/competition-standing",competition_id: competitions_controller.competition.value.id,),
              ),
              Expanded(child: Container(),flex: 1,),
              Expanded(flex: flex,
                child: MainButtonsItem("lib/assets/images/ic_plan.png",
                    "برنامه بازی ها", "/matches"),
              ),
            
              Expanded(child: Container(),flex: 1,)],
          ),
          const SizedBox(
            height: 20,
          ),
          MoreWidget("بازی های هفته جاری", "/matches",),
          SizedBox(
            height: 10,
          ),
          Obx(
                () {
    
              if (matchesController.show_loading.value) {
                return CircularProgressIndicator(strokeWidth: 2,
                    color: Color(AppColors.primary));
              } else {
                if(matchesController.matches.length > 0){
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 5.5,
                    child: ListView.builder(
                      padding: EdgeInsets.only(right: 10,left: 20),
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: matchesController.matches.length,
                      itemBuilder: (context, index) {
                        return MatcheItem(
                          20,
                          0,
                            index,
                            matchesController.matches[index].homeTeam!,
                            matchesController.matches[index].awayTeam!,
                            matchesController.matches[index].homeTeamScore!,
                            matchesController.matches[index].awayTeamScore!,
                            matchesController.matches[index].matchDay!,
                            matchesController.matches[index].matchDate!,
                            matchesController.matches[index].matchtime!,
                            matchesController.matches[index].j_matchdate!,
                            true
                        );
                      },),
                  );
    
    
                }else{
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
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
                            Text(".بازی برای نمایش وجود ندارد")
                          ]),
                    ),
                  );
                }
    
              }
            },
          ),
    
          SizedBox(
            height: 20,
          ),
          MoreWidget("جدیدترین اخبار لیگ", "/news"),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            if (newsController.show_loading.value) {
              return CircularProgressIndicator(strokeWidth: 2,
                  color: Color(AppColors.primary));
            } else {
              if (newsController.news.length > 0) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 5.8,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
          SizedBox(height: 20,)
          // TODO Videos is here
          // SizedBox(
          //   height: 20,
          // ),
          // MoreWidget("جدیدترین ویدئو ها", "/videos"),
          // SizedBox(
          //   height: 10,
          // ),
          // Container(
          //
          //   child: Obx((() {
          //     if (videosController.show_loading.value) {
          //       return CircularProgressIndicator(
          //           color: Color(AppColors.primary));
          //     } else {
          //       if (videosController.videos.length > 0) {
          //         return SizedBox(
          //           height: MediaQuery.of(context).size.height / 4.2,
          //           child: ListView.builder(
          //             reverse: true,
          //             scrollDirection: Axis.horizontal,
          //             itemCount: videosController.videos.length,
          //             itemBuilder: (context, index) {
          //               return VideoItem(videosController.videos[index], index);
          //             },
          //           ),
          //         );
          //       } else {
          //         return SizedBox(
          //           height: videosController.heigth.toDouble(),
          //           child: Center(
          //             child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Image.asset(
          //                     "lib/assets/images/empty.png",
          //                     width: 50,
          //                     height: 50,
          //                   ),
          //                   SizedBox(
          //                     height: 15,
          //                   ),
          //                   Text(".ویدئویی برای نمایش وجود ندارد")
          //                 ]),
          //           ),
          //         );
          //       }
          //     }
          //   })),
          // )
        ],
          ),
        ),
      ),
    );
  }
}
