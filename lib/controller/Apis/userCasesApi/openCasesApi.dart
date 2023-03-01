import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class OpenCasesApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  List openKeys = [].obs;
  List openValues = [].obs;
  var openCaseSize = 0.obs;
  var openCaseDetailSize = 0.obs;
  var brrowerName = "".obs;
  var mobileNumber = "".obs;
  var bankName = "".obs;
  var loanAccountNumber = "".obs;
  var uploadDate = "".obs;
  var subDisposition = "".obs;
  var city = "".obs;
  var openCaseData = [].obs;

  Future openCasesAPi() async {
    var token = await SessionManager().get("token") ?? "";

    final url = Uri.parse("http://$domain/api/open_cases");
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
        openCaseSize.value = jsonData["total"];
        //log("Size : ${openCaseSize.value}");

        //log("Size : ${openCaseDetailSize.value}");
        //log("DATA Size : ${jsonData["data"].length}");
        for (int i = 0; i < jsonData["data"].length; i++) {
          openCaseData.add(jsonData["data"]);

          uploadDate.value = jsonData["data"][0]["upload_date"];
          city.value = jsonData["data"][0]["city"];
        }
        log("openCaseData : $openCaseData");
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
