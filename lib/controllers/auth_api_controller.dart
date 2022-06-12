import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/models/response_models/check_code_response.dart';
import 'package:modern_football/models/response_models/server_response.dart';
import 'package:modern_football/providers/api.dart';

import '../models/response_models/competition.dart';
import '../models/response_models/user.dart';

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
  void get_competitions() {
    ApiProvider().competitions().then((value) {
      value.body.forEach(
        (element) {
          competitions.add(Competition.fromJson(element));
        },
      );

      show_loading(false);
      update();
    });
  }
}
