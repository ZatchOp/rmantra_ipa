import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/casesCountApi.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/openCasesApi.dart';
import 'package:rmantrafe/main.dart';
import 'package:rmantrafe/screens/userScreen/contactedScreen.dart';
import 'package:rmantrafe/screens/userScreen/notContactedScreen.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/openCase.dart';

import 'package:rmantrafe/screens/userScreen/userScreen.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/constMyContainer.dart';
import '../../../controller/Apis/logOutApi.dart';
import '../../loginScreen/domainLoginScreen.dart';
import '../userProfileScreen.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int isSelected = 0;
  late List<Chart> _chartData;
  OpenCasesApi openCasesApi = OpenCasesApi();
  CasesCount casesCount = CasesCount();

  @override
  void initState() {
    _chartData = getChartData();

    casesCount.casesCount();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // bool isSelectedIcon = isSelected == isSelected ? true : false;

    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: const Color(0xFFECEEFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFECEEFF),
          elevation: 0,
          title: const Text(
            "Hi Agent",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () async {
                  LogOutApi logOutToken = LogOutApi();
                  await logOutToken.logOutApi();
                  if (logOutToken.message.value == "success") {
                    Get.offAll(const DomainLoginScreen());
                  }
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              ),
            )
          ],
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Get.to(const UserProfilePage()),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/Logo.png',
                  image:
                      "https://hindubabynames.info/downloads/wp-content/themes/hbn_download/download/banking-and-finance/bharatpe-logo.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.05),
                child: SizedBox(
                  //Circular graph
                  height: height / 4,

                  child: SfCircularChart(
                    margin: EdgeInsets.only(
                      top: height * 0.0,
                      left: width * 0.1,
                    ),
                    // backgroundColor: Colors.orange,
                    centerX: "${width * 0.25}", //this for circular pie chart
                    centerY: "${height * 0.13}", //this for circular pie chart
                    legend: Legend(
                      toggleSeriesVisibility: false,
                      isVisible: true,
                      position: LegendPosition.right,
                      legendItemBuilder: (String name, dynamic series,
                          dynamic point, int index) {
                        return Container(
                          color: Colors.transparent,
                          height: height * 0.08,
                          width: width * 0.25,
                          // height:
                          //     height > 540 ? height * 0.065 : height * 0.075,
                          // width: width >= 280 ? width * 0.3 : width * 0.25,
                          padding: EdgeInsets.zero,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    size: height * 0.01 + width * 0.01,
                                    color: point.color,
                                  ),
                                  Text(
                                    point.x.toString(),
                                    maxLines: 1,
                                    style: TextStyle(fontSize: width * 0.03),
                                  ),
                                ],
                              ),
                              Text(
                                "₹${point.y}",
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    series: <CircularSeries>[
                      PieSeries<Chart, String>(
                        radius:
                            "${height > 667 ? height * 0.11 : height * 0.12}",
                        //radius: "${height * 0.12}",
                        dataSource: _chartData,
                        xValueMapper: (Chart data, _) => data.label,
                        yValueMapper: (Chart data, _) => data.value,
                        pointColorMapper: (Chart data, _) => data.color,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: false),
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
                () => casesCount.isLoading.value
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    log("re : " + casesCount.recent.toString());
                                    log(" op : " + casesCount.open.toString());
                                    log("cl : " + casesCount.closed.toString());
                                    log("in : " +
                                        casesCount.inprocess.toString());

                                    Get.to(const UserScreen(),
                                        // Get.offAll(Routes.getuserScreenRoute(),
                                        arguments: {
                                          "isSelected": 1,
                                          "index": 0
                                        });
                                  },
                                  child: MyConatiner(
                                      height,
                                      width,
                                      "Recent",
                                      "${casesCount.recent.value}",
                                      Colors.red)),
                              // Container(
                              //   height: height * 0.06,
                              //   width: width * 0.3,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(12),
                              //     color: Colors.white,
                              //   ),
                              //   child: Column(
                              //     children: const [
                              //       Text(
                              //         "Recent",
                              //         style: TextStyle(
                              //             fontSize: 14, fontWeight: FontWeight.w500),
                              //       ),
                              //       Text(
                              //         "10",
                              //         style: TextStyle(
                              //             fontSize: 22,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.red),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(const UserScreen(),
                                        // Get.offAll(Routes.getuserScreenRoute(),
                                        arguments: {
                                          "isSelected": 1,
                                          "index": 1
                                        });
                                  },
                                  child: MyConatiner(height, width, "Open",
                                      "${casesCount.open.value}", Colors.red))
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Container(
                              //   height: height * 0.06,
                              //   width: width * 0.3,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(12),
                              //     color: Colors.white,
                              //   ),
                              //   child: Column(
                              //     children: const [
                              //       Text(
                              //         "Recent",
                              //         style: TextStyle(
                              //             fontSize: 14, fontWeight: FontWeight.w500),
                              //       ),
                              //       Text(
                              //         "10",
                              //         style: TextStyle(
                              //             fontSize: 22,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.red),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              GestureDetector(
                                  onTap: () {
                                    Get.to(const UserScreen(),
                                        // Get.offAll(Routes.getuserScreenRoute(),
                                        arguments: {
                                          "isSelected": 1,
                                          "index": 2
                                        });
                                  },
                                  child: MyConatiner(
                                      height,
                                      width,
                                      "In-process",
                                      "${casesCount.inprocess.value}",
                                      Colors.red)),
                              // Container(
                              //   height: height * 0.06,
                              //   width: width * 0.3,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(12),
                              //     color: Colors.white,
                              //   ),
                              //   child: Column(
                              //     children: const [
                              //       Text(
                              //         "Recent",
                              //         style: TextStyle(
                              //             fontSize: 14, fontWeight: FontWeight.w500),
                              //       ),
                              //       Text(
                              //         "10",
                              //         style: TextStyle(
                              //             fontSize: 22,
                              //             fontWeight: FontWeight.bold,
                              //             color: Colors.red),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(const UserScreen(),
                                      //  Get.offAll(Routes.getuserScreenRoute(),
                                      arguments: {"isSelected": 1, "index": 3});
                                },
                                child: MyConatiner(height, width, "Closed",
                                    "${casesCount.closed.value}", Colors.red),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => Get.to(const ContactedCall()),
                                child: MyCallContainer(height, width,
                                    "Contacted", const Color(0xFF1D2299)),
                              ),
                              GestureDetector(
                                onTap: () => Get.to(const NotContactedCall()),
                                child: MyCallContainer(height, width,
                                    "Not-Contacted", const Color(0xFFD83600)),
                              )
                            ],
                          ),
                        ],
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  List<Chart> getChartData() {
    final List<Chart> chartData = [
      Chart("Total", 10000000, Colors.blue),
      Chart("Remeaning", 7500000, Colors.red),
      Chart("Revenue", 3500000, Colors.amber),
    ];
    return chartData;
  }
}

class Chart {
  Chart(this.label, this.value, this.color);
  final String label;
  final int value;
  final Color color;
}

// ignore: non_constant_identifier_names
// Widget MyConatiner(height, width, title, value) {
//   return Container(
//     height: height * 0.08,
//     width: width * 0.4,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Colors.white,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "$title",
//           maxLines: 1,
//           style:
//               TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w500),
//           textAlign: TextAlign.center,
//         ),
//         Text(
//           "$value",
//           maxLines: 1,
//           style: TextStyle(
//               fontSize: height * 0.02 + width * 0.02,
//               fontWeight: FontWeight.bold,
//               color: Colors.red),
//           textAlign: TextAlign.center,
//         )
//       ],
//     ),
//   );
// }

// ignore: non_constant_identifier_names
Widget MyCallContainer(height, width, title, getcolor) {
  Color color = getcolor;
  return Container(
    height: height * 0.15,
    width: width * 0.35,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.phone_in_talk,
          size: height * 0.05,
          color: color,
        ),
        // Image.asset(
        //   "Phone.png",
        //   height: 50,
        //   color: color,
        //   fit: BoxFit.contain,
        // ),
        Text(
          "$title",
          maxLines: 1,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    ),
  );
}
