import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/adminScreen/adminAddUser.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminHomePage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminLocationPage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminStatusPage.dart';

import 'package:rmantrafe/screens/adminScreen/adminScreen.dart';
import 'package:rmantrafe/screens/adminScreen/adminupdateAgent.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorAddUser.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorAssign.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorCasesDetails.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorHome.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorLocation.dart';

import 'package:rmantrafe/screens/supervisorScreen/supervisorProfile.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorScreen.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';
import 'package:rmantrafe/screens/userScreen/contactedScreen.dart';
import 'package:rmantrafe/screens/userScreen/notContactedScreen.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/closeCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/inprocessCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/openCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/recentCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/transferCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userHomePage.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userTabBarContent.dart';
import 'package:rmantrafe/screens/userScreen/userProfileScreen.dart';
import 'package:rmantrafe/screens/userScreen/userScreen.dart';

import 'screens/adminScreen/adminNavBarPages/adminCasesDetails.dart';
import 'screens/loginScreen/domainLoginScreen.dart';
import 'screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
  //  runApp(const GetMaterialApp(home: SplashScreen(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // PhoneNumberApiCalling api = PhoneNumberApiCalling();
    //api.PostApi();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          iconTheme: const IconThemeData(color: Colors.black)

          // timePickerTheme: TimePickerThemeData(
          //     hourMinuteTextColor: Colors.indigo,
          //     dialHandColor: Colors.indigo,
          //     entryModeIconColor: Colors.indigo),
          ),
      initialRoute: Routes.getSplashScreenRoute(),
      // initialRoute: Routes.getuserAssignLeadPageScreenRoute(),
      getPages: Routes.getPages,
      // home: Scaffold(
      //     // body: ListView(
      //     //     shrinkWrap: true, children: [Text("${api.PostApi().toString()}")]),
      //     ),
      //home: const SplashScreen(),
      //home: DomainLoginScreen(),
      //home: AdminHomePage(),
      //home: const AdminScreen(),
      //home: AdminStatusPage(),
      //home: AdminProfilePage(),
      //home: const AdminCasesDetailPage(),
      //home: const SupervisorCasesDetailPage(),
      //home: AdminAddUserPage(),
      //home: SupervisorAssignPage()
      //home: const SupervisorScreen(),
      //home: UserScreen(),
      //home: UserProfilePage(),
      //home: UserCasePage(),
      ///home: AdminScreen(),
      //home: Demo(),
      //home: ContactedCall(),
      //home: AssignLead(),
    );
  }
}

class Routes {
  //splash screen route---------------------------------
  static String splashScreen = '/splashScreen';
  static getSplashScreenRoute() => splashScreen;
  //login screen route----------------------------------
  static String domainLoginScreen = '/domainLoginScreen';
  static String levelLoginScreen = '/levelinLoginScreen';
  static getdomainLoginScreenRoute() => domainLoginScreen;

  //admin screens routes------------------------------------
  //---admin Api Screen Route-----------------

  //---admin  Screen Route-----------------
  static String adminHomePageScreen = '/adminHomePageScreen';
  static String adminCasesDetailsScreen = '/adminCasesDetailsScreen';
  static String adminStatusPageScreen = '/adminStatusPageScreen';
  static String adminUserPageScreen = '/adminUserPageScreen';
  static String adminLocationPageScreen = '/adminLocationPageScreen';
  static String adminAddUserPageScreen = '/adminAddUserPageScreen';
  static String adminNotificationsScreen = '/adminNotificationsScreen';
  static String adminProfilePageScreen = '/adminProfilePageScreen';
  static String adminScreen = '/adminScreen';
  static String adminUpdateAgentPageScreen = '/adminUpdateAgentPageScreen';

  static getadminHomePageScreenRoute() => adminHomePageScreen;
  static getadminCasesDetailsScreenRoute() => adminCasesDetailsScreen;
  static getadminStatusPageScreenRoute() => adminStatusPageScreen;
  static getadminUserPageScreennRoute() => adminUserPageScreen;
  static getadminLocationPageScreenRoute() => adminLocationPageScreen;
  static getadminAddUserPageScreenRoute() => adminAddUserPageScreen;
  static getadminProfilePageScreenRoute() => adminProfilePageScreen;
  static getadminScreenRoute() => adminScreen;
  static getadminNotificationsScreenRoute() => adminNotificationsScreen;
  static getadminUpdateAgentPageScreenRoute() => adminUpdateAgentPageScreen;

  //Supervisor Screen Route-------------------------------------
  static String supervisorHomePageScreen = '/supervisorHomePageScreen';
  static String supervisorCasesDetailsScreen = '/supervisorCasesDetailsScreen';
  static String supervisorUserPageScreen = '/supervisorUserPageScreen';
  static String supervisorAssignPageScreen = '/supervisorAssignPageScreen';
  static String supervisorLocationPageScreen = '/supervisorLocationPageScreen';
  static String supervisorAddUserPageScreen = '/supervisorAddUserPageScreen';
  static String supervisorProfilePageScreen = '/supervisorProfilePageScreen';
  static String supervisorScreen = '/supervisorScreen';

  static getsupervisorHomePageScreenRoute() => supervisorHomePageScreen;
  static getsupervisorCasesDetailsScreenRoute() => supervisorCasesDetailsScreen;
  static getsupervisorUserPageScreenRoute() => supervisorUserPageScreen;
  static getsupervisorAssignPageScreenRoute() => supervisorAssignPageScreen;
  static getsupervisorLocationPageScreenRoute() => supervisorLocationPageScreen;
  static getsupervisorAddUserPageScreenRoute() => supervisorAddUserPageScreen;
  static getsupervisorProfilePageScreenRoute() => supervisorProfilePageScreen;
  static getsupervisorScreenRoute() => supervisorScreen;

  //User Screens  Routing--------------------------------------
  static String userHomePageScreen = '/userHomePageScreen';
  static String userCasesDetailsScreen = '/userCasesDetailsScreen';

  static String userLocationPageScreen = '/userLocationPageScreen';
  static String userTabBarPageScreen = '/userTabBarPageScreen';

  static String userProfilePageScreen = '/userProfilePageScreen';
  static String userScreen = '/userScreen';

  static String userContactedPageScreen = '/userContactedPageScreen';
  static String userNotContactedScreen = '/userNotContactedScreen';
  static String usercloseCasePageScreen = '/usercloseCasePageScreeSupervisor';
  static String userinprocessCasePageScreen =
      '/userinprocessCasePageScreeSupervisor';
  static String useropenCasePageScreen = '/useropenCasePageScreeSupervisor';
  static String userrecentCasePageScreen = '/userrecentCasePageScreeSupervisor';
  static String usertransferCasePageScreen =
      '/usertransferCasePageScreeSupervisor';
  static String userAssignLeadPageScreen = '/userAssignLeadPageScreeSupervisor';

  static getauserHomePageScreenRoute() => userHomePageScreen;
  static getuserCasesDetailsScreenRoute() => userCasesDetailsScreen;

  static getuserScreenRoute([int i = 1]) => userScreen;

  static getuserTabBarPageScreenRoute() => userTabBarPageScreen;

  static getuserProfilePageScreenRoute() => userProfilePageScreen;

  static getuserContactedPageScreenRoute() => userContactedPageScreen;
  static getuserNotContactedPageScreenRoute() => userNotContactedScreen;

  static getuserinprocessCasePageScreenRoute() => userinprocessCasePageScreen;
  static getuseropenCasePageScreenRoute() => useropenCasePageScreen;
  static getuserrecentCasePageScreenRoute() => userrecentCasePageScreen;
  static getusertransferCasePageScreenRoute() => usertransferCasePageScreen;
  static getuserAssignLeadPageScreenRoute() => userAssignLeadPageScreen;

//GET Page List----------------------------------------
  static List<GetPage> getPages = [
    //splash screen route---------------------------------
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),

    //login Screen route--------------------------------------
    GetPage(
      name: Routes.domainLoginScreen,
      page: () => const DomainLoginScreen(),
    ),
    //admin screens routes------------------------------------
    GetPage(
      name: Routes.adminAddUserPageScreen,
      page: () => const AdminAddUserPage(),
    ),
    GetPage(
      name: Routes.adminCasesDetailsScreen,
      page: () => const AdminCasesDetailPage(),
    ),
    GetPage(
      name: Routes.adminHomePageScreen,
      page: () => const AdminHomePage(),
    ),
    GetPage(
      name: Routes.adminLocationPageScreen,
      page: () => const AdminLocationPage(),
    ),
    GetPage(
      name: Routes.adminStatusPageScreen,
      page: () => const AdminStatusPage(),
    ),
    GetPage(
      name: Routes.adminScreen,
      page: () => const AdminScreen(),
    ),
    GetPage(
      name: Routes.adminUpdateAgentPageScreen,
      page: () => const AdminUpdateAgentPage(),
    ),
    //Supervisor Screen Route-------------------------------------
    GetPage(
      name: Routes.supervisorAddUserPageScreen,
      page: () => const SupervisorAddUserPage(),
    ),
    GetPage(
      name: Routes.supervisorCasesDetailsScreen,
      page: () => const SupervisorCasesDetailPage(),
    ),
    GetPage(
      name: Routes.supervisorHomePageScreen,
      page: () => const SupervisorHomePage(),
    ),
    GetPage(
      name: Routes.supervisorAssignPageScreen,
      page: () => const SupervisorAssignPage(),
    ),
    GetPage(
      name: Routes.supervisorLocationPageScreen,
      page: () => const SupervisorLocationPage(),
    ),

    GetPage(
      name: Routes.supervisorScreen,
      page: () => const SupervisorScreen(),
    ),
    GetPage(
      name: Routes.supervisorProfilePageScreen,
      page: () => const SupoervisorProfilePage(),
    ),
    GetPage(
      name: Routes.supervisorProfilePageScreen,
      page: () => const SupoervisorProfilePage(),
    ),

    //User Screens  Routing--------------------------------------

    GetPage(
      name: Routes.userCasesDetailsScreen,
      page: () => const UserCasePage(),
    ),
    GetPage(
      name: Routes.userHomePageScreen,
      page: () => const UserHomePage(),
    ),
    GetPage(
      name: Routes.userTabBarPageScreen,
      page: () => const TabBarBody(),
    ),
    GetPage(
      name: Routes.userAssignLeadPageScreen,
      page: () => const AssignLead(),
    ),
    GetPage(
      name: Routes.userContactedPageScreen,
      page: () => const ContactedCall(),
    ),
    GetPage(
      name: Routes.userNotContactedScreen,
      page: () => const NotContactedCall(),
    ),
    GetPage(
      name: Routes.usercloseCasePageScreen,
      page: () => const CloseCaseScreen(),
    ),
    GetPage(
      name: Routes.useropenCasePageScreen,
      page: () => const OpenCaseScreen(),
    ),
    GetPage(
      name: Routes.userrecentCasePageScreen,
      page: () => const RecentCasesScreen(),
    ),
    GetPage(
      name: Routes.userinprocessCasePageScreen,
      page: () => const InprocessCaseScreen(),
    ),
    GetPage(
      name: Routes.usertransferCasePageScreen,
      page: () => const TransferCaseScreen(),
    ),
    GetPage(
      name: Routes.userProfilePageScreen,
      page: () => const UserProfilePage(),
    ),
    GetPage(
      name: Routes.userScreen,
      page: () => const UserScreen(),
    ),
  ];
}

// class PhoneNumberApiCalling {
//   // ignore: non_constant_identifier_names
//   Future PostApi() async {
//     var url = Uri.parse("http://192.168.0.108:8000/verify_user");
//     //var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

//     var response = await http.post(
//       url,
//     );
//     log("Response : ${response}");
//     log("Response : ${response.body}");
//     // log("PhoneNumberApiCalling.....");
//   }
// }
//import 'package:flutter/material.dart';

//import 'package:get/get.dart';

// class PhoneNumberApiCalling {
//   Future PostApi() async {
//     var url = Uri.parse("http://192.168.0.108:8000/verify_user");
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

// class Demo extends StatefulWidget {
//   const Demo({super.key});

//   @override
//   State<Demo> createState() => _DemoState();
// }

// class _DemoState extends State<Demo> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned(
//           left: 0.0,
//           top: 600.0,
//           right: 0.0,
//           child: Container(
//             height: 300,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50), color: Colors.red),
//             // child: ListView(
//             //   shrinkWrap: true,
//             //   //controller: ScrollController(),
//             //   children: [
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.green[200],
//             //     ),
//             //     Container(
//             //       height: 100,
//             //       color: Colors.blue[200],
//             //     ),
//             //   ],
//             // ),
//           ),
//         )
//       ],
//     );
//   }
// }

