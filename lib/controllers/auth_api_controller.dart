import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modern_football/models/response_models/check_code_response.dart';
import 'package:modern_football/models/response_models/server_response.dart';
import 'package:modern_football/providers/api.dart';

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

  void get_profile() {
    ApiProvider().profile().then((value) {
      print(value.body);
    });
  }
}
