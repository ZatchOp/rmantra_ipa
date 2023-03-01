import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/constants/constTextFromField.dart';

import '../../constants/constElevatedButton.dart';

class AdminAddUserPage extends StatefulWidget {
  const AdminAddUserPage({super.key});

  @override
  State<AdminAddUserPage> createState() => _AdminAddUserPageState();
}

class _AdminAddUserPageState extends State<AdminAddUserPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    String? selectedValue;
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFECEEFF),
        title: const Text(
          "Add User",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          // onPressed: () => Get.to(const AdminScreen()),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Create A New Supervisor Account",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const MyTextFormField(
            typeLabel: "Enter Username",
            hintText: "Supervisor",
            enableInputBorder: true,
            color: Color(0xFFFFFFFF),
          ),
          const MyTextFormField(
            typeLabel: "Enter UserId",
            hintText: "Supervisor001",
            enableInputBorder: true,
            color: Color(0xFFFFFFFF),
          ),
          const MyTextFormField(
            typeLabel: "Enter Contact Number",
            hintText: "9872658915",
            enableInputBorder: true,
            color: Color(0xFFFFFFFF),
          ),
          const MyTextFormField(
            typeLabel: "Enter Email-ID",
            hintText: "agent@gmail.com",
            enableInputBorder: true,
            color: Color(0xFFFFFFFF),
          ),
          const MyTextFormField(
            typeLabel: "Enter Password",
            hintText: "Designer",
            enableInputBorder: true,
            color: Color(0xFFFFFFFF),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Level",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: height * 0.07,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Level',
                        style: TextStyle(
                          fontSize: height * 0.025,
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
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                height: height * 0.06,
                width: width * 0.7,
                child: const MyElevatedButton(
                  label: "Register",
                  onPressed: null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
