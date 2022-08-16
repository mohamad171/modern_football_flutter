import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modern_football/models/response_models/team.dart';
import 'package:modern_football/models/response_models/video.dart';
import '../assets/values/AppColors.dart';
import 'models/response_models/news.dart';

List<BoxShadow> box_shadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0,
    blurRadius: 3,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

class LeaguesItem extends StatelessWidget {
  String title;
  String founded_date;
  String country;
  String confedrasion;
  String teams_count;

  LeaguesItem(this.title, this.founded_date, this.country, this.confedrasion,
      this.teams_count,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 10),
      padding: EdgeInsets.all(10),
      width: 350,
      height: 160,
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 10,
              ),
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
              Text(
                "تعداد تیم های لیگ: ${teams_count} تیم",
                style: TextStyle(),
                textAlign: TextAlign.right,
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
              child: Image.asset('lib/assets/images/premier.png',
                  fit: BoxFit.cover),
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
  MainButtonsItem(this.image_path, this.text, this.destination_path, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 120,
        height: 50,
        padding: const EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
        decoration: BoxDecoration(
            color: Color(AppColors.primary),
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: box_shadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Image.asset(this.image_path),
          ],
        ),
      ),
      onTap: () => Get.toNamed(destination_path),
    );
  }
}

class MoreWidget extends StatelessWidget {
  String text;
  String screen_path;
  String competition_title;
  MoreWidget(this.text, this.screen_path, this.competition_title, {Key? key})
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
                  Icons.arrow_back_ios,
                  size: 18,
                ),
                Text(
                  ("بیشتر"),
                ),
              ],
            ),
            onTap: () => Get.toNamed(this.screen_path,
                arguments: {"title": competition_title}),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.grey),
          height: 1,
          width: MediaQuery.of(context).size.width / 2,
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

  MatcheItem(this.index,this.home_team,this.away_team,this.homeTeamScore,this.awayTeamScore,this.matchDay,this.matchDate,this.matchtime,this.j_matchdate);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.only(left: 10, bottom: 10),
          padding: EdgeInsets.all(10),
          width: 350,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox.fromSize(
                      size: Size(80, 80),
                      child: Image.network(
                          this.home_team.image!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${this.home_team.faName}",
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${this.matchtime}",
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
                      size: Size(60, 60),
                      child: Image.network(
                          this.away_team.image!,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${this.away_team.faName}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () => Get.toNamed("/matches-details",arguments: {"index": this.index}));
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
                child: Image.network(news.image!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Flexible(
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
                Flexible(
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
                          news.timeage!,
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
                        child: Image.network(video.image!, fit: BoxFit.cover),
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

  PreMatchItem(this.home_value, this.title_value, this.away_value, {Key? key})
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
                    : home_value.toString())),
        Text(
          title_value,
          style: TextStyle(fontSize: 18),
        ),
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
            Text(
              matches.toString(),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              width: 30,
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
