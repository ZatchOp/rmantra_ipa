import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class RecentCasesApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;

  var recentCaseSize = 0.obs;
  var recentCaseDetailSize = 0.obs;
  var brrowerName = "".obs;
  var mobileNumber = "".obs;
  var bankName = "".obs;
  var loanAccountNumber = "".obs;
  var uploadDate = "".obs;
  var subDisposition = "".obs;
  var city = "".obs;
  var recentCaseData = [].obs;

  Future recentCasesAPi() async {
    var token = await SessionManager().get("token") ?? "";
    //log("OpenCasess Screen Token :$token");
    final url = Uri.parse("http://$domain/api/recent_cases");
    try {
      isLoading(true);
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      var jsonData = jsonDecode(response.body.toString()) as Map;
      // message.value = jsonData['message'];
      //log("ON SCREEN OpenCasesApi 1 : $jsonData");
      if (response.statusCode == 200) {
        recentCaseSize.value = jsonData["total"];
        log(recentCaseSize.value.toString());
        recentCaseDetailSize.value = jsonData["data"][0].keys.toList().length;

        log(jsonData["data"].length.toString());
        for (int i = 0; i < jsonData["data"].length; i++) {
          recentCaseData.add(jsonData["data"]);
          log(recentCaseData.toString());
          uploadDate.value = jsonData["data"][0]["upload_date"];
          city.value = jsonData["data"][0]["city"];
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
