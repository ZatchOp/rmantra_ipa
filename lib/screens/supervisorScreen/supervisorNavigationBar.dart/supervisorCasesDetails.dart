import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/constants/constMyContainer.dart';
import 'package:rmantrafe/main.dart';
import 'package:rmantrafe/screens/DataFolder/missedCases.dart';
import 'package:rmantrafe/screens/DataFolder/notContactedCases.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorScreen.dart';

import '../../DataFolder/contactedCases.dart';

class SupervisorCasesDetailPage extends StatefulWidget {
  const SupervisorCasesDetailPage({super.key});

  @override
  State<SupervisorCasesDetailPage> createState() =>
      _SupervisorCasesDetailPageState();
}

class _SupervisorCasesDetailPageState extends State<SupervisorCasesDetailPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        //iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Cases",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFECEEFF),
        leading: IconButton(
          onPressed: () => Get.off(Routes.getsupervisorScreenRoute()),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 0),
              child: Text(
                "Contacted Cases",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: contactedCases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: width * 0.04,
                  //crossAxisSpacing: height * 0.06,
                  childAspectRatio: height > 668
                      ? (height * 1.0 / width * 1.2)
                      : (height * 1.0 / width * 1.6),
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return FittedBox(
                  child: MyConatiner(
                    height,
                    width,
                    "${contactedCases[index]["title"]}",
                    "${contactedCases[index]["value"]}",
                    const Color(0xFF4356B8),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06, bottom: 0),
              child: Text(
                "Not Contacted Cases",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: contactedCases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: width * 0.04,
                  //crossAxisSpacing: height * 0.06,
                  childAspectRatio: height > 668
                      ? (height * 1.0 / width * 1.2)
                      : (height * 1.0 / width * 1.6),
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return FittedBox(
                  child: MyConatiner(
                    height,
                    width,
                    "${contactedCases[index]["title"]}",
                    "${contactedCases[index]["value"]}",
                    const Color(0xFF4356B8),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, bottom: 0),
              child: Text(
                "Missed Cases",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: missedCases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: width * 0.04,
                  //crossAxisSpacing: height * 0.06,
                  childAspectRatio: height > 668
                      ? (height * 1.0 / width * 1.2)
                      : (height * 1.0 / width * 1.6),
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return FittedBox(
                  child: MyConatiner(
                    height,
                    width,
                    "${contactedCases[index]["title"]}",
                    "${contactedCases[index]["value"]}",
                    const Color(0xFF4356B8),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     const Padding(
      //       padding: EdgeInsets.only(left: 30.0, bottom: 20),
      //       child: Text(
      //         "Contacted Cases",
      //         style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 16,
      //             fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         //1st Row
      //         children: [
      //           MyContainer(
      //             text1: "Issue Receipt",
      //             text2: "${contactedCases[0]["IssueReceipt"]}",
      //           ),
      //           MyContainer(
      //             text1: "Call Back",
      //             text2: "${contactedCases[1]["CallBack"]}",
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         //2nd Row
      //         children: [
      //           MyContainer(
      //             text1: "Re-visit",
      //             text2: "${contactedCases[2]["Revisit"]}",
      //           ),
      //           MyContainer(
      //             text1: "PTP",
      //             text2: "${contactedCases[3]["PTP"]}",
      //           ),
      //         ],
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceAround,
      //         children: [
      //           MyContainer(
      //             text1: "Left Message",
      //             text2: "${contactedCases[4]["LeftMessage"]}",
      //           ),
      //           MyContainer(
      //             text1: "Single EMI",
      //             text2: "${contactedCases[5]["SingleEMI"]}",
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
