import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/values/AppColors.dart';

List<BoxShadow> box_shadow = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 0,
    blurRadius: 3,
    offset: Offset(0, 2), // changes position of shadow
  ),
];

class LeaguesItem extends StatelessWidget {
  const LeaguesItem({Key? key}) : super(key: key);

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
            children: const [
              SizedBox(
                height: 10,
              ),
              Text(
                "لیگ برتر انگلیس",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "بنیانگذاری: 20 فوریه 1992",
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
              Text(
                "کشور: انگلستان",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Text(
                "کنفدراسیون: یوفا",
                style: TextStyle(),
                textAlign: TextAlign.right,
              ),
              Text(
                "تعداد تیم های لیگ: 20 تیم",
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
  MainButtonsItem(this.image_path, this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class MoreWidget extends StatelessWidget {
  String text;
  String screen_path;
  MoreWidget(this.text, this.screen_path, {Key? key}) : super(key: key);

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
            onTap: () => Get.toNamed(this.screen_path),
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
  const MatcheItem({Key? key}) : super(key: key);

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
                          'https://www.realmadrid.com/StaticFiles/RealMadridResponsive/images/static/og-image.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "رئال مادرید",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.calendar_month),
                      SizedBox(
                        width: 5,
                      ),
                      Text("1401/04/08")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("هفته 5"),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Icon(Icons.access_time_rounded),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "23:30",
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
                          'https://logos-world.net/wp-content/uploads/2020/04/Barcelona-Logo.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "بارسلونا",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () => Get.toNamed("/matches-details"));
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10, left: 10),
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 110,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          color: Colors.white,
          boxShadow: box_shadow,
        ),
        child: Stack(
          textDirection: TextDirection.rtl,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(40),
                    child: Image.asset('lib/assets/images/m_ch.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "قهرمانی منچستر سیتی",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "...لورم ایپسوم متنی ساختگی",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
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
                    )
                  ],
                ),
              ],
            ),
            Container(
              child: const Text(
                "5 دقیقه پیش",
                textDirection: TextDirection.rtl,
                style: TextStyle(color: Colors.grey, fontSize: 11),
              ),
              alignment: Alignment.bottomLeft,
            )
          ],
        ),
      ),
      onTap: () => Get.toNamed("/news-details"),
    );
  }
}

class VideoItem extends StatelessWidget {
  const VideoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5, bottom: 10, left: 5),
      padding: const EdgeInsets.all(10),
      width: 190,
      height: 210,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        color: Colors.white,
        boxShadow: box_shadow,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
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
                        child: Image.asset('lib/assets/images/m_ch.jpg',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    alignment: Alignment.centerLeft,
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.6)),
                    child: Text(
                      "3:30 دقیقه",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                      textDirection: TextDirection.rtl,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "جشن قهرمانی منچسترسیتی",
                textAlign: TextAlign.center,
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
                "5 دقیقه پیش",
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
              width: 35,
              height: 35,
            ),
            Text(team_name.toString()),
            SizedBox(
              width: 10,
            ),
            CircleStandingTeamForm("W"),
            CircleStandingTeamForm("D"),
            CircleStandingTeamForm("L"),
            CircleStandingTeamForm("W"),
            CircleStandingTeamForm("W"),
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
          color: (value == "W")
              ? Colors.green
              : (value == "D")
                  ? Colors.yellow
                  : Colors.red,
          shape: BoxShape.circle),
    );
  }
}
