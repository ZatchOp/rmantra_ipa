import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminHomePage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminLocationPage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminStatusPage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminUserPage.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  var pages = const [
    AdminHomePage(),
    AdminUserPage(),
    AdminStatusPage(),
    AdminLocationPage()
  ];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    // bool isSelectedIcon = isSelected == isSelected ? true : false;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: isSelected,
          onTap: (value) {
            setState(() {
              isSelected = value;
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
                label: "Home"),
            BottomNavigationBarItem(
                icon: isSelected == 1
                    ? const Icon(Icons.group)
                    : const Icon(Icons.group_outlined),
                label: "Users"),
            BottomNavigationBarItem(
                icon: isSelected == 2
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
                label: "Status"),
            BottomNavigationBarItem(
                icon: isSelected == 3
                    ? const Icon(Icons.explore)
                    : const Icon(Icons.explore_off_outlined),
                label: "Location")
          ]),
      body: Center(
        child: pages[isSelected],
      ),
    );
  }
}
