import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';

import '../../../constants/searchBar.dart';
import '../../DataFolder/casesDetails.dart';

// ignore: must_be_immutable
class TabBarBody extends StatelessWidget {
  final int? indexx;
  final int? indexx2;
  const TabBarBody({super.key, this.indexx, this.indexx2});

  // int get indexx => indexx;

  @override
  Widget build(BuildContext context) {
    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;
    var width = currentScreenSize.width;

    // late int indexx = obj.selectedIndex;
    double heightt = height * 0.01;
    //log("message : $indexx");
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: casesDetails.length,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => Get.to(const AssignLead()),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    // margin:const EdgeInsets.all(10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Visibility(
                              visible:
                                  indexx == 3 && indexx2 == 3 ? true : false,
                              child: Text(
                                "Full Closed Cash",
                                style: TextStyle(
                                    fontSize: height * 0.02, color: Colors.red),
                              )),
                          Row(
                            children: [
                              SizedBox(
                                width: width * 0.5,
                                child: ListView(
                                  shrinkWrap: true,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (int i = 0;
                                        i <
                                            casesDetails[index]
                                                .keys
                                                .toList()
                                                .length;
                                        i++)
                                      // Text("index = $i  : i = $i"),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: height * 0.007,
                                            horizontal: width * 0.02),
                                        child: Text(
                                            casesDetails[index]
                                                .keys
                                                .toList()[i],
                                            maxLines: 1),
                                      ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  child: ListView(
                                    shrinkWrap: true,
                                    //mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      for (int j = 0;
                                          j <
                                              casesDetails[index]
                                                  .values
                                                  .toList()
                                                  .length;
                                          j++)
                                        //Text("index = $index  : j = $j"),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * 0.007,
                                              horizontal: width * 0.02),
                                          child: Text(
                                              "${casesDetails[index].values.toList()[j]}",
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
                    children: [
                      Visibility(
                        visible: indexx == 0 && indexx2 == 0 ||
                                indexx == 1 && indexx2 == 1
                            // indexx == 0 ||
                            //         indexx2 == 0 ||
                            //         indexx == 1 ||
                            //         indexx2 == 1
                            ? false
                            : true,
                        child: Text(
                          "Mumbai",
                          style: TextStyle(fontSize: height * 0.013),
                        ),
                      ),
                      // Visibility(
                      //   visible: indexx == 3 && indexx2 == 3 ? false : true,
                      //   child: CircleAvatar(
                      //       radius: height * 0.02 + width * 0.02,
                      //       backgroundColor: Colors.green,
                      //       child: Center(
                      //         child: IconButton(
                      //             onPressed: () {},
                      //             icon: Icon(
                      //               Icons.phone,
                      //               size: height * 0.02 + width * 0.02,
                      //             )),
                      //       )),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
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