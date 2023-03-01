import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class CasesCount extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  var recent = 0.obs;
  var closed = 0.obs;
  var inprocess = 0.obs;
  var open = 0.obs;

  // var userID;
  // var phoneNumber;
  Future casesCount() async {
    var token = await SessionManager().get("token") ?? "";
    //log("OpenCasess Screen Token :$token");
    final url = Uri.parse("http://$domain/api/cases_count");
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
        recent.value = await jsonData['recent'];
        closed.value = await jsonData['closed'];
        inprocess.value = await jsonData['inprocess'];
        open.value = await jsonData['open'];
        log(jsonData.length.toString());
        log(jsonData['recent'].toString());
        log(jsonData['inprocess'].toString());
        log(jsonData['open'].toString());
        log(jsonData['closed'].toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
