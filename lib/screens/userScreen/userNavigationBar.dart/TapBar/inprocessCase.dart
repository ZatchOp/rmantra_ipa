import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/inprocessCasesApi.dart';

import 'package:rmantrafe/screens/userScreen/assignLead.dart';

// ignore: must_be_immutable
class InprocessCaseScreen extends StatefulWidget {
  const InprocessCaseScreen({super.key});

  @override
  State<InprocessCaseScreen> createState() => _InprocessCaseScreenState();
}

class _InprocessCaseScreenState extends State<InprocessCaseScreen> {
  InprocessCasesApi inprocessCasesApi = Get.put(InprocessCasesApi());
  @override
  void initState() {
    setState(() {});
    inprocessCasesApi.inprocessCasesAPi();
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
        if (inprocessCasesApi.isLoading.value) {
          return Center(
              child: CircularProgressIndicator(color: Colors.blueGrey[900]));
        } else {
          return ListView.builder(
            shrinkWrap: true,
            itemCount:
                inprocessCasesApi.inprocessCaseSize.value, //length of opencase
            itemBuilder: (BuildContext context, caseSizeIndex) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 5),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        assignLeadGetApi.getId.value = inprocessCasesApi
                            .inprocessCaseData[0][caseSizeIndex]['id'];
                        assignLeadPostApi.postId.value = inprocessCasesApi
                            .inprocessCaseData[0][caseSizeIndex]['id'];
                        await assignLeadGetApi.assignLeadGetApi();
                        //log("ID : ${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]['id']}");
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
                                      "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["city"].toUpperCase()}",
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
                                      const Text("Disposition"),
                                      SizedBox(
                                        height: heightt,
                                      ),
                                      const Text("Sub Disposition"),
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
                                            "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["borrower_name"].toUpperCase()}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["mobile_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["loan_acc_no"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Text(
                                            "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["bankname"]}"),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                              "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["disposition"]}"),
                                        ),
                                        SizedBox(
                                          height: heightt,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Text(
                                              "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["sub_disposition"]}"),
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
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "${inprocessCasesApi.inprocessCaseData[0][caseSizeIndex]["contacted_dt"]}",
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
