import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class GetOtp {
  var isLoading = true.obs;
  var otp = "".obs;
  var message = "".obs;
  // var userID;
  // var phoneNumber;
  Future getOtp(phoneNumber, userID) async {
    log(phoneNumber + "and" + userID);
    final url = Uri.parse("http://$domain/api/gen_otp");
    Map body = {"phone_number": "$phoneNumber", "userid": "$userID"};
    try {
      isLoading(true);
      final response = await http.post(url, body: body);
      //log("ON SCREEN 1${response.body["message"]}");
      var jsonData = jsonDecode(response.body.toString()) as Map;
      message.value = jsonData['message'];
      log("ON SCREEN 2${jsonData["message"]}");
      if (response.statusCode == 200) {
        log("ON SCREEN 3${response.body}");
        var jsonData = jsonDecode(response.body.toString()) as Map;
        log(jsonData['otp']);
        otp.value = jsonData['otp'];
        log("otp : $otp");
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
