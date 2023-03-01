import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rmantrafe/controller/Apis/userCasesApi/openCasesApi.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';

// ignore: must_be_immutable
class OpenCaseScreen extends StatefulWidget {
  const OpenCaseScreen({super.key});

  @override
  State<OpenCaseScreen> createState() => _OpenCaseScreenState();
}

OpenCasesApi openCasesApi = Get.put(OpenCasesApi());

class _OpenCaseScreenState extends State<OpenCaseScreen> {
  //AssignLeadApi assignLeadGetApi = Get.put(AssignLeadApi());
  @override //always called this 1st... in screen
  void initState() {
    setState(() {});
    openCasesApi.openCasesAPi();

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
        if (openCasesApi.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(color: Colors.blueGrey[900]));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: openCasesApi.openCaseSize.value, //length of opencase
            //itemCount: openCasesApi.openCaseData[0].length,
            itemBuilder: (BuildContext context, caseSizeIndex) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        assignLeadGetApi.getId.value =
                            openCasesApi.openCaseData[0][caseSizeIndex]
                                ['id']; //passing id to get api
                        log("assignLeadGetApi.getId.value : ${openCasesApi.openCaseData[0][caseSizeIndex]['id']}");
                        assignLeadPostApi.postId.value =
                            openCasesApi.openCaseData[0][caseSizeIndex]
                                ['id']; //passing id to post api
                        log("assignLeadPostApi.postID.value : ${openCasesApi.openCaseData[0][caseSizeIndex]['id']}");

                        await assignLeadGetApi.assignLeadGetApi();
                        //log("ID : ${openCasesApi.openCaseData[0][caseSizeIndex]['id']}");
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
                                      openCasesApi.city.toUpperCase(),
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "${openCasesApi.openCaseData[0][caseSizeIndex]["borrower_name"].toUpperCase()}"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(
                                          "${openCasesApi.openCaseData[0][caseSizeIndex]["mobile_no"]}"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(
                                          "${openCasesApi.openCaseData[0][caseSizeIndex]["loan_acc_no"]}"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(
                                          "${openCasesApi.openCaseData[0][caseSizeIndex]["bankname"]}"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      (openCasesApi.uploadDate.toString()),
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

      // body: ListView.builder(
      //   shrinkWrap: true,
      //   itemCount: openCasesApi.openCaseSize.toInt(), //length of opencase
      //   itemBuilder: (BuildContext context, caseSizeINdex) {
      //     return Text(openCasesApi.openCaseData[caseSizeINdex].toString());
      //   },
      // ),
    );
  }
}

/*
  body: Column(
        children: [
          const SearchBar(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: casesDetails.length,
              controller: scrollController,

              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                // log("${index + 1} at " +
                //     details[index]["Lan"].runtimeType.toString());

                return Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: SizedBox(
                    // height: 2height0,
                    child: GestureDetector(
                      onTap: () => Get.to(const AssignLead()),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        //margin: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    "Mumbai",
                                    style: TextStyle(fontSize: 8),
                                  ),
                                  Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLAvhAnkUpyxGHaAcclREUK01CMazRl7WeNd8HcTDcSQ&s",
                                    height: 30,
                                    // color: Colors.green,
                                  ),
                                ],
                              ),
                              //Details Keys
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Borrower Name"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Contact"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Loan Account Number"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Bank"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Disposition"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Sub-Disposition"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                    ],
                                  ),
                                  //Details Values
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(casesDetails[index]["BorrowerName"]),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(casesDetails[index]["ContactNumber"]
                                          .toString()),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(casesDetails[index]["Lan"]
                                          .toString()),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      Text(casesDetails[index]["BankName"]),
                                      const Text("Disp"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Sub-Diss"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //Date Time
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    (DateTime.now().toString()),
                                    style: const TextStyle(fontSize: 8),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    */

    //____________________________________________________________________________________________________________
    /*child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.5,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            openCasesApi.openCaseDetailSize
                                                .toInt();
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: width * 0.02),
                                        child: Text(
                                            "${openCasesApi.openKeys[0][i]}",
                                            maxLines: 1),
                                      ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      for (int j = 0;
                                          j <
                                              openCasesApi.openCaseDetailSize
                                                  .toInt();
                                          j++)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.007,
                                              horizontal: width * 0.02),
                                          child: Text(
                                              "${openCasesApi.openValues[0][j]}",
                                              maxLines: 1),
                                        ),
                                      // Expanded(
                                      //   child: Text(
                                      //       "${casesDetails[0].values.toList()[0]}",
                                      //       maxLines: 2),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                (DateTime.now().toString()),
                                style: TextStyle(fontSize: height * 0.013),
                              ),
                            ],
                          ),
                        ],
                      ),
                     */