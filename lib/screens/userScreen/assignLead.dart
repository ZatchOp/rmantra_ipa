// ignore_for_file: prefer_typing_uninitialized_variables, prefer_interpolation_to_compose_strings

import 'dart:developer';
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:rmantrafe/controller/Apis/dropDownApi/dropDownDispositionApi.dart';
import 'package:rmantrafe/controller/Apis/getAddressApi.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/inprocessCasesApi.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/openCasesApi.dart';
import 'package:rmantrafe/main.dart';

import '../../constants/constElevatedButton.dart';
import '../../constants/constExpansionTile.dart';
import '../../constants/constTextFromField.dart';
import '../../controller/Apis/assignLeadApis/assignLeadGetApi.dart';
import '../../controller/Apis/assignLeadApis/assignLeadPostApi.dart';
import '../../controller/Apis/dropDownApi/dropDownApiUsingModel.dart';
import '../../controller/Apis/dropDownApi/dropDownSubdispositionApi.dart';
import '../../model/dispositionModel.dart';
import '../DataFolder/casesDetails.dart';
import 'userScreen.dart';

class AssignLead extends StatefulWidget {
  const AssignLead({super.key});

  @override
  State<AssignLead> createState() => _AssignLeadState();
}

AssignLeadGetApi assignLeadGetApi = Get.put(AssignLeadGetApi());
AssignLeadPostApi assignLeadPostApi = Get.put(AssignLeadPostApi());
DropDownDispositionApi dropDownDispositionApi = DropDownDispositionApi();
// GetAddress getAddress = GetAddress();
// DropDownSubdispositionApi dropDownSubdispositionApi =
//     DropDownSubdispositionApi();

class _AssignLeadState extends State<AssignLead> {
  //TextEditingControllers

  final borrowerName = TextEditingController();
  final mobileNumber = TextEditingController();
  final area = TextEditingController();
  final loanAccountNumber = TextEditingController();
  final bankName = TextEditingController();
  final tos = TextEditingController();
  final assignBy = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final panCode = TextEditingController();
  final pinCode = TextEditingController();
  final trustName = TextEditingController();
  final productType = TextEditingController();
  final sanctionDate = TextEditingController();
  final lastPaymentDate = TextEditingController();
  final ptpAmount = TextEditingController();
  final pos = TextEditingController();
  final remark = TextEditingController();
  var nextSuggestedAddress1 = "".obs;
  var nextSuggestedAddress2 = "".obs;
  var nextSuggestedAddress3 = "".obs;
  var nextSuggestedAddress4 = "".obs;
  var postId = 0.obs;
  var callBack_Date;
  var callBack_Time;
  var callBack_dateTime;
  var insideLocation = "".obs;
  //creatings list
  List<Disposition> dispositionList = [];
  List<Subdisposition> subDispositionList = [];
  //creating temp list for filtering
  List<Subdisposition> tempSubDispositionList = [];

  //creating a value for dropdowns

  String? disposition;
  String? subDisposition;
  String? subDispositionText;
  //creating a value of loading
  var isLoading = true;

  //creating  populated method
  populatedDropDowns() async {
    DispostionsModel data = await getData();
    setState(() {
      dispositionList = data.disposition;
      subDispositionList = data.subdisposition;
      isLoading = false;
    });
  }

  //getting latitude and longitude
  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    var currentPositionlatitude;
    var currentPositionlongitude;
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Permission Not Given");
      await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentPositionlatitude = currentPosition.latitude;
      currentPositionlongitude = currentPosition.longitude;
      // assignLeadPostApi.assignLeadLocation.value =
      //     "$currentPositionlatitude,$currentPositionlongitude";
      insideLocation.value =
          "$currentPositionlatitude,$currentPositionlongitude";
//" 37.4219983,-122.084";
      log("latitude : $currentPositionlatitude");
      log("longitude : $currentPositionlongitude");
      log("$currentPositionlatitude,$currentPositionlongitude");
    }
  }

  @override
  void initState() {
    assignLeadGetApi.assignLeadGetApi();
    dropDownDispositionApi.dropDownDispositionApi();

    // dropDownDispositionApi.dropDownDispositionApi();
    fillFormField();
    populatedDropDowns();
    //dispostionData();
    // setState(() {
    //   subDispositionContactedList = ["Select dispositionCon"];
    //   subDispositionNotContactedList = ["Select dispositionNotCon"];
    // });
    getCurrentPosition();
    // assignLeadPostApi.assignLeadLocation.value = insideLocation.value;
    super.initState();
  }

  //image picking
  File? pickedImage;
  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

//Auto filling text form field
  fillFormField() async {
    borrowerName.text =
        await assignLeadGetApi.assignLeadData[0]["borrower_name"] ?? "";
    mobileNumber.text =
        await assignLeadGetApi.assignLeadData[0]["mobile_no"] ?? "";
    area.text = await assignLeadGetApi.assignLeadData[0]["area"] ?? "";
    loanAccountNumber.text =
        await assignLeadGetApi.assignLeadData[0]["loan_acc_no"] ?? "";
    bankName.text = await assignLeadGetApi.assignLeadData[0]["bankname"] ?? "";
    tos.text = await assignLeadGetApi.assignLeadData[0]["tos"] ?? "";
    assignBy.text =
        await assignLeadGetApi.assignLeadData[0]["assigned_by"] ?? "";
    address.text = await assignLeadGetApi.assignLeadData[0]["address"] ?? "";
    city.text = await assignLeadGetApi.assignLeadData[0]["city"] ?? "";
    state.text = await assignLeadGetApi.assignLeadData[0]["state"] ?? "";
    panCode.text = await assignLeadGetApi.assignLeadData[0]["pancardno"] ?? "";
    pinCode.text = await assignLeadGetApi.assignLeadData[0]["pincode"] ?? "";
    trustName.text =
        await assignLeadGetApi.assignLeadData[0]["trustname"] ?? "";
    productType.text =
        await assignLeadGetApi.assignLeadData[0]["product_type"] ?? "";
    sanctionDate.text =
        await assignLeadGetApi.assignLeadData[0]["sanctiondate"] ?? "";
    lastPaymentDate.text =
        await assignLeadGetApi.assignLeadData[0]["lastpaymentdate"] ?? "";
    ptpAmount.text =
        await assignLeadGetApi.assignLeadData[0]["ptp_amount"] ?? "";
    pos.text = await assignLeadGetApi.assignLeadData[0]["pos"] ?? "";
    nextSuggestedAddress2.value =
        assignLeadGetApi.assignLeadData[0]["address1"] ?? "";
    nextSuggestedAddress3.value =
        assignLeadGetApi.assignLeadData[0]["address2"] ?? "";
    nextSuggestedAddress4.value =
        assignLeadGetApi.assignLeadData[0]["address3"] ?? "";
  }

  // String? _selectedDisposition;
  // String? _selectedSubdisposition;

  // List disposition = dropDownDispositionApi.dispositonData;
  // var subDisposition = [].obs;
  // List disposition = [
  //   "Contacted",
  //   "Not Contacted",
  // ];
  //List subDispositionContactedList = [];
  // List subDispositionNotContactedList = [];
//Radio Buttons
  List radioItem1 = ["Single EMI", "Full Closed"];
  List radioItem2 = ["Cash", "Issue Receipt"];
  String selectedRadioValue1 = "";
  String selectedRadioValue2 = "";
  bool r2 = false;

//
  @override
  Widget build(BuildContext context) {
    log("nextSuggestedAddress2 : ${nextSuggestedAddress2.value}");
    log("nextSuggestedAddress3 : ${nextSuggestedAddress3.value}");
    log("nextSuggestedAddress4 : ${nextSuggestedAddress4.value}");
    // Map<String, List> subDisposition = {
    //   'Contacted': subDispositionContactedList,
    //   'Not Contacted': subDispositionNotContactedList,
    // };
    // log("From dropDownDispositionApi : ${dropDownDispositionApi.message.value}");
    // log("From dropDownDispositionApi : ${dropDownDispositionApi.contacted}");
    // log("From dropDownDispositionApi : ${dropDownDispositionApi.notContacted}");
    // dataShow();
    //AssignLeadApi assignLeadGetApi = Get.put(AssignLeadApi());

    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;
    var width = currentScreenSize.width;

    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFECEEFF),
        // leadingWidth: 15,
        // leading: const Padding(
        //   padding: EdgeInsets.only(left: 10),
        //   child: Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.black,
        //   ),
        // ),
        flexibleSpace: Container(),
        title: const Text(
          "ASSIGN LEAD",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 25),
              child: Text(
                "BORROWER DETAILS | LOAN DETAILS",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  //Borrower Name TextField
                  MyTextFormField(
                    typeLabel: "Borrower Name",
                    hintText: "Borrower Name",
                    controller: borrowerName,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Mobile Number TextField
                  MyTextFormField(
                    typeLabel: "Mobile Number",
                    hintText: "1234567890",
                    controller: mobileNumber,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Area
                  MyTextFormField(
                    typeLabel: "Area",
                    hintText: "Sakinaka",
                    controller: area,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Loan Account Number TextField
                  MyTextFormField(
                    typeLabel: "Loan Account Number ",
                    hintText: "1234567890",
                    controller: loanAccountNumber,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Bank Name
                  MyTextFormField(
                    typeLabel: "Bank Name",
                    hintText: "Indusind Bank",
                    controller: bankName,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //TOS
                  MyTextFormField(
                    typeLabel: "TOS",
                    hintText: "₹1,00,000",
                    controller: tos,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Assign by
                  MyTextFormField(
                    typeLabel: "Assign by",
                    hintText: "Mr/Miss Xyz",
                    controller: assignBy,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Address
                  MyTextFormField(
                    typeLabel: "Address",
                    hintText: "1010,Creascent Business Square,Khairani Road",
                    controller: address,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //City
                  MyTextFormField(
                    typeLabel: "City",
                    hintText: "Mumbai",
                    controller: city,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //State
                  MyTextFormField(
                    typeLabel: "State",
                    hintText: "Maharashtra",
                    controller: state,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Permanent Account Number(PAN)
                  MyTextFormField(
                    typeLabel: "Permanent Account Number(PAN)",
                    hintText: "ABCY1234D",
                    controller: panCode,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Pin Code
                  MyTextFormField(
                    typeLabel: "Pin Code",
                    hintText: "400022",
                    controller: pinCode,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Trust name
                  MyTextFormField(
                    typeLabel: "Trust name",
                    hintText: "Huntington Trust",
                    controller: trustName,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Product type
                  MyTextFormField(
                    typeLabel: "Product type",
                    hintText: "Commodities",
                    controller: productType,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //Sanction date
                  MyTextFormField(
                    typeLabel: "Sanction date",
                    hintText: "12/01/2023",
                    controller: sanctionDate,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                    // keyboardType: TextInputType.datetime,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          sanctionDate.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          //log("Date: ${sanctionDate.text}");
                        });
                      }
                    },
                  ),

                  //Last payment date
                  MyTextFormField(
                    typeLabel: "Last payment date",
                    hintText: "22/01/2023",
                    controller: lastPaymentDate,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                    //keyboardType: TextInputType.datetime,
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        setState(() {
                          lastPaymentDate.text =
                              DateFormat('dd/MM/yyyy').format(pickedDate);
                          // log("Date: ${sanctionDate.text}");
                        });
                      }
                    },
                  ),

                  //PTP amount
                  MyTextFormField(
                    typeLabel: "PTP amount",
                    hintText: "₹1,00,000",
                    controller: ptpAmount,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),

                  //POS
                  MyTextFormField(
                    typeLabel: "POS",
                    hintText: "₹1,00,000",
                    controller: pos,
                    color: const Color(0xFFFFFFFF),
                    enableInputBorder: true,
                    readOnly: true,
                  ),
                  MyConfigExpantionTile(
                    onExpansionChanged: (p0) => log("message"),
                    header: Row(
                      children: [
                        const Text(
                          "1.Maximum Transaction",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: currentScreenSize.width < 500
                              ? width * 0.3
                              : width * 0.51,
                        )
                      ],
                    ),
                    text: const Text("message"),
                  ),
                  MyConfigExpantionTile(
                    header: Row(
                      children: [
                        const Text(
                          "2.Next Suggested Address",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: currentScreenSize.width < 500
                              ? width * 0.25
                              : width * 0.5,
                        )
                      ],
                    ),
                    text: Text(nextSuggestedAddress2.value),
                  ),
                  MyConfigExpantionTile(
                    header: Row(
                      children: [
                        const Text(
                          "3.Next Suggested Address",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: currentScreenSize.width < 500
                              ? width * 0.25
                              : width * 0.5,
                        )
                      ],
                    ),
                    text: Text(nextSuggestedAddress3.value),
                  ),
                  MyConfigExpantionTile(
                    header: Row(
                      children: [
                        const Text(
                          "4.Next Suggested Address",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          width: currentScreenSize.width < 500
                              ? width * 0.25
                              : width * 0.5,
                        )
                      ],
                    ),
                    text: Text(nextSuggestedAddress4.value),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.025, vertical: height * 0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: height * 0.06,
                              child: //creating disposition dropdown
                                  DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: const Text("Select Disposition"),
                                  value: disposition,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  //mapping for disposition here for items
                                  items: dispositionList.map((e) {
                                    return DropdownMenuItem(
                                        value: e.dispoid.toString(),
                                        onTap: () {
                                          assignLeadPostApi
                                              .assignLeadDisposition
                                              .value = e.dispo;
                                        },
                                        child: Text(e.dispo));
                                  }).toList(),

                                  onChanged: (newValue) {
                                    setState(() {
                                      subDisposition = null;
                                      disposition = newValue.toString();
                                      // log("Dipos List : ${dispositionList.contains(disposition)}");
                                      // log("Dispo NAme :$disposition");

                                      //filtering subdispostion
                                      tempSubDispositionList =
                                          subDispositionList
                                              .where((element) =>
                                                  element.dispoid.toString() ==
                                                  disposition.toString())
                                              .toList();
                                    });
                                  },
                                  buttonHeight: 50,
                                  buttonWidth: width * 0.4,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xFFC8D3FC),
                                    ),
                                    color: const Color(0xFFC8D3FC),
                                  ),
                                  buttonElevation: 0,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xFFC8D3FC),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            SizedBox(
                              height: height * 0.06,
                              child: //creating SubDisposition dropdown
                                  DropdownButtonHideUnderline(
                                child: DropdownButton2(
                                  hint: const Text("Select SubDisposition"),
                                  value: subDisposition,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                  ),
                                  //mapping for disposition here for items
                                  items: tempSubDispositionList.map((e) {
                                    return DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.subDispo),
                                        onTap: () {
                                          assignLeadPostApi
                                              .assignLeadSubDisposition
                                              .value = e.subDispo;
                                          subDispositionText = e.subDispo;
                                        });
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      subDisposition = newValue.toString();

                                      // log("Kya Aya : $subDisposition");

                                      log("Subdispo NAme :$subDisposition ");
                                    });
                                  },
                                  buttonHeight: 50,
                                  buttonWidth: width * 0.5,
                                  buttonPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  buttonDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: const Color(0xFFC8D3FC),
                                    ),
                                    color: const Color(0xFFC8D3FC),
                                  ),
                                  buttonElevation: 0,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xFFC8D3FC),
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0),
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 8,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //       color: const Color(0xFF4356B8),
                            //       borderRadius: BorderRadius.circular(100)),
                            //   child: IconButton(
                            //       onPressed: () {},
                            //       icon: const Icon(
                            //         Icons.add_a_photo_outlined,
                            //         color: Colors.white,
                            //       )),
                            // )
                          ],
                        ),
                        //  Sub dispotions Action .......
//Call Back //Date and Time
                        Visibility(
                          //visible: true,
                          visible: subDisposition == "4" ||
                                  subDisposition == "5" ||
                                  subDisposition == "6"
                              ? true
                              : false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 8),
                            child: Container(
                              width: width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Colors.indigo[200],
                              ),
                              child: Column(
                                children: [
                                  Builder(builder: (context) {
                                    return TextButton(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.calendar_month,
                                              color: Colors.indigo),
                                          const SizedBox(width: 10),
                                          const Text(
                                            "Select Date : ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.indigo),
                                          ),
                                          if (callBack_Date != null)
                                            Text(callBack_Date)
                                        ],
                                      ),
                                      onPressed: () async {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101),
                                        );
                                        if (pickedDate != null) {
                                          setState(() {
                                            callBack_Date =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(pickedDate);
                                            log("Date: $callBack_Date");
                                          });
                                        }
                                      },
                                    );
                                  }),
                                  TextButton(
                                    child: Row(
                                      children: [
                                        const Icon(Icons.watch,
                                            color: Colors.indigo),
                                        const SizedBox(width: 10),
                                        const Text(
                                          "Select  Time : ",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.indigo),
                                        ),
                                        // const SizedBox(width: 40),
                                        if (callBack_Time != null)
                                          Text(callBack_Time)
                                      ],
                                    ),
                                    onPressed: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        initialTime: TimeOfDay.now(),
                                        context: context,
                                      );

                                      // ignore: duplicate_ignore
                                      if (pickedTime != null) {
                                        // ignore: use_build_context_synchronously
                                        log(pickedTime
                                            .format(context)); //output 10:51 PM
                                        DateTime parsedTime = DateFormat.jm()
                                            // ignore: use_build_context_synchronously
                                            .parse(pickedTime
                                                .format(context)
                                                .toString());
                                        callBack_Time = parsedTime;
                                        //converting to DateTime so that we can further format on different pattern.
                                        log(parsedTime
                                            .toString()); //output 1970-01-01 22:53:00.000
                                        String formattedTime =
                                            DateFormat('HH:mm:ss')
                                                .format(parsedTime);
                                        log(formattedTime); //output 14:59:00
                                        //DateFormat() is from intl package, you can format the time on any pattern you need.
                                        callBack_Time = formattedTime;

                                        // log("Concaneting : " +
                                        //     callBack_Date +
                                        //     callBack_Time);
                                        callBack_dateTime =
                                            callBack_Date + " " + callBack_Time;

                                        // log("callBack_dateTime : " +
                                        //     callBack_dateTime);
                                        setState(() {
                                          var timeinput;
                                          timeinput = formattedTime;
                                          //set the value of text field.
                                        });
                                      } else {
                                        log("Time is not selected");
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

//Radio Buttons
                        Visibility(
                          visible: subDisposition == "1" ? true : false,
                          child: Row(
                            children: [
                              for (int i = 0; i < radioItem1.length; i++)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RadioListTile<dynamic>(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: Colors.indigo,
                                      dense: true,
                                      //tileColor: Colors.indigo[200],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: radioItem1[i],
                                      title: Text(
                                        radioItem1[i],
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      groupValue: selectedRadioValue1,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedRadioValue1 = val.toString();
                                          log("vewVal : $selectedRadioValue1");
                                          log("i : ${radioItem1[i]}");
                                          r2 = true;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),

                        Visibility(
                          visible: subDisposition == "1" ? r2 : false,
                          child: Row(
                            children: [
                              for (int i = 0; i < radioItem2.length; i++)
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: RadioListTile<dynamic>(
                                      contentPadding: EdgeInsets.zero,
                                      activeColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      value: radioItem2[i],
                                      title: Text(radioItem2[i]),
                                      groupValue: selectedRadioValue2,
                                      onChanged: (val) {
                                        setState(() {
                                          selectedRadioValue2 = val.toString();
                                          // log("vewVal : $selectedValue2");
                                          // log("i : ${radioItem2[i]}");
                                        });
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
//ptp ammount textfoemfield
                        Visibility(
                            visible: subDisposition == "5" ? true : false,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              child: TextFormField(
                                controller: ptpAmount,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[300],
                                  labelText: "PTP Amount",
                                  labelStyle: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  hintText: "Write Here",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.black),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            )),
                        //select image
                        Visibility(
                            visible: subDisposition == "3" ||
                                subDisposition == "7" ||
                                subDisposition == "2" ||
                                subDisposition == "8" ||
                                subDisposition == "9" ||
                                subDisposition == "10",
                            child: Padding(
                              // padding: const EdgeInsets.symmetric(vertical: 10),
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 10, bottom: 20),
                              child: SizedBox(
                                width: width,
                                child: Column(
                                  children: [
                                    MyElevatedButton(
                                      label: "SELECT IMAGE",
                                      onPressed: () {
                                        pickImage(ImageSource.gallery);
                                      },
                                    ),
                                    pickedImage != null
                                        ? Container(
                                            // height: 200,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              // color: Colors.red,
                                            ),
                                            child: Column(
                                              children: [
                                                Image.file(pickedImage!),
                                                // Text(
                                                //   pickedImage!.path,
                                                //   maxLines: 3,
                                                // )
                                              ],
                                            ),
                                          )
                                        : const Text(""),
                                  ],
                                ),
                              ),
                            )),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width * 0.01,
                              vertical: height * 0.01),
                          child: const Text(
                            "Remark",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: remark,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[300],
                              hintText: "Reamark",
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(8.0)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25, right: 25, top: 10, bottom: 20),
                    child: MyElevatedButton(
                      label: "SUBMIT",
                      onPressed: () async {
                        if (disposition == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(milliseconds: 1000),
                            content: Text("select disposition"),
                          ));
                        } else if (subDisposition == null) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(milliseconds: 1000),
                            content: Text("select sub disposition"),
                          ));
                        } else if (remark.text.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            duration: Duration(milliseconds: 1000),
                            content: Text("remark required"),
                          ));
                        } else if (subDisposition != null) {
                          switch (subDispositionText) {
                            case "Issue Receipt":
                              {
                                assignLeadPostApi.assignLeadEmiType.value =
                                    selectedRadioValue1;
                                // log(selectedRadioValue1.toString());
                                assignLeadPostApi.assignLeadEmiMethod.value =
                                    selectedRadioValue2;
                                // log(selectedRadioValue2.toString());
                                assignLeadPostApi.assignLeadRemark.value =
                                    remark.text;
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                              }
                              break;

                            case "Callback":
                              {
                                assignLeadPostApi.assignLeadCallBackDateAndTime
                                    .value = callBack_dateTime;
                                assignLeadPostApi.assignLeadRemark.value =
                                    remark.text;
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                              }
                              break;

                            case "Re-Visit":
                              {
                                // image pass
                                if (pickedImage != null) {
                                  assignLeadPostApi.file =
                                      File(pickedImage!.path);
                                  log("image pass : ${pickedImage!.path}");
                                } else {
                                  log("picked Image Null GOt");
                                }
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                              }
                              break;
                            case "PTP":
                              {
                                assignLeadPostApi.assignLeadCallBackDateAndTime
                                    .value = callBack_dateTime;
                                assignLeadPostApi.assignLeadPtpAmount.value =
                                    ptpAmount.text;
                                assignLeadPostApi.assignLeadRemark.value =
                                    remark.text;
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                              }
                              break;
                            case "Left Message":
                              {
                                assignLeadPostApi.assignLeadCallBackDateAndTime
                                    .value = callBack_dateTime;
                                assignLeadPostApi.assignLeadRemark.value =
                                    remark.text;
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                              }
                              break;
                            case "Expired":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;
                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                // log("image pass");
                              }
                              break;
                            case "Re-shifted":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;

                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                // log("image pass");
                              }
                              break;
                            case "Customer Not Available":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;

                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                // log("image pass");
                              }
                              break;
                            case " Wrong Address":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;

                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                // log("image pass");
                              }
                              break;
                            case "Door Closed":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                // getCurrentPosition();
                                assignLeadPostApi.assignLeadLocation.value =
                                    insideLocation.value;

                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                //log("image pass");
                              }
                              break;
                            case "":
                              {
                                //image pass
                                assignLeadPostApi.file =
                                    File(pickedImage!.path);
                                await assignLeadPostApi.assignLeadPostApi();
                                getCurrentPosition();
                                Get.back();
                                log("image pass : ${pickedImage!.path}");
                                //log("Empty");
                              }
                              break;
                            default:
                              {
                                Get.defaultDialog(
                                  title: "Wrong Input",
                                  content: const Center(
                                    child: Text("Please Enter Correct Input"),
                                  ),
                                );
                              }
                              break;
                          }
                        } else {
                          await assignLeadPostApi.assignLeadPostApi();
                          var text = assignLeadPostApi.message.value;
                          log("response : " + assignLeadPostApi.message.value);
                          Get.defaultDialog(
                            backgroundColor: Colors.red,
                            title: "ALERT",
                            content: Center(
                              child: Text(text),
                            ),
                          );
                          // await assignLeadPostApi.assignLeadPostApi();
                          // // Get.back();
                        }
                        // switch (expression) {
                        //   case value:

                        //     break;
                        //   default:
                        // }

                        // assignLeadPostApi.assignLeadPtpAmount.value =
                        //     ptpAmount.text;
                        // assignLeadPostApi.assignLeadRemark.value = remark.text;
                        // await assignLeadPostApi.assignLeadPostApi();
                        // log(borrowerName.text);
                        // log(mobileNumber.text);
                        // log(area.text);
                        // log(loanAccountNumber.text);
                        // log(bankName.text);
                        // log(tos.text);
                        // log(assignBy.text);
                        // log(address.text);
                        // log(city.text);
                        // log(state.text);
                        // log(panCode.text);
                        // log(pinCode.text);
                        // log(trustName.text);
                        // log(productType.text);
                        // log(sanctionDate.text);
                        // log(lastPaymentDate.text);
                        // log(ptpAmount.text);
                        // log(pos.text);
                        //                       InprocessCasesApi inprocessCasesApi =
                        //                           InprocessCasesApi();
                        // await inprocessCasesApi.inprocessCasesAPi();

                        // Get.off(const UserScreen(),
                        //     // Get.offAll(Routes.getuserScreenRoute(),
                        //     arguments: {"isSelected": 1, "index": });
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//________________________________________________________________________________________________________________________________________________
/*  //List disposition = ['USA', 'Canada', 'Australia'];
  //var seen = Set<String>();
  // List uniquedispositionlist = disposition.where((disposition) => seen.add(disposition)).toList();
  // var subDisposition = [].obs;
  // subdata() {
  //   if (respSelectedValue == 'Contacted') {
  //     subDisposition.value = [];
  //     setState(() {
  //       subDisposition.value = ["item1", "item2", "item3", "item4"];
  //     });
  //     log(subDisposition.toString());
  //     // subDisposition.value = [];
  //     // log("AYA KYA? " + subDisposition.value.toString());
  //   } else if (respSelectedValue == 'Not Contacted') {
  //     subDisposition.value = [];
  //     setState(() {
  //       subDisposition.value = ["item5", "item6", "item7", "item8"];
  //     });
  //     log(subDisposition.toString());

  //     log("AYA KYA? " + subDisposition.value.toString());
  //   } else {}
  // }
  // dispostionData() {
  //   setState(() {
  //     disposition.value = dropDownDispositionApi.dispositon;
  //   });
  //log("Disposition : $disposition");
  // }
  // List disposition = [
  //   'Contected',
  //   'Not Contected',
  // ];

  // List subDisposition = ["item1", "item2", "item3", "item4"];

  // subDispData() {
  //   if (_selectedDisposition.toString() == 'Contected') {
  //     log("Sub Disp Contected");
  //     //log(dropDownApi.contacted.toString());
  //     // for (int i = 0; i < dropDownApi.contacted.length; i++) {
  //     // setState(() {
  //     //   // subDisposition.add(dropDownApi.contacted[i].toString());
  //     //   subDisposition = dropDownApi.contacted;
  //     // });
  //     //   log(subDisposition.toString());
  //     //   subDisposition = [];
  //     // }
  //     //subDisposition = ["item1", "item2", "item3", "item4"].toList();
  //     setState(() {
  //       // subDisposition.add(dropDownApi.contacted[i].toString());
  //       // subDisposition.value = ["item1", "item2", "item3", "item4"].toList();
  //       subDisposition.value = dropDownDispositionApi.contacted.toList();
  //     });
  //     //log(subDisposition.toString());
  //     //subDisposition = [];
  //   } else if (_selectedDisposition == 'Not Contected') {
  //     log("Sub Disp Not Contected");
  //     //log(dropDownApi.notContacted.toString());
  //     setState(() {
  //       // subDisposition.add(dropDownApi.notContacted);
  //       //subDisposition = ["item5", "item6", "item7", "item8"].toList();
  //       subDisposition.value = dropDownDispositionApi.notContacted.toList();
  //     });

  //     //log(subDisposition.toString());
  //     //subDisposition = [];
  //   } else {
  //     log("Sub Disp Null");
  //     // subDisposition.value = [];
  //   }
  // }

  //   // datePicker() async {
  //   //   FocusScope.of(context).requestFocus(FocusNode());
  //   //   DateTime? pickedDate = await showDatePicker(
  //   //     context: context,
  //   //     initialDate: DateTime.now(),
  //   //     firstDate: DateTime(2000),
  //   //     lastDate: DateTime(2101),
  //   //   );
  //   //   if (pickedDate != null) {
  //   //     setState(() {
  //   //       sanctionDate.text = DateFormat('dd/MM/yyyy').format(pickedDate);
  //   //       log("Date: ${sanctionDate.text}");
  //   //     });
  //   //   }
  //   // }
  // }

  // dataShow() {
  //   var a = dropDownDispositionApi.dispositonData;
  //   // ignore: await_only_futures
  //   log("Disposition : ${a.toString()}");
  // }

  //_____________________________________________________________________________________________________
    // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "Assign to",
                  //           style: TextStyle(fontSize: 13, color: Colors.black),
                  //         ),
                  //         Container(
                  //           color: Colors.transparent,
                  //           height: height * 0.1,
                  //           width: width * 0.3,
                  //           child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   hintText: "Select",
                  //                   filled: true,
                  //                   fillColor: Colors.white,
                  //                   focusedBorder: const OutlineInputBorder(
                  //                     borderSide:
                  //                         BorderSide(color: Colors.black),
                  //                   ),
                  //                   border: OutlineInputBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(8)))),
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "Select List ID",
                  //           style: TextStyle(fontSize: 13, color: Colors.black),
                  //         ),
                  //         Container(
                  //           color: Colors.transparent,
                  //           height: height * 0.1,
                  //           width: width * 0.3,
                  //           child: TextFormField(
                  //             decoration: InputDecoration(
                  //               // label: const Text(
                  //               //   "Select List ID",
                  //               //   style:
                  //               //       TextStyle(fontSize: 13, color: Colors.black),
                  //               // ),
                  //               hintText: "Select",
                  //               filled: true,
                  //               fillColor: Colors.white,
                  //               focusedBorder: const OutlineInputBorder(
                  //                 borderSide: BorderSide(color: Colors.black),
                  //               ),
                  //               border: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(8),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         const Text(
                  //           "Select Location",
                  //           style: TextStyle(fontSize: 13, color: Colors.black),
                  //         ),
                  //         Container(
                  //           color: Colors.transparent,
                  //           height: height * 0.1,
                  //           width: width * 0.3,
                  //           child: TextFormField(
                  //               decoration: InputDecoration(
                  //                   hintText: "Select",
                  //                   filled: true,
                  //                   fillColor: Colors.white,
                  //                   focusedBorder: const OutlineInputBorder(
                  //                     borderSide:
                  //                         BorderSide(color: Colors.black),
                  //                   ),
                  //                   border: OutlineInputBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(8)))),
                  //         ),
                  //       ],
                  //     )
                  //   ],
                  // ),

 */
