import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/models/response_models/standing.dart';
import 'package:modern_football/widgets.dart';
import '../../assets/values/AppColors.dart';
import '../../models/response_models/news.dart';

class LeagueStandingScreen extends StatefulWidget {
  const LeagueStandingScreen({Key? key}) : super(key: key);

  @override
  State<LeagueStandingScreen> createState() => _LeagueStandingScreenState();
}

class _LeagueStandingScreenState extends State<LeagueStandingScreen> {
  CompetitionsController competitionsController = Get.find();
  StandingsController standingsController = Get.put(StandingsController());


  @override
  void dispose() {
    Get.delete<StandingsController>();
    super.dispose();
  }

  void get_standing(){
    standingsController.get_standings(competitionsController.competition.value.id.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    get_standing();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(AppColors.bg_gray),
        body: Column(
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
                  IconButton(iconSize: 20,
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Expanded(
                    child: Text(textAlign:TextAlign.center,
                      "جدول ${competitionsController.competition.value.faName}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  IconButton(iconSize: 25,
                    onPressed: () => Get.toNamed("/main"),
                    icon: const Icon(
                      Icons.home_outlined,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
    
              width: MediaQuery.of(context).size.width - 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child:
              Column(children: [
                  StandingHeaderItem(),
                SizedBox(height: 10,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.4,
                  child: Container(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    margin: EdgeInsets.only( bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child:
                    Obx((){
                      if(standingsController.show_loading.value)
                        return Center(
                          child: CircularProgressIndicator(color: Color(AppColors.primary),),
                        );
                      return  ListView.builder(
    
                        scrollDirection: Axis.vertical,
                        itemCount: standingsController.standings.length,
                        itemBuilder: (context, index) {
    
                          Standing standing = standingsController.standings[index];
    
                          return StandingItem(
                              standing.position!,
                              standing.team!.image!,
                              "${standing.team!.faName}",
                              (standing.recentMatch != null) ? "${standing.recentMatch.toString()[standing.recentMatch!.length - 3]}${standing.recentMatch.toString()[standing.recentMatch!.length - 2]}${standing.recentMatch.toString()[standing.recentMatch!.length - 1]}" : "",
                              standing.played!,
                              standing.points!,
                              standing.goalDifference!,
                              false);
    
    
                        },
                      );
                    }),
    
    
                  ),
                )
    
              ],),
    
            ),
          ],
        ),
      ),
    );
  }
}
