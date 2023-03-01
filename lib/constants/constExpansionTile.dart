import 'dart:developer';

import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyConfigExpantionTile extends StatelessWidget {
  final Widget header;
  final Widget text;
  final void Function(bool)? onExpansionChanged;
  const MyConfigExpantionTile(
      {super.key,
      required this.header,
      required this.text,
      this.onExpansionChanged});

  @override
  Widget build(BuildContext context) {
    var currentScreenSize = MediaQuery.of(context).size;
    var height = currentScreenSize.height;
    var width = currentScreenSize.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      child: Card(
        color: const Color(0xFF4356B8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: ConfigurableExpansionTile(
          onExpansionChanged: onExpansionChanged,
          header: ListTileTheme(
            contentPadding: const EdgeInsets.all(0),
            child: header,
          ),
          headerBackgroundColorStart: Colors.transparent,
          expandedBackgroundColor: Colors.transparent,
          animatedWidgetFollowingHeader: const ListTileTheme(
            contentPadding: EdgeInsets.all(0),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ),
          childrenBody: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
                color: Color(0xFF4356B8)),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      // gradient: gradientColor,
                    ),
                    //height: height * 0.32,
                    width: width * 0.5,
                    child: ListView(
                      shrinkWrap: true,
                      physics: height > height * 0.32
                          // currentScreenSize.height < height * 0.32
                          ? const AlwaysScrollableScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      //  controller: ScrollController(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ("Address"),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: width,
                                padding: const EdgeInsets.all(7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: text,
                              ),
                            ],
                          ),
                        )
                        // MyTextFormField(
                        //   height: 35,
                        //   typeLabel: "Address",
                        //   color: Color(0xFFFFFFFF),
                        //   enableInputBorder: true,
                        // ),
                        // const MyTextFormField(
                        //   height: 35,
                        //   typeLabel: "Landmark",
                        //   color: Color(0xFFFFFFFF),
                        //   enableInputBorder: true,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     MyTextFormField(
                        //       height: 35,
                        //       width: width * 0.35,
                        //       typeLabel: "State",
                        //       color: const Color(0xFFFFFFFF),
                        //       enableInputBorder: true,
                        //     ),
                        //     MyTextFormField(
                        //       height: 35,
                        //       width: width * 0.35,
                        //       typeLabel: "City",
                        //       color: const Color(0xFFFFFFFF),
                        //       enableInputBorder: true,
                        //     ),
                        //   ],
                        // ),
                        // MyTextFormField(
                        //   height: 35,
                        //   width: width * 0.5,
                        //   typeLabel: "Pin Code",
                        //   color: const Color(0xFFFFFFFF),
                        //   enableInputBorder: true,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
