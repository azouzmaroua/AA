import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

Widget ButtonProductScreen({
  required Null Function() onTap,
  required String titel,
  required String imageBackGround,
}) {
  return InkWell(
    onTap: () {
      tapButton1();
      onTap();
    },
    child: Container(
      height: 100,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: titel,
            TextColor: Colors.black,
            TextWeight: FontWeight.w500,
            TextSize: 25,
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 25,
          ),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imageBackGround),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              //ifs select change shadow color
              color: Color.fromARGB(255, 194, 192, 192),
              offset: const Offset(
                0.0,
                2.0,
              ),
              blurRadius: 3.0,
              spreadRadius: 1.0,
            ),
            //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ) //BoxSh
          ]),
    ),
  );
}
