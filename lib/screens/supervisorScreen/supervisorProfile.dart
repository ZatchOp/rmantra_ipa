import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rmantrafe/constants/constElevatedButton.dart';
import 'package:rmantrafe/constants/constTextFromField.dart';

class SupoervisorProfilePage extends StatefulWidget {
  const SupoervisorProfilePage({super.key});

  @override
  State<SupoervisorProfilePage> createState() => _SupoervisorProfilePageState();
}

class _SupoervisorProfilePageState extends State<SupoervisorProfilePage> {
  File? pickedImage;
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
          "Profile",
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ClipOval(
                      child: pickedImage != null
                          ? Image.file(
                              pickedImage!,
                              height: height * 0.22,
                              width: width * 0.39,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              'https://hindubabynames.info/downloads/wp-content/themes/hbn_download/download/banking-and-finance/bharatpe-logo.png',
                              height: height * 0.22,
                              width: width * 0.39,
                              fit: BoxFit.cover,
                            )
                      //  FadeInImage.assetNetwork(
                      //   placeholder: 'assets/beagle.jpg',
                      //   image: pickedImage != null
                      //       ? "${Image.file(pickedImage!)}"
                      //       : "https://images.pexels.com/photos/14116837/pexels-photo-14116837.jpeg?auto=compress&cs=tinysrgb&w=600",
                      // height: height * 0.22,
                      // width: width * 0.39,
                      // fit: BoxFit.cover,
                      // ),
                      ),
                ),
                Positioned(
                  bottom: 0,
                  right: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.circular(100)),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          _imagePickerOption(context);
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const MyTextFormField(
            typeLabel: "User Name",
            hintText: "Admin",
            color: Color(0xFFFFFFFF),
            enableInputBorder: true,
          ),
          const MyTextFormField(
            typeLabel: "User Id",
            hintText: "Admin",
            color: Color(0xFFFFFFFF),
            enableInputBorder: true,
          ),
          const MyTextFormField(
            typeLabel: "Contact Number",
            hintText: "8987453716",
            color: Color(0xFFFFFFFF),
            enableInputBorder: true,
          ),
          const MyTextFormField(
            typeLabel: "Email",
            hintText: "Admin001@iit.com",
            color: Color(0xFFFFFFFF),
            enableInputBorder: true,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 50),
            child: SizedBox(
              height: height * 0.06,
              width: width * 0.7,
              child: const MyElevatedButton(
                label: "Update",
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

  Future _imagePickerOption(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) => SimpleDialog(
        title: const Text(
          'Change Profile Picture',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.gallery);
            },
            child: const Text('Choose Photo', style: TextStyle(fontSize: 16)),
          ),
          SimpleDialogOption(
            onPressed: () {
              pickImage(ImageSource.camera);
            },
            child: const Text('Take Photo', style: TextStyle(fontSize: 16)),
          ),
          SimpleDialogOption(
            onPressed: () {},
            child: const Text('Remove Photo', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
