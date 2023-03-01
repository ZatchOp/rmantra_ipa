import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/closeCasesApi.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';

import '../../../../controller/Apis/userCasesApi/closeCasesApi.dart';

// ignore: must_be_immutable
class CloseCaseScreen extends StatefulWidget {
  const CloseCaseScreen({super.key});

  @override
  State<CloseCaseScreen> createState() => _CloseCaseScreenState();
}

class _CloseCaseScreenState extends State<CloseCaseScreen> {
  CloseCasesApi closeCasesApi = Get.put(CloseCasesApi());
  @override
  void initState() {
    setState(() {});
    closeCasesApi.closeCasesAPi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;
    var width = currentScreenSize.width;

    double heightt = height * 0.01;

    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      body: Obx(() {
        if (closeCasesApi.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(color: Colors.blueGrey[900]));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: closeCasesApi.closeCaseSize.value, //length of opencase
            itemBuilder: (BuildContext context, caseSizeIndex) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        assignLeadGetApi.getId.value = closeCasesApi
                            .closeCasesData[0][caseSizeIndex]['id'];
                        assignLeadPostApi.postId.value = closeCasesApi
                            .closeCasesData[0][caseSizeIndex]['id'];
                        await assignLeadGetApi.assignLeadGetApi();
                        //log("ID : ${closeCasesApi.closeCasesData[0][caseSizeIndex]['id']}");
                        // log(assignLeadGetApi.message.value);
                        //log(assignLeadGetApi.assignLeadData[0]['city']);
                        if (assignLeadGetApi.message.value == "success") {
                          Get.to(const AssignLead());
                        }
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      closeCasesApi.city.toUpperCase(),
                                      style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Borrower Name"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Contact Number"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text(
                                        "Loan Account Number",
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Bank"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                    ],
                                  ),
                                  Obx(
                                    () => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${closeCasesApi.closeCasesData[0][caseSizeIndex]["borrower_name"].toUpperCase()}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${closeCasesApi.closeCasesData[0][caseSizeIndex]["mobile_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${closeCasesApi.closeCasesData[0][caseSizeIndex]["loan_acc_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${closeCasesApi.closeCasesData[0][caseSizeIndex]["bankname"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      (closeCasesApi.uploadDate.toString()),
                                      style: const TextStyle(
                                          fontSize: 9,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    // Text(
                                    //   (DateTime.now().toString()),
                                    //   style: TextStyle(fontSize: height * 0.013),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: heightt * 1.0,
                      right: width * 0.05,
                      left: 0,
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
