import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/widgets.dart';

import '../../assets/values/AppColors.dart';

class TodayMatchesScreen extends StatefulWidget {
  const TodayMatchesScreen({Key? key}) : super(key: key);


  @override
  State<TodayMatchesScreen> createState() => _TodayMatchesScreenState();
}

class _TodayMatchesScreenState extends State<TodayMatchesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  CompetitionsController competitionsController = Get.find();
  MatchesController matchesController = Get.find();
  late Competition competition;
  void getTodayMatches(){
    matchesController.get_today_matches(true);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      competition = competitionsController.competition.value;
      getTodayMatches();
    });


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
                    "برنامه بازی های امروز تمام لیگ ها",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 0,height: 0,)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            Expanded(
              child:
              (matchesController.today_matches.length > 0)?
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Obx((){
                  if(matchesController.show_loading.value)
                    return Center(child: CircularProgressIndicator(color: Color(AppColors.primary),),);
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: matchesController.today_matches.length,
                    itemBuilder: (context, itemIndex) {
                      return MatcheItem(
                          itemIndex,
                          matchesController.today_matches[itemIndex].homeTeam!,
                          matchesController.today_matches[itemIndex].awayTeam!,
                          matchesController.today_matches[itemIndex].homeTeamScore!,
                          matchesController.today_matches[itemIndex].awayTeamScore!,
                          matchesController.today_matches[itemIndex].matchDay!,
                          matchesController.today_matches[itemIndex].matchDate!,
                          matchesController.today_matches[itemIndex].matchtime!,
                          matchesController.today_matches[itemIndex].j_matchdate!,
                          true
                      );
                    },
                  );
                }),
              )
              :
               Center(
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
                       Text("امروز بازی برگزار نمیشود")
                     ]),
               )

            )
          ],
        ),
      ),
    );
  }
}
