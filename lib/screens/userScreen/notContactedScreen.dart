import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../DataFolder/notContedted.dart';

class NotContactedCall extends StatefulWidget {
  const NotContactedCall({super.key});

  @override
  State<NotContactedCall> createState() => _NotContactedCallState();
}

class _NotContactedCallState extends State<NotContactedCall> {
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
          "Not Contacted",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          itemCount: notContacted.length,
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
                    center: Text(
                      "53%",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.02 + width * 0.015),
                    ),
                    backgroundColor: const Color(0xFF8287FF),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color(0xFF000AFF),
                  ),
                  SizedBox(
                    width: width * 0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          notContacted[index]["label"],
                          maxLines: 2,
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: height * 0.015 + width * 0.015),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    notContacted[index]["value"].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: height * 0.025),
                  )
                ],
              ),
            );
          }),
    );
    ;
  }
}
