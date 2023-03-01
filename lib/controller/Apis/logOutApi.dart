import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class LogOutApi {
  var isLoading = true.obs;
  var message = "".obs;
  var token = "".obs;
  // var userID;
  // var phoneNumber;
  Future logOutApi() async {
    token.value = await SessionManager().get("token");
    log("Log Out Screen Token :${token.value}");
    // log(phoneNumber + "and" + userID);
    final url = Uri.parse("http://$domain/api/logout");
    Map body = {
      "token": token.value,
    };
    try {
      isLoading(true);
      final response = await http.post(url, body: body);
      //log("ON SCREEN 1${response.body["message"]}");
      var jsonData = jsonDecode(response.body.toString()) as Map;
      message.value = jsonData['message'];
      log("ON Log_Out SCREEN 1 ${jsonData["message"]}");
      if (response.statusCode == 200) {
        log("ON Log_Out SCREEN 2${response.body}");
        var jsonData = jsonDecode(response.body.toString()) as Map;
        log(jsonData.toString());
        message.value = jsonData['message'];
        log("message : ${message.value}");
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
