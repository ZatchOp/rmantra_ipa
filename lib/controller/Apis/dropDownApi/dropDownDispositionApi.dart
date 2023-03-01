import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rmantrafe/constants/constDomainName.dart';

class DropDownDispositionApi extends GetxController {
  var isLoading = true.obs;
  var message = "".obs;
  var dispositions = [].obs;
  var contacted = [].obs;
  var notContacted = [].obs;

  Future dropDownDispositionApi() async {
    final url = Uri.parse("http://$domain/api/dispositions");
    try {
      isLoading(true);
      final response = await http.get(
        url,
      );

      var jsonData = jsonDecode(response.body.toString()) as Map;
      log("ON SCREEN DropDown 0 : $jsonData");

      if (response.statusCode == 200) {
        message.value = jsonData['message'];
        log("ON SCREEN DropDown 0 : ${jsonData['disposition']}");

        for (int i = 0; i < jsonData['disposition'].length; i++) {
          if (jsonData['disposition'][i]["dispo"] == "Contacted") {
            contacted.add(jsonData['disposition'][i]["sub_dispo"]);
            log(contacted.toString());
          } else if (jsonData['disposition'][i]["dispo"] == "Not Contacted") {
            notContacted.add(jsonData['disposition'][i]["sub_dispo"]);
            log(notContacted.toString());
          }
        }
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

      /* // if (response.statusCode == 200) {
      //   for (int i = 0; i < jsonData['disposition'].length; i++) {
      //     //log(jsonData['disposition'][i]["dispo"]);
      //     dispositonData.add(jsonData['disposition'][i]["dispo"]);
      //     //dispositonData.value=['disposition'][i]["dispo"];
      //   }
      //   //log(jsonData['disposition'][i].values.toList().toString());
      //   //log(dispositon.toString());
      // } */