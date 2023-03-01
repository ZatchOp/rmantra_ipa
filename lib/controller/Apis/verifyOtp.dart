import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:rmantrafe/constants/constDomainName.dart';

class VerifyOtp {
  var isLoading = true.obs;
  var otp = "".obs;
  var message = "".obs;
  var token = "".obs;
  var level = "".obs;
  var verifyLocation = "".obs;
  // var userID;
  // var phoneNumber;
  Future verifyOtp(phoneNumber, otp) async {
    //log(phoneNumber + "and" + otp);
    final url = Uri.parse("http://$domain/api/verify_otp");
    Map body = {
      "phone_number": "$phoneNumber",
      "otp": "$otp",
      "location": verifyLocation.value
    };

    try {
      isLoading(true);
      final response = await http.post(url, body: body);
      //log("ON SCREEN 1${response.body["message"]}");
      var jsonData = jsonDecode(response.body.toString()) as Map;
      message.value = jsonData['message'];
      //   log("ON Verify SCREEN  : ${jsonData["message"]}");
      // log("ON Verify SCREEN  : ${jsonData["token"]}");
      token.value = jsonData["token"];
      level.value = jsonData["level"];
      // log("LEVEL : ${level.value}");
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
