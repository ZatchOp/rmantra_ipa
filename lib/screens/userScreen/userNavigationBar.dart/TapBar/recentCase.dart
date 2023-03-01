import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/dropDownApi/dropDownDispositionApi.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/recentCasesApi.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/recentCasesApi.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';

// ignore: must_be_immutable
class RecentCasesScreen extends StatefulWidget {
  const RecentCasesScreen({super.key});

  @override
  State<RecentCasesScreen> createState() => _RecentCaseScreenState();
}

class _RecentCaseScreenState extends State<RecentCasesScreen> {
  RecentCasesApi recentCasesApi = Get.put(RecentCasesApi());
  @override
  void initState() {
    setState(() {});
    recentCasesApi.recentCasesAPi();
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
        if (recentCasesApi.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(color: Colors.blueGrey[900]));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: recentCasesApi.recentCaseSize.value, //length of opencase
            itemBuilder: (BuildContext context, caseSizeIndex) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        assignLeadGetApi.getId.value = recentCasesApi
                            .recentCaseData[0][caseSizeIndex]['id'];
                        assignLeadPostApi.postId.value = recentCasesApi
                            .recentCaseData[0][caseSizeIndex]['id'];
                        await assignLeadGetApi.assignLeadGetApi();
                        //log("ID : ${recentCasesApi.recentCaseData[0][caseSizeIndex]['id']}");
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Text(
                                        "${recentCasesApi.recentCaseData[0][caseSizeIndex]["sub_disposition"]}",
                                        style:
                                            const TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    Text(
                                        "${recentCasesApi.recentCaseData[0][caseSizeIndex]["city"]}"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      recentCasesApi.city.toUpperCase(),
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
                                      const Text("Callback Time"),
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
                                            "${recentCasesApi.recentCaseData[0][caseSizeIndex]["borrower_name"].toUpperCase()}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${recentCasesApi.recentCaseData[0][caseSizeIndex]["mobile_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${recentCasesApi.recentCaseData[0][caseSizeIndex]["loan_acc_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${recentCasesApi.recentCaseData[0][caseSizeIndex]["bankname"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                          "${recentCasesApi.recentCaseData[0][caseSizeIndex]["call_back"]}",
                                          style: const TextStyle(
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      (recentCasesApi.uploadDate.toString()),
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
                          padding: const EdgeInsets.all(3.0),
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
                                            recentCasesApi.openCaseDetailSize
                                                .toInt();
                                        i++)
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: width * 0.02),
                                        child: Text(
                                            "${recentCasesApi.openKeys[0][i]}",
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
                                              recentCasesApi.openCaseDetailSize
                                                  .toInt();
                                          j++)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.007,
                                              horizontal: width * 0.02),
                                          child: Text(
                                              "${recentCasesApi.openValues[0][j]}",
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