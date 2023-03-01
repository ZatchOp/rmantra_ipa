import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/verifyToken.dart';
import 'package:rmantrafe/main.dart';
import 'package:rmantrafe/screens/adminScreen/adminScreen.dart';
//import 'package:rmantrafe/controller/phoneNumberApiCalling.dart';
import 'package:rmantrafe/screens/loginScreen/domainLoginScreen.dart';

import 'supervisorScreen/supervisorScreen.dart';
import 'userScreen/userScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;
  final _verifyToken = VerifyToken();
  get height => height * 0.2;
  @override
  void initState() {
    startAnimation();
    _verifyToken.verifyToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            // animate == false
            //     ?
            Image.asset(
              "assets/splbg.png",
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
            // : Container(
            //     color: Colors.red,
            //   ),
            // AnimatedPositioned(
            //   duration: const Duration(milliseconds: 1000),
            //   top: animate ? 10 : 300,
            //   left: animate ? 50 : 50,
            //   right: animate ? 50 : 50,
            //   child: Image.asset(
            //     "assets/Logo.png",
            //     height: height * 0.4,
            //     // height: animate ? height * 0.4 : height * 0.2,
            //   ),
            // ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: animate ? height * 0.5 : height * 0.2,
                width: animate ? width * 0.85 : width * 0.2,
                // decoration: BoxDecoration(
                //   color: Colors.red,
                // ),
                child: Image.asset(
                  "assets/Logo.png",
                  //fit: BoxFit.fitWidth,
                  //height: height * 2.0,
                  //height: animate ? height * 0.2 : height * 1.0,
                  width: animate ? width * 1.0 : width * 1.0,
                ),
              ),
            ),
            // Visibility(
            //   visible: animate1,
            //   child: AnimatedPositioned(
            //     duration: const Duration(milliseconds: 1500),
            //     top: animate2 ? 526 : 800,
            //     child: Container(
            //       height: 100,
            //       width: 800,
            //       color: Colors.red,
            //       child: const Center(child: Text("Demo")),
            //       // decoration: BoxDecoration(
            //       //   borderRadius: BorderRadius.circular(43),
            //       //   color: const Color(0xFFF5F6FF),
            //       // ),
            //       // child: const MyTextFormField(
            //       //   color: Color(0xFFFFFFFF),
            //       //   //fillColor: Color(0xFFFFFFFF),
            //       //   typeLabel: "Enter Domain Name",
            //       // ),
            //     ),
            //   ),
            // )
          ],
        ));
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      animate = true;
      // log(animate.toString());
    });
    await Future.delayed(const Duration(milliseconds: 1200));
    // await _verifyToken.verifyToken();
    const sup = "5";
    const agent = "1";
    const admin = "9";
    if (_verifyToken.message.value == "success") {
      switch (_verifyToken.level.value) {
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
      Get.offAllNamed(Routes.getdomainLoginScreenRoute());

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

      // Get.defaultDialog(
      //   title: "Wrong OTP",
      //   content: const Center(
      //     child: Text("Please Enter Correct OTP"),
      //   ),
      // );
    }

    // setState(() {
    //   animate1 = true;
    //   log(animate1.toString());
    // });
    // setState(() {
    //   animate2 = true;
    //   log(animate2.toString());
    // });
    // AnimatedPositioned(
    //   duration: Duration(milliseconds: 1500),
    //   top: animate ? 100 : 200,
    //   left: 0,
    //   right: 0,
    //   child: Container(
    //     height: 100,
    //     width: 200,
    //     color: Colors.red,
    //     child: const Text("Demo"),
    //     // decoration: BoxDecoration(
    //     //   borderRadius: BorderRadius.circular(43),
    //     //   color: const Color(0xFFF5F6FF),
    //     // ),
    //     // child: const MyTextFormField(
    //     //   color: Color(0xFFFFFFFF),
    //     //   //fillColor: Color(0xFFFFFFFF),
    //     //   typeLabel: "Enter Domain Name",
    //     // ),
    //   ),
    // );
  }
}
