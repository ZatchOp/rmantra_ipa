import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Text? label;
  final TextStyle? labelStyle;
  final String? hintText;
  final String? typeLabel;
  final Color? color;
  final bool? readOnly;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool? enableInputBorder;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  //final test;
  const MyTextFormField({
    Key? key,
    //required this.child,
    this.borderRadius,
    this.width,
    this.height,
    this.fillColor,
    this.hintText,
    this.label,
    this.labelStyle,
    this.controller,
    this.keyboardType,
    this.typeLabel,
    this.onTap,
    this.color,
    this.enableInputBorder,
    this.focusNode,
    this.suffixIcon,
    this.validator,
    this.autovalidateMode,
    this.readOnly,
    this.inputFormatters,
    //this.test,
    // this.gradient = const LinearGradient(
    //     colors: [Color(0xFF018082), Color(0xFF026E9C), Color(0xFF052CF9)]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              typeLabel.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  //fontWeight: FontWeight.w700,
                  fontSize: 16),
            ),
          ),
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: color,
            ),
            child: TextFormField(
              inputFormatters: inputFormatters,
              autovalidateMode: autovalidateMode,
              validator: validator,
              focusNode: focusNode,
              keyboardType: keyboardType,
              controller: controller,
              onTap: onTap,
              //readOnly: readOnly as bool,//Throw error
              readOnly: readOnly == true ? true : false,
              // decoration: const InputDecoration(
              //   border: InputBorder.none,
              // ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                // filled: true,
                //fillColor: fillColor,
                suffixIcon: suffixIcon,
                label: label,
                labelStyle: labelStyle,
                hintText: hintText,
                // border: InputBorder.none,
                border: enableInputBorder == false || enableInputBorder == null
                    ? InputBorder.none
                    : OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
