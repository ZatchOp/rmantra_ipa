import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rmantrafe/constants/constMyContainer.dart';
import 'package:rmantrafe/controller/Apis/logOutApi.dart';
import 'package:rmantrafe/controller/Apis/verifyToken.dart';
import 'package:rmantrafe/main.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminCasesDetails.dart';
import 'package:rmantrafe/screens/adminScreen/adminNotification.dart';
import 'package:rmantrafe/screens/adminScreen/adminProfile.dart';
import 'package:rmantrafe/screens/loginScreen/domainLoginScreen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../userScreen/userNavigationBar.dart/userHomePage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  late List<Chart> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  final VerifyToken _verifyToken = VerifyToken();
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () => _onWillPop(),
      child: Scaffold(
        backgroundColor: const Color(0xFFECEEFF),
        appBar: AppBar(
          backgroundColor: const Color(0xFFECEEFF),
          elevation: 0,
          title: const Text(
            "Hi Admin",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: height * 0.02),
              child: IconButton(
                onPressed: (() => Get.to(const AdminNotificationPage())),
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: height * 0.02),
              child: GestureDetector(
                onTap: () async {
                  LogOutApi logOutToken = LogOutApi();
                  await logOutToken.logOutApi();
                  if (logOutToken.message.value == "success") {
                    Get.offAllNamed(Routes.getdomainLoginScreenRoute());
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
              onTap: () => Get.to(const AdminProfilePage()),
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
                  height: height / 4,
                  width: width,
                  child: SfCircularChart(
                    margin: EdgeInsets.only(
                      top: height * 0.0,
                      left: width * 0.1,
                    ),
                    // backgroundColor: Colors.orange,
                    centerX: "${width * 0.25}", //this for circular pie chart
                    centerY: "${height * 0.13}", //this for circular pie chart
                    legend: Legend(
                      //backgroundColor: Colors.purple,
                      //borderColor: Colors.black,
                      borderWidth: 2,
                      height: "$height",
                      width: "${width * 0.3}",
                      toggleSeriesVisibility: false,
                      isVisible: true,
                      position: LegendPosition.right,
                      legendItemBuilder: (String name, dynamic series,
                          dynamic point, int index) {
                        return Container(
                          color: Colors.transparent,
                          height: height * 0.09,
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
                        //radius: "${height > 667 ? height * 0.13 : height * 0.14}",
                        radius: "${height * 0.13}",
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
              GestureDetector(
                onTap: () async {
                  log("CASESS TAP");
                  await _verifyToken.verifyToken();

                  //Get.to(const AdminCasesDetailPage());
                },
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: height * 0.35,
                  width: width * 0.9,
                  child: GestureDetector(
                    onTap: () => Get.to(const AdminCasesDetailPage()),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.08),
                        child: ListView(
                          shrinkWrap: true,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Cases",
                              style: TextStyle(
                                  fontSize: height * 0.045,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.025),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: const [
                            //       Text("Recent"),
                            //       Text("132",
                            //           style: TextStyle(color: Colors.amber)),
                            //     ],
                            //   ),
                            // ),
                            // LinearPercentIndicator(
                            //   width: width * 0.7,
                            //   lineHeight: height * 0.01,
                            //   percent: 0.2,
                            //   progressColor: Colors.amber,
                            //   backgroundColor: Colors.amber[100],
                            //   barRadius: const Radius.circular(12),
                            // ),

                            //   Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.025),

                            // ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Recent"),
                                        Text("132",
                                            style:
                                                TextStyle(color: Colors.amber)),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    // width: width * 0.7,
                                    lineHeight: height * 0.01,
                                    percent: 0.2,
                                    progressColor: Colors.amber,
                                    backgroundColor: Colors.amber[100],
                                    barRadius: const Radius.circular(12),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: height * 0.02),

                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.025),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: const [
                            //       Text("Open"),
                            //       Text(
                            //         "241",
                            //         style: TextStyle(color: Color(0xFF4339F2)),
                            //       ),
                            //     ],
                            //   ),
                            // ),

                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Open"),
                                        Text(
                                          "241",
                                          style: TextStyle(
                                              color: Color(0xFF4339F2)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    // width: width * 0.7,
                                    lineHeight: height * 0.01,
                                    percent: 0.5,
                                    progressColor: const Color(0xFF4339F2),
                                    backgroundColor: Colors.blue[100],
                                    barRadius: const Radius.circular(12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.025),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: const [
                            //       Text("In Process"),
                            //       Text("454",
                            //           style: TextStyle(color: Colors.lightBlue)),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("In Process"),
                                        Text("454",
                                            style: TextStyle(
                                                color: Colors.lightBlue)),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    // width: width * 0.7,
                                    lineHeight: height * 0.01,
                                    percent: 0.9,
                                    progressColor: Colors.lightBlue,
                                    backgroundColor: Colors.lightBlue[100],
                                    barRadius: const Radius.circular(12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            // Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: width * 0.025),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //     children: const [
                            //       Text("Closed"),
                            //       Text("72", style: TextStyle(color: Colors.red)),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: height * 0.05,
                              width: width * 0.7,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.025),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text("Closed"),
                                        Text("72",
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  ),
                                  LinearPercentIndicator(
                                    //width: width * 0.7,
                                    lineHeight: height * 0.01,
                                    percent: 0.2,
                                    progressColor: Colors.red,
                                    backgroundColor: Colors.red[100],
                                    barRadius: const Radius.circular(12),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyConatiner(
                      height * 1, width * 0.6, "Total", "10", Colors.red),
                  MyConatiner(
                      height * 1, width * 0.6, "Online", "6", Colors.red),
                  MyConatiner(
                      height * 1, width * 0.6, "Offline", "4", Colors.red)
                ],
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
  // Chart(this.total, this.remeaning, this.revenue);
  // final int total;
  // final int remeaning;
  // final int revenue;
}
