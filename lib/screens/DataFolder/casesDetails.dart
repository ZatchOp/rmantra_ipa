// String? borrowerName;
// int? contactNumber;
// BigInt? lan;
// String? bankName;
// String? disposition;
// String? subDisposition;

// final List<String> items = [
//   'Item1',
//   'Item2',
//   'Item3',
//   'Item4',
//   'Item5',
//   'Item6',
//   'Item7',
//   'Item8',
// ];
// String? selectedValue;
List<Map<String, dynamic>> casesDetails = [
  {
    "BorrowerName": "Borrower1",
    "ContactNumber": 1111111111,
    "Loan account number": BigInt.parse("111111111111111111111"),
    "BankName": "Union",
    // "Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
    // "Sub Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
  },
  {
    "BorrowerName": "Borrower2",
    "ContactNumber": 222222222,
    "Loan account number": BigInt.parse("222222222222222222222"),
    "BankName": "Union",
    // "Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
    // "Sub Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
  },
  {
    "BorrowerName": "Borrower3",
    "ContactNumber": 3333333333,
    "Loan account number": BigInt.parse("333333333333333333333"),
    "BankName": "Union",
    // "Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
    // "Sub Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
  },
  {
    "BorrowerName": "Borrower4",
    "ContactNumber": 4444444444,
    "Loan account number": BigInt.parse("444444444444444444444"),
    "BankName": "Union",
    // "Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
    // "Sub Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
  },
  {
    "BorrowerName": "Borrower5",
    "ContactNumber": 555555555,
    "Loan account number": BigInt.parse("555555555555555555555"),
    "BankName": "Union",
    // "Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
    // "Sub Disposition": DropdownButtonHideUnderline(
    //   child: DropdownButton2(
    //     isExpanded: true,
    //     hint: const Text(
    //       'Select Status',
    //       style: TextStyle(
    //         fontSize: 14,
    //         fontWeight: FontWeight.bold,
    //         color: Colors.black,
    //       ),
    //       overflow: TextOverflow.ellipsis,
    //     ),
    //     items: items
    //         .map((item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Text(
    //                 item,
    //                 style: const TextStyle(
    //                   fontSize: 14,
    //                   fontWeight: FontWeight.bold,
    //                   color: Colors.black,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //               ),
    //             ))
    //         .toList(),
    //     value: selectedValue,
    //     // onChanged: (value) {
    //     //   setState(() {
    //     //     selectedValue = value as String;
    //     //   });
    //     // },
    //     buttonHeight: 50,
    //     buttonWidth: 160,
    //     buttonPadding: const EdgeInsets.only(left: 14, right: 14),
    //     buttonDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       border: Border.all(
    //         color: const Color(0xFFE0E6FF),
    //       ),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     buttonElevation: 0,
    //     itemHeight: 40,
    //     itemPadding: const EdgeInsets.only(left: 14, right: 14),
    //     dropdownMaxHeight: 200,
    //     dropdownWidth: 200,
    //     dropdownPadding: null,
    //     dropdownDecoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(14),
    //       color: const Color(0xFFE0E6FF),
    //     ),
    //     dropdownElevation: 8,
    //     scrollbarRadius: const Radius.circular(40),
    //     scrollbarThickness: 6,
    //     scrollbarAlwaysShow: true,
    //     offset: const Offset(-20, 0),
    //   ),
    // ),
  }
];
