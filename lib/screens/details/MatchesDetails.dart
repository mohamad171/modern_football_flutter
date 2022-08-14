import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/assets/values/AppColors.dart';
import 'package:modern_football/controllers/auth_api_controller.dart';
import 'package:modern_football/models/response_models/match.dart';

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

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Match match = matchesController.matches[Get.arguments["index"]];
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
                    child: ListView(children: [
                      StandingHeaderItem(),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          true),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          true),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false),
                      StandingItem(
                          1,
                          "https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png",
                          "بارسلونا",
                          "W,L,L,L,L",
                          30,
                          10,
                          60,
                          false)
                    ]),
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
                  child: ListView(
                    children: [
                      PreMatchItem(1, "رتبه", 6),
                      PreMatchItem(18, "برد", 12),
                      PreMatchItem(5, "مساوی", 9),
                      PreMatchItem(0, "باخت", 10),
                      PreMatchItem(58, "گل زده", 23),
                      PreMatchItem(12, "گل خورده", 32),
                      PreMatchItem(65, "امتیاز", 35),
                      PreMatchItem(90, "احتمال برد", 10),
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
