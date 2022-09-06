import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/models/response_models/check_code_response.dart';
import 'package:modern_football/models/response_models/news.dart';
import 'package:modern_football/models/response_models/server_response.dart';
import 'package:modern_football/models/response_models/standing.dart';
import 'package:modern_football/models/response_models/top_goals.dart';
import 'package:modern_football/models/response_models/video.dart';
import 'package:modern_football/providers/api.dart';

import '../models/response_models/competition.dart';
import '../models/response_models/user.dart';
import 'package:modern_football/models/response_models/match.dart' as matchmodel;

class AuthApiController extends GetxController {
  void SendCode(String phone_number) {
    ApiProvider().send_code(phone_number).then((value) {
      var server_response = ServerResponse.fromJson(value.body);
      if (server_response.status == "ok") {
        Get.toNamed('/code', arguments: phone_number);
      }
    });
  }

  void CheckCode(String phone_number, String code) {
    ApiProvider().check_code(phone_number, code).then((value) {
      var response = CheckCodeResponse.fromJson(value.body);
      if (response.status == "expire" || response.status == "invalid") {
        Get.snackbar('خطا', 'کد وارد شده صحیح نمیباشد',
            snackPosition: SnackPosition.BOTTOM,
            maxWidth: double.infinity - 30,
            titleText: const Text(
              "خطا",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            messageText: const Text(
              "کد وارد شده صحیح نمیباشد",
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ));
      } else {
        GetStorage storage = GetStorage();
        storage.write("token", response.token);
        Get.toNamed("/");
      }
    });
  }
}

class ProfileController extends GetxController {
  final user = User().obs;
  void get_profile() {
    ApiProvider().profile().then((value) {
      user.update((user) {
        user!.id = value.body["id"];
        user.username = value.body["username"];
        user.firstName = value.body["first_name"];
        user.lastName = value.body["last_name"];
        user.email = value.body["email"];
      });

      Get.offNamed("/main");
    });
  }
}

class CompetitionsController extends GetxController {
  final competitions = <Competition>[].obs;
  var show_loading = true.obs;
  final competition = Competition().obs;

  void set_selected_competition(Competition com){
    competition.update((co){
      co!.faName = com.faName;
      co.id = com.id;
      co.image = com.image;
      co.foundYear = com.foundYear;
      co.numberOfTeams = com.numberOfTeams;
      co.currentMatchday = com.currentMatchday;
      co.confedrasion = com.confedrasion;
      co.country = com.country;
      co.code = com.code;
    });

  }
  void get_competitions() {
    int counter = 0;
    ApiProvider().competitions().then((value) {
      value.body.forEach(
        (element) {
          if(counter == 0){
            set_selected_competition(Competition.fromJson(element));
          }
          competitions.add(Competition.fromJson(element));
          counter++;
        },
      );

      show_loading(false);
      update();
    });
  }
}

class NewsController extends GetxController {
  final news = <News>[].obs;
  var show_loading = true.obs;
  var heigth = 40.0.obs;
  var page_number = 1.obs;

  void add_page_number(){
    page_number+=1;
    update();
    print("update");
  }
  void get_news(String com_id,bool clear) {
    show_loading = true.obs;
    update();
    print(page_number);
    for(News n in news){
      print(n.id);
    }



    ApiProvider().news(com_id,page_number.toInt()).then((value) {
      if(clear){
        news.clear();
      }
      print(page_number);


      value.body["results"].forEach(
        (element) {
          var contains = news.where((p0) => p0.id == News.fromJson(element).id);
          if(contains.length == 0){
            news.add(News.fromJson(element));
          }
        },
      );
      show_loading(false);
      update();
      heigth(140);
      update();
    });
  }
  void get_news_with_tag(String tag) {
    ApiProvider().news_with_tag(tag).then((value) {
      news.clear();
      value.body["results"].forEach(
            (element) {
          news.add(News.fromJson(element));
        },
      );
      show_loading(false);
      update();
      heigth(140);
      update();
    });
  }
}


class MatchesController extends GetxController {
  final matches = <matchmodel.Match>[].obs;
  var show_loading = true.obs;
  var heigth = 40.0.obs;
  void get_matches(String com_id,String match_day,bool clear) {
    if(clear)
      matches.clear();
    ApiProvider().matches(com_id,match_day).then((value) {
      if(!clear)
      matches.clear();
      value.body.forEach(
            (element) {
          matches.add(matchmodel.Match.fromJson(element));
        },
      );
      show_loading(false);
      heigth(150);
    });
  }
  void get_today_matches(bool clear) {
    // if(clear)
    //   matches.clear();
    // show_loading(true);
    ApiProvider().today_matches().then((value) {

      matches.clear();
      value.body.forEach(
            (element) {
          matches.add(matchmodel.Match.fromJson(element));
        },
      );
    });
  }
}

class StandingsController extends GetxController {
  final standings = <Standing>[].obs;
  var show_loading = true.obs;
  var heigth = 40.0.obs;
  void get_standings(String com_id) {
    ApiProvider().standings(com_id).then((value) {
      standings.clear();
      value.body.forEach(
            (element) {
              standings.add(Standing.fromJson(element));
        },
      );
      show_loading(false);
      update();
      heigth(140);
      update();
    });
  }
}

class VideosController extends GetxController {
  final videos = <Video>[].obs;
  var show_loading = true.obs;
  var competition_id = -1.obs;
  var competition_title = "".obs;
  var heigth = 40.0.obs;
  void set_competition_id(competition_id) {
    competition_id = competition_id;
    update();
  }

  void set_competition_title(competition_title) {
    competition_title = competition_title;
    update();
  }

  void get_videos(String com_id) {
    ApiProvider().videos(com_id).then((value) {
      videos.clear();

      value.body["results"].forEach(
        (element) {
          var contains = videos.where((p0) => p0.id == Video.fromJson(element).id);
          if(contains.length == 0){
            videos.add(Video.fromJson(element));
          }

        },
      );
      show_loading(false);
      update();
      heigth(250);
      update();
    });
  }
}

class TopGoalsController extends GetxController {
  final top_goals = <TopGoals>[].obs;
  var show_loading = true.obs;
  var heigth = 40.0.obs;


  void get_top_goals(String com_id) {
    ApiProvider().top_goals(com_id).then((value) {
      top_goals.clear();

      value.body.forEach(
            (element) {
              top_goals.add(TopGoals.fromJson(element));
        },
      );
      show_loading(false);
      update();
    });
  }
}