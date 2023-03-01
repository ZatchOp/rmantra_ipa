import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class DropDownSubdispositionApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  var dispositionValue = "".obs;
  // List contacted = [].obs;
  // List notContacted = [].obs;
  List subDispositonData = [].obs;
  // var userID;
  // var phoneNumber;
  Future dropDownSubdispositionApi() async {
    //log("OpenCasess Screen Token :$token");
    final url = Uri.parse("http://$domain/api/subdispositions");
    Map body = {"value": dispositionValue.value};
    // log("KYA BOLTI PUBLIC" + dispositionValue.value.toString());
    try {
      isLoading(true);
      final response = await http.post(
        url,
        body: body,
      );
      //log("ON SCREEN 1${response.body["message"]}");
      var jsonData = jsonDecode(response.body.toString()) as Map;
      log("ON SCREEN DropDown 0 : $jsonData");

      message.value = jsonData['message'];
      //log("ON SCREEN DropDown 1 : ${message.value}");
      if (response.statusCode == 200) {
        for (int i = 0; i < jsonData['sub_dispo'].length; i++) {
          //log(jsonData['disposition'][i]["dispo"]);
          subDispositonData.add(jsonData['sub_dispo'][i]["sub_dispo"]);
          //dispositonData.value=['disposition'][i]["dispo"];
        }
        //log(jsonData['disposition'][i].values.toList().toString());
        //log(dispositon.toString());
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}


//______________________________________________________________________________________________
/* if (response.statusCode == 200) {
        // log("ON SCREEN DropDown 1 : ${jsonData["contacted"]}");
        for (int i = 0; i < jsonData["contacted"].length; i++) {
          contacted.add(jsonData["contacted"][i]["sub_dispo"]);
          //log("Contacted : $contacted");
          //log("Contacted : ${jsonData["contacted"][i]["sub_dispo"]}");
        }
        log("Contacted : $contacted");
        for (int i = 0; i < jsonData["notcontacted"].length; i++) {
          notContacted.add(jsonData["notcontacted"][i]["sub_dispo"]);
          //log("Not Contacted : $notContacted");
          //log('Not Contacted : ${jsonData["notcontacted"][i]["sub_dispo"].toString()}');
        }
        log("Not Contacted : $notContacted");
        //List dis = [jsonData["contacted"][0][].values];
      } */