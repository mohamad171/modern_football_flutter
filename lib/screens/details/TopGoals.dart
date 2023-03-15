import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/models/response_models/standing.dart';
import 'package:modern_football/models/response_models/top_goals.dart';
import 'package:modern_football/widgets.dart';
import '../../assets/values/AppColors.dart';
import '../../models/response_models/news.dart';

class TopGoalsScreen extends StatefulWidget {
  const TopGoalsScreen({Key? key}) : super(key: key);

  @override
  State<TopGoalsScreen> createState() => _TopGoalsScreenState();
}

class _TopGoalsScreenState extends State<TopGoalsScreen> {
  CompetitionsController competitionsController = Get.find();
  TopGoalsController topGoalsController = Get.put(TopGoalsController());


  @override
  void dispose() {
    Get.delete<StandingsController>();
    super.dispose();
  }

  void get_top_goals(){
    topGoalsController.get_top_goals(competitionsController.competition.value.id.toString());
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    get_top_goals();
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
                      Icons.arrow_back_ios_new_rounded,
                    ),
                    onPressed: () => Get.back(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 120,
                    child: Text(
                      "برترین گلزنان ${competitionsController.competition.value.faName}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                    ),
                    alignment: Alignment.center,
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
                TopGoalsHeaderItem(),
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
                      if(topGoalsController.show_loading.value){
                        return Center(
                          child: CircularProgressIndicator(color: Color(AppColors.primary),),
                        );
                      }
                      return  ListView.builder(
    
                        scrollDirection: Axis.vertical,
                        itemCount: topGoalsController.top_goals.length,
                        itemBuilder: (context, index) {
    
                          TopGoals top_goal = topGoalsController.top_goals[index];
                          return TopGoalsItem(index+1, top_goal.name!, top_goal.team!.faName!, top_goal.image!, top_goal.penalty!, top_goal.score!);
    
    
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
