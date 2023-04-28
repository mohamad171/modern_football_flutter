import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_football/models/response_models/competition.dart';
import 'package:modern_football/models/response_models/team.dart';
import 'package:modern_football/models/response_models/video.dart';
import '../assets/values/AppColors.dart';
import 'models/response_models/news.dart';

List<BoxShadow> box_shadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.1),
    blurRadius: 5,
    offset: Offset(2, 2), // changes position of shadow
  ),
];

class LeaguesItem extends StatelessWidget {
  String image;
  String title;
  String founded_date;
  String country;
  String confedrasion;
  String teams_count;

  LeaguesItem(this.image,this.title, this.founded_date, this.country, this.confedrasion,
      this.teams_count,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 15),
      padding: EdgeInsets.all(10),
      width: 350,
      height: 190,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                this.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "بنیانگذاری: ${founded_date}",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Text(
                "کشور: ${country}",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Text(
                "کنفدراسیون: ${confedrasion}",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Expanded(
                child: Text(
                  "تعداد تیم های لیگ: ${teams_count} تیم",
                  style: TextStyle(),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox.fromSize(
              size: Size.fromRadius(60),
              child: Image.network(this.image,
                  fit: BoxFit.scaleDown),
            ),
          ),
        ],
      ),
    );
  }
}

class MainButtonsItem extends StatelessWidget {
  String image_path;
  String text;
  String destination_path;
  int? competition_id;
  MainButtonsItem(this.image_path, this.text, this.destination_path, {Key? key,this.competition_id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Color(AppColors.primary),
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: box_shadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:3.0),
              child: Text(
                text,
                style: TextStyle(color: Colors.white,fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            Container(width: 20,height: 20,child: Image.asset(this.image_path)),
          ],
        ),
      ),
      onTap: () => Get.toNamed(destination_path,arguments: {"competition_id":competition_id}),
    );
  }
}

class MoreWidget extends StatelessWidget {
  String text;
  String screen_path;

  MoreWidget(this.text, this.screen_path, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(color: Color(AppColors.bg_gray)),
          child: GestureDetector(
            child: Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18,
                ),
                Text(
                  ("بیشتر"),
                ),
              ],
            ),
            onTap: () => Get.toNamed(this.screen_path),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(color: Colors.grey),
            height: 1,
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(color: Color(AppColors.bg_gray)),
          child: Text(
            (text),
          ),
        ),
      ],
    );
  }
}

class MatcheItem extends StatelessWidget {
  Team home_team;
  Team away_team;
  int index;
  int homeTeamScore;
  int awayTeamScore;
  int matchDay;
  String matchDate;
  String matchtime;
  String j_matchdate;
  bool match_details;
  double margin_right;
  double width;

  MatcheItem(this.width,this.margin_right,this.index,this.home_team,this.away_team,this.homeTeamScore,this.awayTeamScore,this.matchDay,this.matchDate,this.matchtime,this.j_matchdate,this.match_details);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10,right: margin_right),
          padding: EdgeInsets.all(10),
          width: Get.width-width,
          height: 140,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            color: Colors.white,
            boxShadow: box_shadow,
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                      width: Get.width*.2,
                      height:Get.width*.2,
                      this.home_team.image!,
                      fit: BoxFit.scaleDown),
                      SizedBox(height: 5,),
                  Expanded(
                    child: Text(
                      "${this.home_team.faName}",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Text("${(homeTeamScore >= 0) ? homeTeamScore : ''}",style: TextStyle(fontSize: 20),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:  [
                      const SizedBox(
                        width: 5,
                      ),
                      Text("${this.j_matchdate}")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("هفته ${this.matchDay}"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(width: 20,height:20,child: Lottie.asset('lib/assets/images/ic_clock_animation.json')),
                      const SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          "${this.matchtime}",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Text("${(awayTeamScore >= 0) ? awayTeamScore : ''}",style: TextStyle(fontSize: 20),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(width: Get.width*.2,
                  height:Get.width*.2,
                      this.away_team.image!,
                      fit: BoxFit.scaleDown),
                      SizedBox(height: 5,),
                  Expanded(
                    child: Text(
                      "${this.away_team.faName}",
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: (){
          if(match_details){
            Get.toNamed("/matches-details",arguments: {"index": this.index});
          }else{
            Get.snackbar('اطلاع', 'جزئیات فقط برای هفته جاری امکان پذیر میباشد.',
                snackPosition: SnackPosition.BOTTOM,
                maxWidth: double.infinity - 30,
                titleText: const Text(
                  "اطلاع",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                messageText: const Text(
                  "جزئیات فقط برای هفته جاری امکان پذیر میباشد.",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ));
          }

        });
  }
}

class NewsItem extends StatelessWidget {
  NewsItem(this.news, this.index, {Key? key}) : super(key: key);
  News news;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.3,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.white,
          boxShadow: box_shadow,
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox.fromSize(
                size: Size(90, 100),
                child: Image.network(news.image!, fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Icon(Icons.image_outlined,size: 50,color: Colors.grey.withOpacity(0.6),)),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    news.title!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text(
                    news.shortdescription!,
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Color(AppColors.primary),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6))),
                        child: const Text(
                          "ورزش 3",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          news.get_created_at(),
                          textDirection: TextDirection.rtl,
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        alignment: Alignment.centerLeft,
                      )
                    ],
                  ),
                )
              ],
            )),
          ],
        ),
      ),
      onTap: () =>
          Get.toNamed("/news-details", arguments: {"index": this.index}),
    );
  }
}

class VideoItem extends StatelessWidget {
  Video video;
  int index;
  VideoItem(this.video, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 10, left: 5),
      padding: const EdgeInsets.all(9),
      width: 190,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Flex(
        direction: Axis.vertical,
        textDirection: TextDirection.rtl,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox.fromSize(
                        size: const Size(190, 110),
                        child: Image.network(video.image!, fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) => Icon(Icons.image_outlined,size: 50,color: Colors.grey.withOpacity(0.6),),),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.6)),
                    child: Text(
                      "${video.duration} دقیقه",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  "${video.title}",
                  overflow: TextOverflow.ellipsis,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(3),
                height: 25,
                width: 50,
                decoration: BoxDecoration(
                    color: Color(AppColors.primary),
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: const Text(
                  "ورزش 3",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "${video.timeago}",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PreMatchItem extends StatelessWidget {
  int home_value;
  int away_value;
  String title_value;
  bool big_better;

  PreMatchItem(this.home_value, this.title_value, this.away_value,this.big_better, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: box_shadow),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        (big_better == true) ?
        (home_value > away_value)
            ? CirclePrematchItem(
                true,
                (title_value == "احتمال برد"
                    ? home_value.toString() + "%"
                    : home_value.toString()))
            : CirclePrematchItem(
                false,
                (title_value == "احتمال برد"
                    ? home_value.toString() + "%"
                    : home_value.toString()))
        :
        (home_value < away_value)
        ? CirclePrematchItem(
        true,
        (title_value == "احتمال برد"
            ? home_value.toString() + "%"
            : home_value.toString()))
        : CirclePrematchItem(
        false,
        (title_value == "احتمال برد"
            ? home_value.toString() + "%"
            : home_value.toString())),

        Text(
          title_value,
          style: TextStyle(fontSize: 18),
        ),

        (big_better == true) ?
        (home_value < away_value)
            ? CirclePrematchItem(
                true,
                (title_value == "احتمال برد"
                    ? away_value.toString() + "%"
                    : away_value.toString()))
            : CirclePrematchItem(
                false,
                (title_value == "احتمال برد"
                    ? away_value.toString() + "%"
                    : away_value.toString()))
            :
        (home_value > away_value)
            ? CirclePrematchItem(
            true,
            (title_value == "احتمال برد"
                ? away_value.toString() + "%"
                : away_value.toString()))
            : CirclePrematchItem(
            false,
            (title_value == "احتمال برد"
                ? away_value.toString() + "%"
                : away_value.toString()))
      ]),
    );
  }
}

class CirclePrematchItem extends StatelessWidget {
  bool is_green;
  String value;
  CirclePrematchItem(this.is_green, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: box_shadow,
          color: (is_green == true)
              ? Color(AppColors.primary)
              : Color(AppColors.bg_gray),
          border: Border.all(color: Colors.white, width: 2)),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
              fontSize: 18, color: (is_green) ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}

class StandingHeaderItem extends StatelessWidget {
  const StandingHeaderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      margin: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: box_shadow,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(textDirection: TextDirection.rtl, children: [
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Text("#"),
            SizedBox(
              width: 10,
            ),
            Text("نام تیم"),
          ]),
          flex: 3,
        ),
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text("بازی"),
                Text("امتیاز"),
                Text("تفاضل گل"),
              ]),
          flex: 2,
        )
      ]),
    );
  }
}
class TopGoalsHeaderItem extends StatelessWidget {
  const TopGoalsHeaderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      margin: EdgeInsets.only(right: 5, left: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: box_shadow,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(textDirection: TextDirection.rtl, children: [
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Text("#"),
            SizedBox(
              width: 10,
            ),
            Text("نام بازیکن"),
          ]),
          flex: 3,
        ),
        Expanded(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.rtl,
              children: [
                Text("تعداد گل"),
                Text("تعداد پنالتی"),
              ]),
          flex: 2,
        )
      ]),
    );
  }
}
class TopGoalsItem extends StatelessWidget {
  int rank;
  String player_name;
  String player_image;
  String team_name;
  int score;
  int penalties;
  TopGoalsItem(this.rank, this.player_name, this.team_name, this.player_image,
      this.penalties, this.score,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: box_shadow,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(textDirection: TextDirection.rtl, children: [
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Text(this.rank.toString()),
            SizedBox(
              width: 10,
            ),
            Image.network(
              player_image,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) => Image.asset("lib/assets/images/ic_player_default.png",width: 40,
                height: 40,),
            ),
            SizedBox(
              width: 5,
            ),
            Text("${player_name.toString()}\n${team_name}",textAlign: TextAlign.center,),

          ]),
          flex: 5,
        ),
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Text(
              score.toString(),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              penalties.toString(),
              textAlign: TextAlign.right,
            ),
          ]),
          flex: 2,
        )
      ]),
    );
  }
}
class StandingItem extends StatelessWidget {
  int rank;
  String team_logo;
  String team_name;
  String form;
  int matches;
  int score;
  int diffrence_goals;
  bool mark;
  StandingItem(this.rank, this.team_logo, this.team_name, this.form,
      this.matches, this.score, this.diffrence_goals, this.mark,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
      margin: EdgeInsets.only(right: 5, left: 5, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: (mark) ? Colors.green[100] : Colors.white,
        boxShadow: box_shadow,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(textDirection: TextDirection.rtl, children: [
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Text(this.rank.toString()),
            SizedBox(
              width: 10,
            ),
            Image.network(
              team_logo,
              width: 20,
              height: 20,
            ),
            Text(team_name.toString()),
            SizedBox(
              width: 10,
            ),
            for(var i in this.form.split("")) CircleStandingTeamForm(i)


          ]),
          flex: 3,
        ),
        Expanded(
          child: Row(textDirection: TextDirection.rtl, children: [
            Expanded(
              child: Text(
                matches.toString(),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              score.toString(),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 40,
            ),
            Text(
              diffrence_goals.toString(),
              textAlign: TextAlign.right,
            ),
          ]),
          flex: 2,
        )
      ]),
    );
  }
}

class CircleStandingTeamForm extends StatelessWidget {
  String value;

  CircleStandingTeamForm(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: (value == "W" || value == "w")
              ? Colors.green
              : (value == "D" || value == "d")
                  ? Colors.yellow
                  : Colors.red,
          shape: BoxShape.circle),
    );
  }
}
