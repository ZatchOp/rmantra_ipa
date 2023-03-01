// import 'package:flutter/material.dart';

// class MyCustomContainer extends StatelessWidget {
//   final double? height;
//   final double? width;
//   final String? title;
//   final String? value;
//   final Color? color;

//   const MyCustomContainer({
//     super.key,
//     this.height,
//     this.width,
//     this.title,
//     this.value,
//     this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return MyContainer(height, width, title, value, color);
//   }
// }

// Widget MyContainer(
//     double? height, double? width, String? title, String? value, Color? color) {
//   return Container(
//     height: height! * 0.08,
//     width: width! * 0.4,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Colors.white,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "$title",
//           maxLines: 1,
//           style:
//               TextStyle(fontSize: height * 0.025, fontWeight: FontWeight.w500),
//           textAlign: TextAlign.center,
//         ),
//         Text(
//           "$value",
//           maxLines: 1,
//           style: TextStyle(
//               fontSize: height * 0.02 + width * 0.02,
//               fontWeight: FontWeight.bold,
//               color: color),
//           textAlign: TextAlign.center,
//         )
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MyConatiner(height, width, title, value, color) {
  return Container(
    padding: EdgeInsets.zero,
    height: height * 0.09,
    width: width * 0.42,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "$title",
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              // fontWeight: FontWeight.w500
            ),
            textAlign: TextAlign.center,
          ),
        ),
        FittedBox(
          fit: BoxFit.cover,
          child: Text(
            "$value",
            maxLines: 1,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: color),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}


/* Container(
      // height: 65,
      // width: 155,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: const Color(0xFFFFFFFF)),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          "$text1",
          style: const TextStyle(fontSize: 14),
          maxLines: 1,
        ),
        Text(
          "$text2",
          style: const TextStyle(fontSize: 20, color: Color(0xFF4356B8)),
          maxLines: 1,
        )
      ]),
    );*/