// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/models/request_models/check_code.dart';
import 'package:modern_football/models/request_models/send_code.dart';
import 'package:modern_football/models/response_models/server_response.dart';

var base_url = "https://modern-football.ir/api/v1/";

class ApiProvider extends GetConnect {
  GetStorage storage = GetStorage();
  var header;
  ApiProvider() {
    header = {"Authorization": "Token ${storage.read("token")}"};
  }

  Future<Response> send_code(String phone_number) async {
    var response = await post(
        base_url + "sendCode", SendCodeRequest(phone_number).to_json());
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> check_code(String phone_number, String code) async {
    var response = await post(
        base_url + "checkCode", CheckCodeRequest(phone_number, code).to_json());
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> profile() async {
    var response = await get(base_url + "Profile", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> competitions() async {
    var response = await get(base_url + "Competitions", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> news(String com_id,int page) async {

    var response =
        await get(base_url + "News?competition=${com_id}&page=${page}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> news_with_tag(String tag) async {
    var response =
    await get(base_url + "News?tags__name=${tag}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> videos(String com_id,int page_number) async {
    var response =
        await get(base_url + "Videos?competition=${com_id}&page=${page_number}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }
  Future<Response> matches(String com_id,String match_day) async {
    var response =
    await get(base_url + "Matches?competition=${com_id}&match_day=${match_day}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }
  Future<Response> today_matches() async {
    var response =
    await get(base_url + "TodayMatches", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }
  Future<Response> standings(String com_id) async {
    var response =
    await get(base_url + "Standings?competition=${com_id}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }
  Future<Response> top_goals(String com_id) async {
    var response =
    await get(base_url + "TopGoals?competition=${com_id}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }
}
