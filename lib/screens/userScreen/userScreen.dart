import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/openCasesApi.dart';
import 'package:rmantrafe/main.dart';

import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';
import 'package:rmantrafe/screens/userScreen/userProfileScreen.dart';

import 'userNavigationBar.dart/userHomePage.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

// int getIndex = Get.arguments != null ? Get.arguments['index'] : 1;

class _UserScreenState extends State<UserScreen> {
  var pages = <dynamic>[
    const UserHomePage(),
    const UserCasePage(),
  ];

  int isSelected = Get.arguments != null ? Get.arguments['isSelected'] : 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: isSelected,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              isSelected = value;
              isSelected == 0
                  ? Get.offAndToNamed(Routes.getuserScreenRoute())
                  : "";
            });
          },
          selectedFontSize: 18,
          selectedItemColor: const Color(0xFF4339F2),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: isSelected == 0
                  ? const Icon(Icons.dashboard)
                  : const Icon(Icons.dashboard_outlined),
              label: "Revenue",
            ),
            BottomNavigationBarItem(
                icon: isSelected == 1
                    ? const Icon(Icons.cases_outlined)
                    : const Icon(Icons.cases_outlined),
                label: "cases"),
          ]),
      body: Center(
        child: pages[isSelected],
      ),
    );
  }
}
