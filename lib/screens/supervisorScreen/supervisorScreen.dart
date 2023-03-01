import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminHomePage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminLocationPage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminStatusPage.dart';
import 'package:rmantrafe/screens/adminScreen/adminNavBarPages/adminUserPage.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorAddUser.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorNavigationBar.dart/supervisorAssign.dart';

import 'supervisorNavigationBar.dart/supervisorHome.dart';
import 'supervisorNavigationBar.dart/supervisorLocation.dart';
import 'supervisorNavigationBar.dart/supervisorUser.dart';

class SupervisorScreen extends StatefulWidget {
  const SupervisorScreen({super.key});

  @override
  State<SupervisorScreen> createState() => _SupervisorScreenState();
}

class _SupervisorScreenState extends State<SupervisorScreen> {
  var pages = const [
    SupervisorHomePage(),
    SupervisorAddUserPage(),
    SupervisorUserPage(),
    SupervisorAssignPage(),
    SupervisorLocationPage(),
  ];
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    bool isSelectedIcon = isSelected == isSelected ? true : false;
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
                    ? const Icon(Icons.person_add)
                    : const Icon(Icons.person_add_outlined),
                label: "Add User"),
            BottomNavigationBarItem(
                icon: isSelected == 2
                    ? const Icon(Icons.group)
                    : const Icon(Icons.group_outlined),
                label: "Users"),
            BottomNavigationBarItem(
                icon: isSelected == 3
                    ? const Icon(
                        Icons.assignment,
                      )
                    : const Icon(Icons.assignment_outlined),
                label: "Assign"),
            BottomNavigationBarItem(
                icon: isSelected == 4
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
