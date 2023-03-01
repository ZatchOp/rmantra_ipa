import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmantrafe/controller/Apis/userCasesApi/openCasesApi.dart';
import 'package:rmantrafe/screens/userScreen/assignLead.dart';
import 'package:rmantrafe/screens/userScreen/userNavigationBar.dart/userCasesPage.dart';

// ignore: must_be_immutable
class TransferCaseScreen extends StatefulWidget {
  const TransferCaseScreen({super.key});

  @override
  State<TransferCaseScreen> createState() => _TransferCaseScreenState();
}

class _TransferCaseScreenState extends State<TransferCaseScreen> {
  OpenCasesApi openCasesApi = Get.put(OpenCasesApi());
  @override
  void initState() {
    openCasesApi.openCasesAPi();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;
    var width = currentScreenSize.width;

    double heightt = height * 0.01;

    return const Scaffold(
      backgroundColor: Color(0xFFECEEFF),
      body: Center(child: Text("Transfer Cases")),
    );
  }
}
