// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class GetAddress {
//   var isLoading = true.obs;
//   var message = "".obs;
//   var address2 = "".obs;
//   var address3 = "".obs;
//   var address4 = "".obs;
//   var postId = 0.obs;
//   // var userID;
//   // var phoneNumber;
//   Future getAddress(
//     String latlng,
//     int id,
//     int exppostId,
//   ) async {
//     final url = "";
//     // final url = Uri.parse(
//     //     "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latlng&key=AIzaSyB64psHtmtoOzAij-F77xYYXAIEO37xI_0");

//     try {
//       // log("postId : " + postId.value.toString());
//       // log("exppostId : " + exppostId.toString());
//       isLoading(true);
//       //final response = await http.get(url);
//       //log("ON SCREEN 1${response.body}");
//       var jsonData = jsonDecode(response.body.toString()) as Map;
//       //log("Address Bol : " + jsonData['results'][0]['formatted_address']);
//       if (id == 2 && exppostId == exppostId) {
//         address2.value = await jsonData['results'][0]['formatted_address'];
//       } else if (id == 3 && exppostId == exppostId) {
//         address3.value = await jsonData['results'][0]['formatted_address'];
//       } else if (id == 4 && exppostId == exppostId) {
//         address4.value = await jsonData['results'][0]['formatted_address'];
//       } else {
//         log("Wrong Id");
//       }

//       if (response.statusCode == 200) {}
//     } catch (e) {
//       log(e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }
// }
