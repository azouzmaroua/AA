import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/Core/constants.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({Key? key, this.text, this.onTap, this.color})
      : super(key: key);
  final String? text;
  final Color? color;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tapButton1();
        onTap!();
      },
      child: Container(
        height: 60,
        width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text!,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xffffffff),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}

class GeneralButton extends StatelessWidget {
  const GeneralButton(
      {Key? key,
      this.text,
      this.onTap,
      this.color,
      this.hight,
      this.width,
      this.textAlign,
      this.iconData,
      this.colorIcon})
      : super(key: key);
  final String? text;
  final VoidCallback? onTap;
  final Color? color;
  final Color? colorIcon;
  final double? hight;
  final double? width;
  final TextAlign? textAlign;
  final IconData? iconData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight! * .024
        : screenWidth! * .024;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: defaultSize! * hight!,
        width: defaultSize! * width!,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
            color: color!,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: color!,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: colorIcon,
              size: 40,
            ),
            SizedBox(
              width: defaultSize! * 2,
            ),
            Text(
              text!,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 16,
                color: Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
