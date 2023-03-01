import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/DataFolder/casesDetails.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/closeCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/inprocessCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/openCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/recentCase.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/TapBar/transferCase.dart';

import '../../../controller/Apis/userCasesApi/openCasesApi.dart';
import 'userTabBarContent.dart';

class UserCasePage extends StatefulWidget {
  const UserCasePage({super.key});

  @override
  State<UserCasePage> createState() => _UserCasePageState();
}

//var tabIndex = Get.arguments['index'] ?? 0;

class _UserCasePageState extends State<UserCasePage>
    with SingleTickerProviderStateMixin {
  var tabIndex = Get.arguments != null ? Get.arguments['index'] : 0;
  @override
  Widget build(BuildContext context) {
    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;

    List<Map<String, String>> title = [
      {"label": "Recent"},
      {"label": "Open"},
      {"label": "In Process"},
      {"label": "Closed"},
      {"label": "Transfer"}
    ];

    return DefaultTabController(
      initialIndex: tabIndex,
      length: casesDetails.length,
      child: Builder(builder: (context) {
        log("User Case Page$tabIndex");
        return Scaffold(
          backgroundColor: const Color(0xFFF5F6FF),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: SizedBox(
              height: height * 0.08,
              //width: width * 0.05,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: const Color(0xFF657781),
                labelColor: Colors.white,
                labelPadding: EdgeInsets.zero,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: -8),
                labelStyle:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                indicator: BoxDecoration(
                    color: const Color(0xFF4356B8),
                    borderRadius: BorderRadius.circular(18)),
                tabs: [
                  for (int tabBarIndex = 0;
                      tabBarIndex < title.length;
                      tabBarIndex++)
                    Text('${title[tabBarIndex]["label"]}'),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              RecentCasesScreen(),
              OpenCaseScreen(),
              InprocessCaseScreen(),
              CloseCaseScreen(),
              TransferCaseScreen(),
            ],
          ),
        );
      }),
    );
  }
}
