import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

int activeButtonDrop = 0;

Map<int, String> monthsInYear = {
  1: "janvier",
  2: "février",
  3: "mars",
  4: "avril",
  5: "mai",
  6: "juin",
  7: "juillet",
  8: "août",
  9: "September",
  10: "octobre",
  11: "novembre",
  12: "décembre"
};

Widget widgetDropBar({
  required Null Function() onTap,
  required Widget chaildDropWidget,
  required bool valueDrop,
  required int itemIndex,
  required String timeOrder,
}) {
  return Expanded(
      child: Column(
    children: [
      InkWell(
        onTap: () {
          onTap();
          print("=======================");

          print(itemIndex);
          //activeButtonDrop == itemIndex ? : ;

          // setState(() {
          //   xQ == true ? xQ = false : xQ = true;
          // });
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 100,
          color: Color.fromARGB(255, 240, 239, 239),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: timeOrder.substring(8, 10) +
                          " " +
                          "${monthsInYear[int.parse(timeOrder.substring(5, 7))]}" +
                          " " +
                          timeOrder.substring(0, 4),
                      TextSize: 19,
                      TextColor: colorGray,
                      TextWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: '($itemIndex)',
                      TextSize: 19,
                      TextColor: Color.fromARGB(255, 160, 160, 160),
                      TextWeight: FontWeight.bold,
                    ),
                  ],
                ),
                Icon(
                  valueDrop == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: colorGray,
                  size: 30,
                ),
              ]),
        ),
      ),
      Visibility(
          visible: valueDrop,
          child: SizedBox(child: Flexible(child: chaildDropWidget))),
    ],
  ));
}





















//####################################################################################


// int activeButtonDrop = 0;

// Map<int, String> monthsInYear = {
//   1: "janvier",
//   2: "février",
//   3: "mars",
//   4: "avril",
//   5: "mai",
//   6: "juin",
//   7: "juillet",
//   8: "août",
//   9: "September",
//   10: "octobre",
//   11: "novembre",
//   12: "décembre"
// };

// Widget widgetDropBar({
//   required Null Function() onTap,
//   required Widget chaildDropWidget,
//   required bool valueDrop,
//   required int itemIndex,
//   required String timeOrder,
// }) {
//   return Expanded(
//       child: Column(
//     children: [
//       InkWell(
//         onTap: () {
//           onTap();
//           print("=======================");

//           print(itemIndex);
//           //activeButtonDrop == itemIndex ? : ;

//           // setState(() {
//           //   xQ == true ? xQ = false : xQ = true;
//           // });
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(vertical: 10),
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           height: 100,
//           color: Color.fromARGB(238, 204, 204, 204),
//           child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CustomText(
//                       text: timeOrder.substring(8, 10) +
//                           " " +
//                           "${monthsInYear[int.parse(timeOrder.substring(5, 7))]}" +
//                           " " +
//                           timeOrder.substring(0, 4),
//                       TextSize: 19,
//                       TextColor: colorGray,
//                       TextWeight: FontWeight.bold,
//                     ),
//                     CustomText(
//                       text: '($itemIndex)',
//                       TextSize: 19,
//                       TextColor: Colors.black,
//                       TextWeight: FontWeight.bold,
//                     ),
//                   ],
//                 ),
//                 Icon(
//                   valueDrop == false
//                       ? Icons.keyboard_arrow_down
//                       : Icons.keyboard_arrow_up,
//                   color: colorGray,
//                   size: 30,
//                 )
//               ]),
//         ),
//       ),
//       Visibility(
//           visible: valueDrop,
//           child: SizedBox(child: Expanded(child: chaildDropWidget))),
//     ],
//   ));
// }
