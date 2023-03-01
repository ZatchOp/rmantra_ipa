import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class AssignLeadPostApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  var postId = 0.obs;

  var assignLeadData = [].obs;
  var assignLeadDisposition = "".obs;
  var assignLeadSubDisposition = "".obs;
  var assignLeadRemark = "".obs;
  var assignLeadEmiType = "".obs;
  var assignLeadEmiMethod = "".obs;
  var assignLeadImg = "".obs;
  var assignLeadCallBackDateAndTime = "".obs;
  var assignLeadPtpAmount = "".obs;
  var assignLeadLocation = "".obs;
  File? file;
  Future<void> assignLeadPostApi() async {
    final url = Uri.parse("http://$domain/api/assign_lead/${postId.value}");
    final request = http.MultipartRequest(
      'POST',
      Uri.parse("$url"),
    );

    if (file != null) {
      request.files.add(await http.MultipartFile.fromPath('img', file!.path));
    } else {
      log("File Null");
    }

//     // Add bearer token to headers
    var token = await SessionManager().get("token");
    request.headers['Authorization'] = 'Bearer $token';

//     // Add body data to fields
    final body = {
      "disposition": assignLeadDisposition.value, //
      "subdisposition": assignLeadSubDisposition.value, //
      "remark": assignLeadRemark.value,
      "emi_type": assignLeadEmiType.value,
      "emi_method": assignLeadEmiMethod.value,
      "img": assignLeadImg,
      "callback_datetime": assignLeadCallBackDateAndTime.value,
      "ptp_amount": assignLeadPtpAmount.value,
      "location": assignLeadLocation.value,
    };
    body.forEach((key, value) {
      request.fields[key] = value.toString();
    });

    final response = await request.send();
    //log("assignLead response : ${await response.stream.bytesToString()}");
    var jsonData = jsonDecode(await response.stream.bytesToString()) as Map;
    if (response.statusCode == 200) {
      message.value = jsonData['message'];
      log("response : ${message.value}");
      log('File uploaded successfully');
    } else {
      log('Error uploading file');
    }
  }
}
