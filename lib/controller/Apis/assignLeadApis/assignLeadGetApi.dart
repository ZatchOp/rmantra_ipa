import 'dart:convert';
import 'dart:developer';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class AssignLeadGetApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  var getId = 0.obs;
  var assignLeadData = [].obs;

  Future assignLeadGetApi() async {
    var token = await SessionManager().get("token");
    //log("OpenCasess Screen Token :$token");
    final url = Uri.parse("http://$domain/api/assign_lead/${getId.value}");

    try {
      isLoading(true);

      final response = await http.get(
        url,
        // body: body,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
          //'Content-Length': '<calculated when request is sent>',
          //'Host':'<calculated when request is sent>',
          //'Accept-Encoding':'gzip, deflate, br',
        },
      );

      var jsonData = jsonDecode(response.body.toString()) as Map;
      message.value = jsonData['message'];
      log("ON SCREEN Assign Lead Api 1 : $jsonData");
      if (response.statusCode == 200) {
        assignLeadData.value = jsonData['data'];
        // log("AJA AJA" + jsonData['data'][0]['address1']);
        log("AJA AJA" + assignLeadData[0]['address1']);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }
}
