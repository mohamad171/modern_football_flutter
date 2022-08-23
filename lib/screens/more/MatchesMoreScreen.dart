import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/widgets.dart';

import '../../assets/values/AppColors.dart';

class MatchesMoreScreen extends StatefulWidget {
  const MatchesMoreScreen({Key? key}) : super(key: key);


  @override
  State<MatchesMoreScreen> createState() => _MatchesMoreScreenState();
}

class _MatchesMoreScreenState extends State<MatchesMoreScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  CompetitionsController competitionsController = Get.find();
  MatchesController matchesController = Get.put(MatchesController(),tag: "controller_from_more");
  late Competition competition;
  void getCurrentMatches(int matchday){
    matchesController.get_matches(competition.id.toString(), matchday.toString(),true);
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    competition = competitionsController.competition.value;
    _tabController.addListener(() {
      print(_tabController.index);
      if(_tabController.index == 1){
        getCurrentMatches(competition.currentMatchday!);
      }else if(_tabController.index == 0){
        getCurrentMatches(competition.currentMatchday!+1);
      }
      else if(_tabController.index == 2){
        if(competition.currentMatchday!>1){
          getCurrentMatches(competition.currentMatchday!-1);
        }

      }
    });
    getCurrentMatches(competition.currentMatchday!);
    super.initState();
  }

  @override
  void dispose() {
    // Get.delete<MatchesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.bg_gray),
      body: SafeArea(
        child: Column(
          textDirection: TextDirection.rtl,
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
                    "برنامه بازی های ${competition.faName}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(5),
              height: 55,
              width: MediaQuery.of(context).size.width - 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  boxShadow: box_shadow),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Color(AppColors.primary),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'هفته آینده',
                  ),
                  Tab(
                    text: 'هفته جاری',
                  ),
                  Tab(
                    text: 'هفته گذشته',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              endIndent: 30,
              indent: 30,
              color: Colors.black,
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Obx((){
                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: matchesController.matches.length,
                        itemBuilder: (context, itemIndex) {
                          return MatcheItem(
                              itemIndex,
                              matchesController.matches[itemIndex].homeTeam!,
                              matchesController.matches[itemIndex].awayTeam!,
                              matchesController.matches[itemIndex].homeTeamScore!,
                              matchesController.matches[itemIndex].awayTeamScore!,
                              matchesController.matches[itemIndex].matchDay!,
                              matchesController.matches[itemIndex].matchDate!,
                              matchesController.matches[itemIndex].matchtime!,
                              matchesController.matches[itemIndex].j_matchdate!,
                            false
                          );
                        },
                      );
                    }),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Obx((){
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: matchesController.matches.length,
                          itemBuilder: (context, itemIndex) {
                            return MatcheItem(
                                itemIndex,
                                matchesController.matches[itemIndex].homeTeam!,
                                matchesController.matches[itemIndex].awayTeam!,
                                matchesController.matches[itemIndex].homeTeamScore!,
                                matchesController.matches[itemIndex].awayTeamScore!,
                                matchesController.matches[itemIndex].matchDay!,
                                matchesController.matches[itemIndex].matchDate!,
                                matchesController.matches[itemIndex].matchtime!,
                                matchesController.matches[itemIndex].j_matchdate!,
                              true
                            );
                          },
                        );
                      })

                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Obx((){
                            return ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: matchesController.matches.length,
                            itemBuilder: (context, itemIndex) {
                            return MatcheItem(
                            itemIndex,
                            matchesController.matches[itemIndex].homeTeam!,
                            matchesController.matches[itemIndex].awayTeam!,
                            matchesController.matches[itemIndex].homeTeamScore!,
                            matchesController.matches[itemIndex].awayTeamScore!,
                            matchesController.matches[itemIndex].matchDay!,
                            matchesController.matches[itemIndex].matchDate!,
                            matchesController.matches[itemIndex].matchtime!,
                            matchesController.matches[itemIndex].j_matchdate!,
                              false
                            );
                            },
                            );
                            }))
                ],
                controller: _tabController,
              ),
            )
          ],
        ),
      ),
    );
  }
}
