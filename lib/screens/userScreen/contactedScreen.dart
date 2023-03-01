import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rmantrafe/screens/DataFolder/contectedData.dart';

class ContactedCall extends StatefulWidget {
  const ContactedCall({super.key});

  @override
  State<ContactedCall> createState() => _ContactedCallState();
}

class _ContactedCallState extends State<ContactedCall> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFECEEFF),
        elevation: 0,
        title: const Text(
          "Contacted",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: contected.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.02, horizontal: width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularPercentIndicator(
                    radius: height * 0.05,
                    lineWidth: width * 0.02,
                    animation: true,
                    percent: 0.53,
                    center: const Text(
                      "53%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    backgroundColor: const Color(0xFF8287FF),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color(0xFF000AFF),
                  ),
                  SizedBox(
                    width: width * 0.4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          contected[index]["label"],
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.025),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    contected[index]["value"].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: height * 0.027),
                  )
                ],
              ),
            );
          }),
    );
  }
}
