import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/DataFolder/statusData.dart';

import '../adminScreen.dart';

class AdminStatusPage extends StatefulWidget {
  const AdminStatusPage({super.key});

  @override
  State<AdminStatusPage> createState() => _AdminStatusPageState();
}

class _AdminStatusPageState extends State<AdminStatusPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    double heightt = height * 0.01;
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
    ];
    String? selectedValue;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFECEEFF),
        title: const Text(
          "Status",
          style: TextStyle(color: Colors.black),
        ),
        // leading: IconButton(
        //   onPressed: () => Get.to(const AdminScreen()),
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: height * 0.07,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: const Text(
                          'Select Status',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: items
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonHeight: 50,
                        buttonWidth: 160,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFE0E6FF),
                          ),
                          color: const Color(0xFFE0E6FF),
                        ),
                        buttonElevation: 0,
                        itemHeight: 40,
                        itemPadding: const EdgeInsets.only(left: 14, right: 14),
                        dropdownMaxHeight: 200,
                        dropdownWidth: 200,
                        dropdownPadding: null,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFFE0E6FF),
                        ),
                        dropdownElevation: 8,
                        scrollbarRadius: const Radius.circular(40),
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(-20, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: statusData.length,
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
                            borderRadius: BorderRadius.circular(8.0)),
                        //margin: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   mainAxisAlignment: MainAxisAlignment.end,
                              //   children: const [
                              //     Icon(Icons.delete, color: Color(0xFF4356B8)),
                              //     Icon(
                              //       Icons.border_color,
                              //       color: Color(0xFF4356B8),
                              //     )
                              //   ],
                              // ),
                              //Details Keys
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "User ID:${statusData[index]["UserID"]}"),
                                  SizedBox(
                                    height: heightt,
                                  ),
                                  Text(
                                    statusData[index]["Address"],
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: heightt,
                                  ),
                                  Text(
                                    "${statusData[index]["status"]}| ${DateTime.now()}",
                                    style: TextStyle(
                                        color: statusData[index]["status"]
                                                .contains("Currently active")
                                            ? Colors.green
                                            : Colors.red),
                                  ),
                                  // Text(statusData[index]["Level"]),
                                  // SizedBox(
                                  //   height: heightt,
                                  // ),
                                ],
                              ),
                            ],
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
      ),
    );
  }
}
