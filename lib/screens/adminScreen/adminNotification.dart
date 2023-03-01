import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/screens/DataFolder/notificationData.dart';

class AdminNotificationPage extends StatefulWidget {
  const AdminNotificationPage({super.key});

  @override
  State<AdminNotificationPage> createState() => _AdminNotificationPageState();
}

class _AdminNotificationPageState extends State<AdminNotificationPage> {
  @override
  Widget build(BuildContext context) {
    //var currentCreenSize = MediaQuery.of(context).size;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFECEEFF),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Notifications",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFFECEEFF),
        leading: IconButton(
          onPressed: (() => Get.back()),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: notificationData.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (() {
            Get.defaultDialog(
                title: notificationData[index]["message"],
                confirm: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      height: height * 0.04,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.green,
                      ),
                      child: const Center(
                          child: Text(
                        "Accept",
                        style: TextStyle(color: Colors.white),
                      ))),
                ),
                cancel: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                      height: height * 0.04,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.red,
                      ),
                      child: const Center(
                        child: Text("Reject",
                            style: TextStyle(color: Colors.white)),
                      )),
                ));
          }),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(notificationData[index]["message"]),
                    Text(
                      DateTime.now().toString(),
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
