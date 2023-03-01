import 'dart:async';
import 'dart:developer' as show;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/constants/constDomainName.dart';
import 'package:rmantrafe/constants/constElevatedButton.dart';
import 'package:rmantrafe/controller/Apis/loginOtpApi.dart';
import 'package:rmantrafe/controller/Apis/verifyOtp.dart';
import 'package:rmantrafe/controller/Apis/verifyToken.dart';
import 'package:rmantrafe/screens/adminScreen/adminScreen.dart';
import 'package:rmantrafe/screens/supervisorScreen/supervisorScreen.dart';
import 'package:rmantrafe/screens/userScreen/userScreen.dart';

import '../../constants/constTextFromField.dart';
import '../../main.dart';
import '../userScreen/assignLead.dart';

class DomainLoginScreen extends StatefulWidget {
  const DomainLoginScreen({super.key});

  @override
  State<DomainLoginScreen> createState() => _DomainLoginScreenState();
}

class _DomainLoginScreenState extends State<DomainLoginScreen> {
  bool animate = false;
  final _pos = 0.obs;
  var otpInt = "".obs;
  GetOtp getOtp = GetOtp();
  VerifyOtp verifyOtp = VerifyOtp();
  VerifyToken verifyToken = VerifyToken();
  //var domain = "";
  List images = [
    "assets/Dashboard.png",
    "assets/Lead.png",
    "assets/Location.png",
    "assets/report.png",
  ];
  List title = [
    "Real-Time Dashboard",
    "Dynamic Lead Generation",
    "Track Location",
    "Real-Time Report"
  ];
  //getting latitude and longitude
  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();
    var currentPositionlatitude;
    var currentPositionlongitude;
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      show.log("Permission Not Given");
      await Geolocator.requestPermission();
    } else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      currentPositionlatitude = currentPosition.latitude;
      currentPositionlongitude = currentPosition.longitude;
      verifyOtp.verifyLocation.value =
          "$currentPositionlatitude,$currentPositionlongitude";
//" 37.4219983,-122.084";
      show.log("latitude : $currentPositionlatitude");
      show.log("longitude : $currentPositionlongitude");
      show.log("$currentPositionlatitude,$currentPositionlongitude");
    }
  }

  @override
  void initState() {
    //startAnimation();
    //show.log("Wating for response");
    // PhoneNumberApiCalling postApi = PhoneNumberApiCalling();
    // postApi.PostApi();

    Timer.periodic(const Duration(seconds: 2), (Timer t) {
      _pos.value = (_pos + 1) % images.length as int;
      // setState(() {
      //   _pos = (_pos + 1) % images.length;
      // });
    });
    // verifyOtp.getToken();
    getCurrentPosition();
    super.initState();
  }

  final TextEditingController _domainName = TextEditingController();
  final TextEditingController _optVerify = TextEditingController();
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  var gettoken = "".obs;
  final _formKeyForDomain = GlobalKey<FormState>();
  final _formKeyForUserID = GlobalKey<FormState>();
  final _formKeyForPhoneNumber = GlobalKey<FormState>();

  bool validateValue = false;

  // validate() {
  //   if (_formKeyForDomain.currentState!.validate()) {
  //     validateValue = true;
  //   } else {
  //     validateValue = false;
  //   }
  // }
  // Future<void> saveJwtToken(String key, String value) async {
  //   FlutterSecureStorage storage = const FlutterSecureStorage();
  //   await storage.write(key: key, value: value);
  // }

// Retrieving JWT token
  // Future<String> getJwtToken(String key) async {
  //   FlutterSecureStorage storage = const FlutterSecureStorage();
  //   return await storage.read(key: key) ?? "";
  // }

  // void getToken() async {
  //   gettoken.value = await getJwtToken("jwtToken");
  //   show.log("Got Token : ${gettoken.value}");
  // }

  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // log(height);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: WillPopScope(
        onWillPop: () => _onWillPop(),
        child: SingleChildScrollView(
          child: SizedBox(
            //background(uper) container
            height: height,
            width: width,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: animate
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: animate ? false : true,
                      child: Image.asset(
                        "assets/Logo.png",
                        height: height * 0.23,
                        //fit: BoxFit.contain,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      height: height * 0.4,
                      //color: Colors.red,
                      child: PageView.builder(
                        //itemCount: images.length,
                        itemBuilder: (context, index) {
                          // setState(() {
                          //   indexx = images[index % images.length];
                          //   log("Indexx : $indexx");
                          // });
                          return Obx(
                            () => Column(
                              children: [
                                Image.asset(
                                  images[_pos.value],
                                  height:
                                      animate ? height * 0.25 : height * 0.3,
                                ),
                                Text(
                                  "${title[_pos.value]}",
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.2,
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  transform: animate
                      ? Matrix4.translationValues(0, height * 0.3, 1)
                      : Matrix4.translationValues(0, height * 0.65, 1),
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Color(0xFFECEEFF),
                  ),
                  child: Column(
                    // shrinkWrap: true,
                    //controller: ScrollController(),
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.02,
                              horizontal: width * 0.02)),
                      Visibility(
                          visible: animate ? false : true,
                          child: domainLog(height, width)),
                      Visibility(
                          visible: animate ? true : false,
                          child: levelLog(height, width)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      //show.log(animate.toString());
    });
  }

  Widget domainLog(height, width) {
    return SizedBox(
      height: height * 0.3,
      width: width,
      child: ListView(
        shrinkWrap: true,
        children: [
          Form(
            key: _formKeyForDomain,
            child: MyTextFormField(
              color: const Color(0xFFFFFFFF),
              //fillColor: Color(0xFFFFFFFF),
              autovalidateMode: AutovalidateMode.always,
              controller: _domainName,
              typeLabel: "Enter Domain Name",
              hintText: "intellect.rmantra.in",
              validator: MultiValidator([
                RequiredValidator(errorText: "Domain Required*"),
              ]),
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              // },
              // suffixIcon: IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.info_outline),
              //   color: Colors.red,
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.02, horizontal: width * 0.1),
            child: SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: MyElevatedButton(
                label: "Next",
                onPressed: (() {
                  _domainName.text == domain
                      ? setState(() {
                          animate = true;
                        })
                      : Get.defaultDialog(
                          backgroundColor: Colors.red[400],
                          content: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Icon(
                                  Icons.warning,
                                  size: 25,
                                  //color: Colors.red,
                                ),
                                Text(
                                  "Please Enter Correct Domain Name",
                                  maxLines: 2,
                                  style: TextStyle(
                                      //color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          // content: const Center(
                          //   child: Text("Please Enter Correct Domain Name"),
                          // ),
                        );
                }),
              ),

              // ),
            ),
          ),
          const Center(
            child: Text(
              "Powered by Intellect Infotrade Pvt Ltd",
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ),
        ],
      ),
    );
  }

  Widget levelLog(height, width) {
    return SizedBox(
      height: height * 0.6,
      width: width,
      child: ListView(
        shrinkWrap: true,
        // controller: ScrollController(),
        children: [
          Form(
            key: _formKeyForUserID,
            child: MyTextFormField(
              autovalidateMode: AutovalidateMode.always,
              validator: MultiValidator([
                RequiredValidator(errorText: "UserID Required*"),

                //  LengthLimitingTextInputFormatter(maxlength:_phoneNumber.text<=10)
              ]),
              color: const Color(0xFFFFFFFF),
              //fillColor: Color(0xFFFFFFFF),
              typeLabel: "Enter User ID",
              hintText: "User Id",
              controller: _userId,
              keyboardType: TextInputType.emailAddress,
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please Enter User Id';
              //   }
              //   return "0";
              // },
            ),
          ),
          Form(
            key: _formKeyForPhoneNumber,
            child: MyTextFormField(
              autovalidateMode: AutovalidateMode.always,
              color: const Color(0xFFFFFFFF),
              //fillColor: Color(0xFFFFFFFF),
              typeLabel: "Enter Contact Number",
              hintText: "98984 34212",
              controller: _phoneNumber,
              keyboardType: TextInputType.phone,
              validator: MultiValidator([
                RequiredValidator(errorText: "Phone Number Required*"),
                MinLengthValidator(min(10, 10),
                    errorText: "Phone Number Length 10 Required "),
                MaxLengthValidator(max(0, 10),
                    errorText: "Phone Number Length 10 Required")
              ]),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 10),
            child: SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: MyElevatedButton(
                label: "Genrate OTP",
                onPressed: (() async {
                  await getOtp.getOtp(
                    _phoneNumber.text,
                    _userId.text,
                  );
                  show.log("Message : ${getOtp.message}");
                  if (getOtp.message.value == "success") {
                    var otp = getOtp.otp;
                    otpInt.value = otp.toString();
                    Get.snackbar("OTP", "",
                        duration: const Duration(milliseconds: 3000),
                        messageText: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$otp",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(text: "$otp"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  duration: Duration(milliseconds: 1000),
                                  content: Text("Copied to your clipboard !"),
                                ));
                                // Get.snackbar(
                                //   "Otp",
                                //   "Copied to your clipboard !",
                                //   snackPosition: SnackPosition.BOTTOM,
                                //   backgroundColor: const Color(0xFFECEEFF),
                                // );

                                // const SnackBar(
                                //     content: Text('Copied to your clipboard !'));
                              },
                              child: const Icon(Icons.copy,
                                  color: Color(0xFF4356B8)),
                            ),
                          ],
                        ),
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: const Color(0xFFECEEFF));
                    // setState(() {
                    //   animate = true;
                    // });
                  } else {
                    Get.defaultDialog(
                      backgroundColor: Colors.red[400],
                      content: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.warning,
                              size: 25,
                              //color: Colors.red,
                            ),
                            Text(
                              "${getOtp.message}",
                              maxLines: 2,
                              style: const TextStyle(
                                  //color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  // show.log(_userId.text.toString());
                  // show.log(_phoneNumber.text.toString());

                  // getOtp.message == "suscess"
                  //     ? otp.value = await getOtp.otp as int
                  //     : show.log("Error");
                  // show.log("Domain Screen");
                  // show.log(otp.toString());

                  //var rnd = Random();
                  // var otp = rnd.nextDouble() * 1000;
                  // while (otp < 1000) {
                  //   otp *= 10;
                  //show.log("*******************************************");

                  // show.log("####################################");
                  // show.log(otpInt.toString());
                  // }
                }),
              ),
            ),
          ),
          MyTextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(6),
            ],
            color: const Color(0xFFFFFFFF),
            controller: _optVerify,
            //fillColor: Color(0xFFFFFFFF),
            typeLabel: "Enter OTP",
            hintText: "1234",
            keyboardType: TextInputType.phone,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 20),
            child: SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: MyElevatedButton(
                label: "VERIFY OTP",
                onPressed: () async {
                  await verifyOtp.verifyOtp(_phoneNumber.text, _optVerify.text);
                  //const uid = "RARC001";
                  // show.log("otpInt : ${otpInt.value}");

                  // show.log("in side verification : ${verifyOtp.token.value}");

                  //saveJwtToken("jwtToken", verifyOtp.token.value);
                  await setToken();
                  await getToken();
                  getCurrentPosition();
                  await verifyToken.verifyToken();
                  show.log(
                      "MESSAGE OF VCERIFIVATION : ${verifyOtp.message.value}");
                  // show.log("LEVEL OF LOGIN : ${verifyOtp.level.value}");
                  // ignore: unrelated_type_equality_checks  //(_optVerify.text == otpInt.value)

                  // if (getOtp.message.value == "success") {
                  //   switch (_userId.text) {
                  //     case uid:
                  //       {
                  //         Get.offAll(const AdminScreen());
                  //       }
                  //       break;

                  //     default:
                  //       {
                  //         Get.defaultDialog(
                  //           title: "Wrong Input",
                  //           content: const Center(
                  //             child: Text("Please Enter Correct Input"),
                  //           ),
                  //         );
                  //       }
                  //       break;
                  //   }
                  // } else {
                  //   Get.defaultDialog(
                  //     backgroundColor: Colors.red,
                  //     title: "WARNING",
                  //     content: Center(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           const Icon(
                  //             Icons.warning,
                  //             size: 25,
                  //           ),
                  //           Text(
                  //             "${getOtp.message}",
                  //             style: const TextStyle(
                  //                 color: Colors.black,
                  //                 fontWeight: FontWeight.bold),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }
                  //}
                  //  else {
                  //   Get.defaultDialog(
                  //     title: "Wrong OTP",
                  //     content: const Center(
                  //       child: Text("Please Enter Correct OTP"),
                  //     ),
                  //   );
                  // }

                  ////#################
                  const sup = "5";
                  const agent = "1";
                  const admin = "9";
                  if (verifyToken.message.value == "success") {
                    switch (verifyToken.level.value) {
                      case sup:
                        {
                          Get.offAllNamed(Routes.getsupervisorScreenRoute());
                        }
                        break;

                      case agent:
                        {
                          Get.offAllNamed(Routes.getuserScreenRoute());
                        }
                        break;

                      case admin:
                        {
                          Get.offAllNamed(Routes.getadminScreenRoute());
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
                    Get.defaultDialog(
                      backgroundColor: Colors.red,
                      title: "WARNING",
                      content: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(
                              Icons.warning,
                              size: 25,
                            ),
                            Text(
                              verifyOtp.message.value,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );

                    // Get.defaultDialog(
                    //   title: "Wrong OTP",
                    //   content: const Center(
                    //     child: Text("Please Enter Correct OTP"),
                    //   ),
                    // );
                  }
                  //if (getOtp.message.value == "success") {
                  // } else {
                  // Get.defaultDialog(
                  //   backgroundColor: Colors.red,
                  //   title: "WARNING",
                  //   content: Center(
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //       children: [
                  //         const Icon(
                  //           Icons.warning,
                  //           size: 25,
                  //         ),
                  //         Text(
                  //           "${getOtp.message}",
                  //           style: const TextStyle(
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );

                  // }
                },
              ),
            ),
          ),
          const Center(
            child: Text(
              "Powered by Intellect Infotrade Pvt Ltd",
              style: TextStyle(color: Color(0xFF000000)),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   (_pos);
  //   super.dispose();
  // }

  setToken() async {
    await SessionManager().set("token", verifyOtp.token.value);
  }

  getToken() async {
    show.log("getToken1");
    show.log("${await SessionManager().get("token")}");
    // var tk = await SessionManager().get("token");
    // show.log("getToken2");
    // show.log("tk : " + tk);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  // @override
  // void dispose() {
  //   Timer.periodic(const Duration(seconds: 2), (Timer t) {
  //     setState(() {
  //       _pos = (_pos + 1) % images.length;
  //     });
  //   });
  //   super.dispose();
  // }
}

//*********************************************************************************************
// void jwtToken(token) {
//   saveJwtToken("jwtToken", token);
// }

// getToken() async {
//   show.log("message1");
//   var tempToken = await getJwtToken("jwtToken");
//   show.log("message2");
//   show.log(tempToken.toString());
// }

//************************************************************************************** */
/*import 'dart:async';
import 'dart:developer' as show;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../constants/constElevatedButton.dart';
import '../../constants/constTextFromField.dart';

class DomainLoginScreen extends StatefulWidget {
  const DomainLoginScreen({super.key});

  @override
  State<DomainLoginScreen> createState() => _DomainLoginScreenState();
}

class _DomainLoginScreenState extends State<DomainLoginScreen> {
  bool animate = false;
  int _pos = 0;
  var otpInt = "".obs;

  List images = [
    "assets/Dashboard.png",
    "assets/Lead.png",
    "assets/Location.png",
    "assets/report.png",
  ];
  List title = [
    "Real-Time Dashboard",
    "Dynamic Lead Generation",
    "Track Location",
    "Real-Time Report"
  ];
  @override
  void initState() {
    // show.log("Wating for response");
    // PhoneNumberApiCalling postApi = PhoneNumberApiCalling();
    // postApi.PostApi();

    Timer.periodic(const Duration(seconds: 2), (Timer t) {
      setState(() {
        _pos = (_pos + 1) % images.length;
      });
    });
    super.initState();
  }

  final TextEditingController _domainName = TextEditingController();
  final TextEditingController _optVerify = TextEditingController();
  final TextEditingController _userId = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // log(height);
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment:
                  animate ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: animate ? false : true,
                  child: Image.asset(
                    "assets/Logo.png",
                    height: height * 0.23,
                    //fit: BoxFit.contain,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 1000),
                  height: height * 0.4,
                  //color: Colors.red,
                  child: PageView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    //itemCount: images.length,
                    itemBuilder: (context, index) {
                      // setState(() {
                      //   indexx = images[index % images.length];
                      //   log("Indexx : $indexx");
                      // });
                      return Column(
                        children: [
                          // Visibility(
                          //   visible: animate ? true : false,
                          //   child: SizedBox(
                          //     height: height * 0.1,
                          //   ),
                          // ),
                          Image.asset(
                            images[_pos],
                            height: animate ? height * 0.25 : height * 0.3,
                          ),
                          Text(
                            "${title[_pos]}",
                            style: TextStyle(
                                fontSize: height * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.2,
                )
              ],
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              transform: animate
                  ? Matrix4.translationValues(0, height * 0.35, 1)
                  : Matrix4.translationValues(0, height * 0.7, 1),
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(children: [
                const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                Visibility(
                    visible: animate ? false : true,
                    child: domainLog(height, width)),
                Visibility(
                    visible: animate ? true : false,
                    child: userLog(height, width)),
                const Center(
                  child: Text(
                    "Powered by Intellect Infotrade Pvt Ltd",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                ),
                // MyElevatedButton(
                //     //height: height * 0.02,
                //     color: Colors.white,
                //     onPressed: () {
                //       setState(() {
                //         animate = true;
                //       });
                //     },
                //     child: const Text(
                //       "NEXT",
                //       style: TextStyle(color: Colors.black),
                //     ))
              ]),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: const Color(0xFFFFFFFF),
    //   body: SingleChildScrollView(
    //       child: Column(
    //     children: [
    //       Container(
    //         height: height * 0.6,
    //       ),
    //       AnimatedContainer(
    //         duration: const Duration(milliseconds: 1000),
    //         height: height * 0.4,
    //         decoration: const BoxDecoration(
    //             borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(30),
    //                 topRight: Radius.circular(30)),
    //             color: Colors.purple),
    //         child: AnimatedPositioned(
    //           top: animate ? height * 0.35 : height * 0.6,
    //           left: 0,
    //           right: 0,
    //           bottom: height > 600 ? -25 : 0,
    //           duration: const Duration(milliseconds: 500),
    //           child: Column(
    //             // shrinkWrap: true,
    //             //controller: ScrollController(),
    //             children: [
    // Visibility(
    //     visible: animate ? false : true,
    //     child: domainLog(height, width)),
    // Visibility(
    //     visible: animate ? true : false,
    //     child: userLog(height, width)),
    // const Center(
    //   child: Text(
    //     "Powered by Intellect Infotrade Pvt Ltd",
    //     style: TextStyle(color: Color(0xFF000000)),
    //   ),
    // ),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   )),
    //   // body: Stack(
    //   //   children: [
    //   //     Column(
    //   //       children: [
    //     Visibility(
    //       visible: animate ? false : true,
    //       child: Image.asset(
    //         "assets/Logo.png",
    //         height: height * 0.23,
    //         //fit: BoxFit.contain,
    //       ),
    //     ),
    //     AnimatedContainer(
    //       duration: const Duration(milliseconds: 1000),
    //       height: height * 0.4,
    //       //color: Colors.red,
    //       child: PageView.builder(
    //         physics: const NeverScrollableScrollPhysics(),
    //         //itemCount: images.length,
    //         itemBuilder: (context, index) {
    //           // setState(() {
    //           //   indexx = images[index % images.length];
    //           //   log("Indexx : $indexx");
    //           // });
    //           return Column(
    //             children: [
    //               Image.asset(
    //                 images[_pos],
    //                 height: animate ? height * 0.25 : height * 0.3,
    //               ),
    //               Text(
    //                 "${title[_pos]}",
    //                 style: const TextStyle(
    //                     fontSize: 22, fontWeight: FontWeight.bold),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // ),
    //   //     AnimatedPositioned(
    //   //       duration: const Duration(milliseconds: 500),
    //   // top: animate ? height * 0.35 : height * 0.6,
    //   // left: 0,
    //   // right: 0,
    //   // bottom: height > 600 ? -25 : 0,
    //   //       child: Container(
    //   //         height: animate == false ? height * 35 : height * 55,
    //   //         //height: animate ? 400 : 200,
    //   //         decoration: BoxDecoration(
    //   //           borderRadius: BorderRadius.circular(43),
    //   //           color: const Color(0xFFECEEFF),
    //   //         ),
    //   // child: ListView(
    //   //   shrinkWrap: true,
    //   //   //controller: ScrollController(),
    //   //   children: [
    //   //     Visibility(
    //   //         visible: animate ? false : true,
    //   //         child: domainLog(height, width)),
    //   //     Visibility(
    //   //         visible: animate ? true : false,
    //   //         child: userLog(height, width)),
    //   //     // const Center(
    //   //     //   child: Text(
    //   //     //     "Powered by Intellect Infotrade Pvt Ltd",
    //   //     //     style: TextStyle(color: Color(0xFF000000)),
    //   //     //   ),
    //   //     // ),
    //   //   ],
    //   //         ),
    //   //       ),
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      //show.log(animate.toString());
    });
  }

  Widget domainLog(height, width) {
    return ListView(
      shrinkWrap: true,
      controller: ScrollController(),
      children: [
        MyTextFormField(
          fillColor: const Color(0xFFFFFFFF),
          //fillColor: Color(0xFFFFFFFF),
          controller: _domainName,
          typeLabel: "Enter Domain Name",
          hintText: "intellect.rmantra.in",

          // suffixIcon: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.info_outline),
          //   color: Colors.red,
          // ),
        ),
        // SizedBox(
        //   height: height * 0.02,
        // ),
        Padding(
          padding: const EdgeInsets.only(
            top: 25,
            right: 25,
            left: 25,
          ),
          child: MyElevatedButton(
            label: "Next",
            onPressed: (() {
              _domainName.text == "domain"
                  ? setState(() {
                      animate = true;
                    })
                  : Get.defaultDialog(
                      title: "Wrong Input",
                      content: const Center(
                          child: Text("Please Enter Correct Domain Name")));
            }),
          ),
        ),
      ],
    );
  }

  Widget userLog(height, width) {
    return ListView(
      shrinkWrap: true,
      controller: ScrollController(),
      children: [
        MyTextFormField(
          fillColor: const Color(0xFFFFFFFF),
          //fillColor: Color(0xFFFFFFFF),
          typeLabel: "Enter User ID",
          hintText: "User Id",
          controller: _userId,
        ),
        MyTextFormField(
          fillColor: const Color(0xFFFFFFFF),
          //fillColor: Color(0xFFFFFFFF),
          typeLabel: "Enter Contact Number",
          hintText: "98984 34212",
          controller: _phoneNumber,
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 10),
          child: SizedBox(
            height: height * 0.06,
            width: width * 0.7,
            child: MyElevatedButton(
              onPressed: (() async {
                // show.log(_userId.text.toString());
                // show.log(_phoneNumber.text.toString());

                // getOtp.message == "suscess"
                //     ? otp.value = await getOtp.otp as int
                //     : show.log("Error");
                // show.log("Domain Screen");
                // show.log(otp.toString());

                //var rnd = Random();
                // var otp = rnd.nextDouble() * 1000;
                // while (otp < 1000) {
                //   otp *= 10;
                //show.log("*******************************************");

                // show.log("####################################");
                // show.log(otpInt.toString());
                // }
              }),
              label: "Genrate OTP",
            ),
          ),
        ),
        MyTextFormField(
          fillColor: const Color(0xFFFFFFFF),
          controller: _optVerify,
          //fillColor: Color(0xFFFFFFFF),
          typeLabel: "Enter OTP",
          hintText: "1234",
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 20),
          child: SizedBox(
            height: height * 0.06,
            width: width * 0.7,
            child: MyElevatedButton(
              onPressed: () {
                // ignore: unrelated_type_equality_checks
                // if (getOtp.message == "success") {

                // } else {
                //   Get.defaultDialog(
                //     backgroundColor: Colors.red,
                //     title: "WARNING",
                //     content: Center(
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           const Icon(
                //             Icons.warning,
                //             size: 25,
                //           ),
                //           Text(
                //             "${getOtp.message}",
                //             style: const TextStyle(
                //                 color: Colors.black,
                //                 fontWeight: FontWeight.bold),
                //           ),
                //         ],
                //       ),
                //     ),
                //   );
                // }
              },
              label: "Button Name",
            ),
          ),
        ),
      ],
    );
  }
}
*/