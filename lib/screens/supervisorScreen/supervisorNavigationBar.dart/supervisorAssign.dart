import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorScreen.dart';

import '../../../constants/constElevatedButton.dart';
import '../../../constants/constTextFromField.dart';

class SupervisorAssignPage extends StatefulWidget {
  const SupervisorAssignPage({super.key});

  @override
  State<SupervisorAssignPage> createState() => _SupervisorAssignPageState();
}

class _SupervisorAssignPageState extends State<SupervisorAssignPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Assign Cases",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFECEEFF),
        // leading: IconButton(
        //   onPressed: (() => Get.off(const SupervisorScreen())),
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Text("Borrower Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Borrower Name",
                  hintText: "Rajesh Raut",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Contact Number",
                  hintText: "7865339761",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Area",
                  hintText: "sakinaka",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Address",
                  hintText: "address",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "City",
                  hintText: "Mumbai",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "State",
                  hintText: "Maharastra",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Pin Code",
                  hintText: "400022",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "PAN",
                  hintText: "ABC67VY",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Alternate Address",
                  hintText: "altertnate address",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Alternate Number",
                  hintText: "7865339761",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),

          //Text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
            child: Text("Loan Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Loan A/c Number",
                  hintText: "100002030317",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Bank Name",
                  hintText: "Indusind Bank",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Branch",
                  hintText: "Sakinaka",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Trust Name",
                  hintText: "Huston Trust",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Last Payment Date",
                  hintText: "DD/MM/YYYY",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "PTP Amount",
                  hintText: "₹ 10,000",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "POS",
                  hintText: "₹ 1,00,000",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "TOS",
                  hintText: "₹ 1,30,000",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "EMI Amount",
                  hintText: "₹ 7,000",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Sanction Amount",
                  hintText: "₹ 10,000",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Recovery Date",
                  hintText: "DD/MM/YYYY",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Rate Of Interest",
                  hintText: "12%",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "NPA Date",
                  hintText: "DD/MM/YYYY",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "BKT",
                  hintText: "6473897423",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Paid / Unpaid",
                  hintText: "Unpaid",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Stab / New",
                  hintText: "New",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "EMI Overdue",
                  hintText: "DD/MM/YYYY",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "BCC Pending",
                  hintText: "6473897423",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Penal Original",
                  hintText: "penal original",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Employer",
                  hintText: "employer",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          //single field
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: MyTextFormField(
              typeLabel: "Customer Category  ",
              hintText: "Self employed / Salaried  ",
              color: Color(0xFFFFFFFF),
              enableInputBorder: true,
            ),
          ),

          //Double
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Sales Point Name",
                  hintText: "Vapi, Gujarat",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Reference Number 1 ",
                  hintText: "6473897423",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Reference Name 1",
                  hintText: "Rakesh Raut",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Reference Number 2",
                  hintText: "6473897423",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyTextFormField(
              width: width * 0.35,
              typeLabel: "Reference Name 2",
              hintText: "7865339761",
              color: const Color(0xFFFFFFFF),
              enableInputBorder: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Register Number ",
                  hintText: "MH01CS8875",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  width: width * 0.35,
                  typeLabel: "Engine Number",
                  hintText: "CVJ192",
                  color: const Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: MyTextFormField(
              width: width * 0.35,
              typeLabel: "Chassis Number ",
              hintText: "1HGBH41JXMN109186",
              color: const Color(0xFFFFFFFF),
              enableInputBorder: true,
            ),
          ),
          //DropDown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Assigned To",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: height * 0.06,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Status',
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
                                  style: TextStyle(
                                    fontSize: height * 0.025,
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
                      itemHeight: height * 0.05,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: height * 0.2,
                      dropdownWidth: width * 0.5,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Select List ID "),
                SizedBox(
                  height: height * 0.06,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Status',
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
                                  style: TextStyle(
                                    fontSize: height * 0.025,
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
                      itemHeight: height * 0.05,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: height * 0.2,
                      dropdownWidth: width * 0.5,
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text("Select Location"),
                SizedBox(
                  height: height * 0.06,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Status',
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
                                  style: TextStyle(
                                    fontSize: height * 0.025,
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
                      itemHeight: height * 0.05,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14),
                      dropdownMaxHeight: height * 0.2,
                      dropdownWidth: width * 0.5,
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

          //BUTTON
          Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 50),
            child: SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: const MyElevatedButton(
                label: "SUBMIT",
                onPressed: null,
              ),
              // child: ElevatedButton(
              //   style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //           const Color(0xFF4356B8)),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //           RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10.0)))),
              //   onPressed: () {
              //     setState(() {});
              //   },
              //   child: const Text(
              //     "Update",
              //     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

/* Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),
            Row(
              children: const [
                MyTextFormField(
                  typeLabel: "User Name",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
                MyTextFormField(
                  typeLabel: "User Id",
                  hintText: "Admin",
                  color: Color(0xFFFFFFFF),
                  enableInputBorder: true,
                ),
              ],
            ),*/
