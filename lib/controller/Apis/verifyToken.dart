import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:rmantrafe/constants/constDomainName.dart';

class VerifyToken {
  var isLoading = true.obs;

  var message = "".obs;
  var level = "".obs;
  // var userID;
  // var phoneNumber;
  Future verifyToken() async {
    //log(phoneNumber + "and" + otp);
    final url = Uri.parse("http://$domain/api/test");
    //.Map body = {"phone_number": "$phoneNumber", "otp": "$otp"};

    try {
      isLoading(true);
      var token = await SessionManager().get("token");
      log("From Storage : $token");
      final response = await http.get(
        url,
        //body: body,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      //log("ON SCREEN 1${response.body["message"]}");
      var jsonData = jsonDecode(response.body.toString()) as Map;
      log(jsonData.toString());
      message.value = jsonData['message'];
      log("Message : ${message.value}");
      level.value = jsonData["user_level"];
      log("User Level : ${level.value}");

      // log("From Storage :  ${await SessionManager().get("token")}");

      //   log("ON Verify SCREEN  : ${jsonData["message"]}");
      // log("ON Verify SCREEN  : ${jsonData["token"]}");
      // token.value = jsonData["token"];
      // saveJwtToken(token.value);

      // Saving JWT token

      // if (response.statusCode == 200) {
      //   token.value = jsonData["token"];
      //   saveJwtToken(token.value);
      // }
      // getJwtToken();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
