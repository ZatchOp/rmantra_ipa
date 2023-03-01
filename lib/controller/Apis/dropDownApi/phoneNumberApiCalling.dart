// import 'dart:developer';

// //import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//import 'package:get/get.dart';

// class PhoneNumberApiCalling {
//   Future PostApi() async {
//     //var url = Uri.parse("http://192.168.0.108:8000/verify_user");
//     var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
//     var response = await http.post(url);
//     log("Response : ${response.body}");
//     log("PhoneNumberApiCalling.....");
//   }
// }


// import 'dart:convert';
// import 'dart:developer';

// // import 'package:apicallingdemo/homeScreen.dart';
// // import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:http/http.dart' as http;

// class PostApiController extends GetxController {
//   var isLoading = true.obs;
//   var passData = "".obs;
//   // const PostApi({Key? key}) : super(key: key);

// //   @override
// //   _PostApiState createState() => _PostApiState();
// // }
// //String name, String jobTitile
//   // Map map={};

//   Future postApi(name, job) async {
//     try {
//       isLoading(true);
//       Map<String, String> map = {"name": name, "job": job};

//       // name = "Demo";
//       log("message>>>>>>>>>>>>>>>>");
//       //log("*****************");
//       var url = Uri.parse("https://reqres.in/api/users");
//       var response = await http.post(
//         url,
//         headers: {"Content-type": "application/json"},
//         body: jsonEncode(map),
//         //jsonEncode({"name": name})
//       );
//       if (response.statusCode == 201) {
//         log('Response status: ${response.statusCode.toString()}');
//         log('Response body: ${response.body.toString()}');
//       }
//       //  else {
//       //   log("Error");
//       // }
//       // log("*****************${response.body.toString()}");
//       var jsonData = jsonDecode(response.body.toString()) as Map;
//       log('message');
//       log(jsonData.toString());
//       passData.value = jsonData["name"] + "\n" + jsonData["job"];

//       //log(jsonData[0].toString());
//       //log('JsonData:${jsonData.body.toString()}');
//       //log("*****************");

//       // log(response.body.toString());
//       //log(response.statusCode.toString());
//     } catch (e) {
//       log("error");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
