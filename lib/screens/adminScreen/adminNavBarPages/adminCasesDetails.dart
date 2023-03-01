import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/constants/constMyContainer.dart';
import 'package:rmantrafe/screens/DataFolder/missedCases.dart';
import 'package:rmantrafe/screens/DataFolder/notContactedCases.dart';

import '../../DataFolder/contactedCases.dart';

class AdminCasesDetailPage extends StatefulWidget {
  const AdminCasesDetailPage({super.key});

  @override
  State<AdminCasesDetailPage> createState() => _AdminCasesDetailPageState();
}

class _AdminCasesDetailPageState extends State<AdminCasesDetailPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Cases",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFECEEFF),
        leading: IconButton(
          onPressed: (() => Get.back()),
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
            const Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 0),
              child: Text(
                "Contacted Cases",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //padding: EdgeInsets.zero,
              controller: ScrollController(),
              shrinkWrap: true,
              itemCount: contactedCases.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: width * 0.04,
                  // crossAxisSpacing: height * 0.04,
                  childAspectRatio: height > 668
                      ? (height * 1.0 / width * 1.2)
                      : (height * 1.0 / width * 1.6),
                  crossAxisCount: 2),
              itemBuilder: ((context, index) {
                return FittedBox(
                  fit: BoxFit.contain,
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
                "Not Contacted Cases",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: height * 0.025,
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
                  // crossAxisSpacing: height * 0.04,
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
                    fontSize: height * 0.025,
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
                  // crossAxisSpacing: height * 0.04,
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
    );
  }
}
