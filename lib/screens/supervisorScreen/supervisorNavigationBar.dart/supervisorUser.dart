import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/screens/adminScreen/adminAddUser.dart';

import 'package:rmantrafe/screens/adminScreen/adminupdateAgent.dart';
import 'package:rmantrafe/screens/adminScreen/adminScreen.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorScreen.dart';

import '../../DataFolder/details.dart';

class SupervisorUserPage extends StatefulWidget {
  const SupervisorUserPage({super.key});

  @override
  State<SupervisorUserPage> createState() => _SupervisorUserPageState();
}

class _SupervisorUserPageState extends State<SupervisorUserPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double heightt = height * 0.01;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFECEEFF),
        // iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.black),
        ),
        // leading: IconButton(
        //   onPressed: () => Get.off(const SupervisorScreen()),
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Center(
        child: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: details.length,
                controller: ScrollController(),

                // physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // log("${index + 1} at " +
                  //     details[index]["Lan"].runtimeType.toString());

                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    child: SizedBox(
                      // height: 2height0,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        //margin: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.delete,
                                      color: Color(0xFF4356B8)),
                                ),
                                IconButton(
                                  onPressed: () =>
                                      Get.to(const AdminUpdateAgentPage()),
                                  icon: const Icon(
                                    Icons.border_color,
                                    color: Color(0xFF4356B8),
                                  ),
                                ),
                                // SizedBox(
                                //   width: width * 0.05,
                                // ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: heightt * 0.2),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    //Details Keys
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("User Name"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("User ID"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Password"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Contact Number"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Level"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                    ],
                                  ),
                                  //Details Values
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(details[index]["UserName"]),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(details[index]["UserID"].toString()),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(details[index]["Password"]),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(details[index]["ContactNumber"]
                                          .toString()),
                                      Text(details[index]["Level"]),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      SizedBox(
                                        height: height * 0.03,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.all(12),
      height: height * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextFormField(
        style: const TextStyle(fontSize: 12),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintStyle: TextStyle(fontSize: 12),
            hintText: "Borrower Name/LAN/Area",
            border: InputBorder.none),
      ),
    );
  }
}
