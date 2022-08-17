

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/match.dart';
import 'package:modern_football/models/response_models/standing.dart';

import '../../widgets.dart';

class MatchesDetails extends StatefulWidget {
  const MatchesDetails({Key? key}) : super(key: key);

  @override
  State<MatchesDetails> createState() => _MatchesDetailsState();
}

class _MatchesDetailsState extends State<MatchesDetails>
    with TickerProviderStateMixin {
  late TabController _tabController;
  MatchesController matchesController = Get.find();
  StandingsController standingsController = Get.put(StandingsController());
  late Match match;

  void getStandings(){

    standingsController.get_standings(match.homeTeam!.competition!.id.toString());


  }

  @override
  void dispose() {
    Get.delete<StandingsController>();
    super.dispose();
  }

  @override
  void initState() {
    match = matchesController.matches[Get.arguments["index"]];
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    _tabController.addListener(() {
      if(_tabController.index == 0){
        getStandings();
      }
    });
    super.initState();
  }

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
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 25,
                  ),
                  onTap: () => Get.back(),
                ),
                Text(
                  "${match.homeTeam!.faName} - ${match.awayTeam!.faName}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed("/main"),
                  child: const Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            textDirection: TextDirection.rtl,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      size: Size(100, 100),
                      child: Image.network(
                          match.homeTeam!.image!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${match.homeTeam!.faName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${match.j_matchdate}")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("هفته ${match.matchDay}"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${match.matchtime}",
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
                      size: Size(90, 90),
                      child: Image.network(
                          match.awayTeam!.image!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${match.awayTeam!.faName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 55,
            width: MediaQuery.of(context).size.width - 10,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  15.0,
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
                  text: 'جدول لیگ',
                ),
                Tab(
                  text: 'ویدئوها',
                ),
                Tab(
                  text: 'اخبار',
                ),
                Tab(
                  text: 'پیش بازی',
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            endIndent: 30,
            indent: 30,
            color: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        boxShadow: box_shadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child:
                    Obx((){
                      return  ListView.builder(

                        scrollDirection: Axis.vertical,
                        itemCount: standingsController.standings.length+1,
                        itemBuilder: (context, index) {
                          if(index == 0){
                            return StandingHeaderItem();
                          }
                          Standing standing = standingsController.standings[index-1];
                          if(standing.team!.id == match.homeTeam!.id ||  standing.team!.id == match.awayTeam!.id){
                            return StandingItem(
                                standing.position!,
                                standing.team!.image!,
                                "${standing.team!.faName}",
                                "${standing.recentMatch}",
                                standing.played!,
                                standing.points!,
                                standing.goalDifference!,
                                true);
                          }else{
                            return StandingItem(
                                standing.position!,
                                standing.team!.image!,
                                "${standing.team!.faName}",
                                "${standing.recentMatch}",
                                standing.played!,
                                standing.points!,
                                standing.goalDifference!,
                                false);
                          }

                        },
                      );
                    }),


                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [],
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                        boxShadow: box_shadow,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: ListView(children: []),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:
                  ListView(
                    children: [
                      PreMatchItem(match.away_standing!.position!, "رتبه", match.home_standing!.position!,false),
                      PreMatchItem(match.away_standing!.won!, "برد", match.home_standing!.won!,true),
                      PreMatchItem(match.away_standing!.drawn!, "مساوی", match.home_standing!.drawn!,true),
                      PreMatchItem(match.away_standing!.lost!, "باخت", match.home_standing!.lost!,false),
                      PreMatchItem(match.away_standing!.goalsFor!, "گل زده", match.home_standing!.goalsFor!,true),
                      PreMatchItem(match.away_standing!.goalsAgainst!, "گل خورده", match.home_standing!.goalsAgainst!,false),
                      PreMatchItem(match.away_standing!.points!, "امتیاز", match.home_standing!.points!,true),
                      // PreMatchItem(90, "احتمال برد", 10,true),
                    ],
                  ),
                )
              ],
              controller: _tabController,
            ),
          )
        ],
      )),
    );
  }
}
