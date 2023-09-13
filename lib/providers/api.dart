// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/models/request_models/check_code.dart';
import 'package:modern_football/models/request_models/send_code.dart';
import 'package:modern_football/models/response_models/server_response.dart';

var base_url = "https://modern-football.ir/api/v1/";

class ApiProvider extends GetConnect {


  void error_message(String message) {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(20),
        radius: 5,
        title: 'خطا',
        titleStyle: TextStyle(color: Colors.red),
        content: Column(
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
            ),
            SizedBox(
              height: 5,
            ),
            Text(textDirection: TextDirection.rtl, message),
          ],
        ),
        confirm: TextButton(onPressed: () => Get.back(), child: Text('باشه')));

    // Get.snackbar('خطا', message,
    //     backgroundColor: Colors.red,
    //     snackPosition: SnackPosition.BOTTOM,
    //     maxWidth: double.infinity - 30,
    //     titleText: const Text(
    //       "خطا",
    //       style: TextStyle(color: Colors.white),
    //       textAlign: TextAlign.center,
    //     ),
    //     messageText: Text(
    //       "${message}",
    //       style: TextStyle(color: Colors.white),
    //       textAlign: TextAlign.center,
    //     ));
  }

  void success_message(String message) {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(20),
        radius: 5,
        title: 'موفق',
        titleStyle: TextStyle(color: Colors.green),
        content: Column(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(
              height: 5,
            ),
            Text(textDirection: TextDirection.rtl, message),
          ],
        ),
        confirm: TextButton(onPressed: () => Get.back(), child: Text('باشه')));

    // Get.snackbar('موفق', message,
    //     backgroundColor: Colors.green,
    //     snackPosition: SnackPosition.BOTTOM,
    //     maxWidth: double.infinity - 30,
    //     titleText: const Text(
    //       "موفق",
    //       style: TextStyle(color: Colors.white),
    //       textAlign: TextAlign.center,
    //     ),
    //     messageText: Text(
    //       "${message}",
    //       style: TextStyle(color: Colors.white),
    //       textAlign: TextAlign.center,
    //     ));
  }

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

  Future<Response> set_profile(String first_name, String last_name) async {
    var response = await post(base_url + "Profile",
        {"first_name": first_name, "last_name": last_name},
        headers: header);
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

  Future<Response> news(String com_id, int page) async {
    var response = await get(
        base_url + "News?competition=${com_id}&page=${page}",
        headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> news_with_tag(String tag, int page) async {
    var response =
        await get(base_url + "News?tags=${tag}&page=${page}", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> videos(String com_id, int page_number) async {
    print(base_url + "Videos?competition=${com_id}&page=${page_number}");
    print(header);
    var response = await get(
        base_url + "Videos?competition=${com_id}&page=${page_number}",
        headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> matches(String com_id, String match_day) async {
    var response = await get(
        base_url + "Matches?competition=${com_id}&match_day=${match_day}",
        headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> today_matches() async {
    var response = await get(base_url + "TodayMatches", headers: header);
    if (response.isOk) {
      return response;
    } else {
      return Future.error(response.statusText!);
    }
  }

  Future<Response> standings(String com_id) async {
    var response = await get(base_url + "Standings?competition=${com_id}",
        headers: header);
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

    Future<Response> GetPost() async {
    Response res = await get("https://modern-football.ir/api/v1/social/posts",headers: header);
    return res;
  }

  Future<Response> GetCooment(var post_id) async {

    Response res = 
        await get("https://modern-football.ir/api/v1/social/posts/${post_id}/comments",headers: header);
    return res;
  }
}
