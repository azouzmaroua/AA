import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

Widget WidgetButtonChoesCondistion(
    {required Null Function() onTap,
    required Color colorActive,
    required Color colorDesctive,
    required String titel,
    required String value,
    required String varibalChange}) {
  return InkWell(
    onTap: () {
      //play sound
      activeWidget();
      //
      onTap();
    },
    child: Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      //  padding: EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: 80,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: colorActive,

                //BorderRadius

                borderRadius: BorderRadius.circular(4),

                // The BoxShadow
              ), //BoxD
            ),
            SizedBox(
              width: 5,
            ),
            CustomText(
              text: titel,
              TextSize: 18,
              TextColor: varibalChange == value ? blueColor : colorGray,
              TextWeight: FontWeight.w800,
            ),
          ],
        ),
      ),

      decoration: BoxDecoration(
        //Border size & Colors

        border: Border.all(
            color: varibalChange == value ? blueColor : colorGray,
            width: 2.0,
            style: BorderStyle.solid), //Border.all

        //BorderRadius

        borderRadius: BorderRadius.circular(10),

        // The BoxShadow

        // boxShadow: [
        //   BoxShadow(
        //     //ifs select change shadow color
        //     color: varibalChange == value ? colorActive : Colors.white,
        //     offset: const Offset(
        //       0.0,
        //       1.0,
        //     ),
        //     blurRadius: 5.0,
        //     spreadRadius: 2.0,
        //   ),
        //   //BoxShadow
        //   BoxShadow(
        //     color: Colors.white,
        //     offset: const Offset(0.0, 0.0),
        //     blurRadius: 0.0,
        //     spreadRadius: 0.0,
        //   ) //BoxShadow
        // ],
      ), //BoxDecoration
    ),
  );
}
