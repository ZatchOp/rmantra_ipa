import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class InprocessCasesApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;

  var inprocessCaseSize = 0.obs;
  var inprocessCaseDetailSize = 0.obs;
  var brrowerName = "".obs;
  var mobileNumber = "".obs;
  var bankName = "".obs;
  var loanAccountNumber = "".obs;

  var subDisposition = "".obs;

  var inprocessCaseData = [].obs;
  Future inprocessCasesAPi() async {
    var token = await SessionManager().get("token") ?? "";
    //log("OpenCasess Screen Token :$token");
    final url = Uri.parse("http://$domain/api/inprocess");
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

      if (response.statusCode == 200) {
        log(jsonData["data"].length.toString());
        inprocessCaseSize.value = jsonData["total"];

        inprocessCaseDetailSize.value =
            jsonData["data"][0].keys.toList().length;
        for (int i = 0; i < jsonData["data"].length; i++) {
          inprocessCaseData.add(jsonData["data"]);
          log(inprocessCaseData.toString());
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
