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
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      "جدول ${competitionsController.competition.value.faName}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                    ),
                    alignment: Alignment.center,
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
                      return  ListView.builder(

                        scrollDirection: Axis.vertical,
                        itemCount: standingsController.standings.length,
                        itemBuilder: (context, index) {

                          Standing standing = standingsController.standings[index];

                          return StandingItem(
                              standing.position!,
                              standing.team!.image!,
                              "${standing.team!.faName}",
                              "${standing.recentMatch}",
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
