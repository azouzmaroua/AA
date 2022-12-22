import 'package:flutter/material.dart';
import 'package:my_parfum/routes/home_Screen/Home.dart';
import 'package:my_parfum/soundUi.dart';

Widget WidgetAppBar({
  required String titel,
}) {
  return AppBar(
    title: Text(titel),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Color(0xff000000),
    ),
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 248, 246, 246),
  );
}
