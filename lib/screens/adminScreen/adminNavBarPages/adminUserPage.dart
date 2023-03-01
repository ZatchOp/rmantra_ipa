import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/screens/adminScreen/adminAddUser.dart';

import 'package:rmantrafe/screens/adminScreen/adminupdateAgent.dart';
import 'package:rmantrafe/screens/adminScreen/adminScreen.dart';

import '../../../constants/searchBar.dart';
import '../../../main.dart';
import '../../DataFolder/details.dart';

class AdminUserPage extends StatefulWidget {
  const AdminUserPage({super.key});

  @override
  State<AdminUserPage> createState() => _AdminUserPageState();
}

class _AdminUserPageState extends State<AdminUserPage> {
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
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          //   onPressed: () => Get.offAll(const AdminScreen()),
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
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
                                  onPressed: () => Get.to(Routes
                                      .getadminUpdateAgentPageScreenRoute()),
                                  icon: const Icon(
                                    Icons.border_color,
                                    color: Color(0xFF4356B8),
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                              ],
                            ),
                            //Details Keys
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      height: height * 0.04,
                                    ),
                                  ],
                                ),
                                //Details Values
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      height: height * 0.04,
                                    ),
                                  ],
                                ),
                              ],
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFE2E6FA),
        onPressed: () => Get.to(const AdminAddUserPage()),
        child: const Icon(
          Icons.person_add,
          color: Color(0xFF4356B8),
        ),
      ),
    );
  }
}
