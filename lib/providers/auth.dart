// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:get/get_connect.dart';
import 'package:modern_football/models/request_models/check_code.dart';
import 'package:modern_football/models/request_models/send_code.dart';
import 'package:modern_football/models/response_models/server_response.dart';

class AuthProvider extends GetConnect {
  var base_url = "https://modern-football.ir/api/v1/";
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
}
