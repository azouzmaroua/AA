import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

List<String> listMonth = <String>[
  "janvier",
  "février",
  "mars",
  "avril",
  "mai",
  "juin",
  "juillet",
  "août",
  "September",
  "octobre",
  "novembre",
  "décembre"
];

int activeButtonMonth = 0;

Widget widgetSscrolMonthesButton({
  required Null Function() onTap,
}) {
  return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
      height: 50,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 12,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                activeWidget();
                activeButtonMonth = index;
                onTap();

                //   setState(() {
                //   dropdownValue = listMonth[index];
                //   activeButtonMonth = index;
                // });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                width: 70 + 10,
                child: Column(
                  children: [
                    Text(
                      "${listMonth[index]}",
                      style: TextStyle(
                          color: Colors.black,
                          // Color(0xffa5a5a3),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        child: Container(
                      margin: EdgeInsets.only(top: 5),
                      width: 60 + 10 + 10,
                      height: 5,
                      color: activeButtonMonth == index
                          ? blueColor
                          : Color.fromARGB(0, 255, 255, 255),
                    ))
                  ],
                ),
              ),
            );
          }));
}
