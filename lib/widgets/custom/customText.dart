import 'package:flutter/material.dart';

Widget CustomText({
  required String text,
  required double TextSize,
  required FontWeight TextWeight,
  required Color TextColor,
}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: TextSize,
      color: TextColor,
      fontWeight: TextWeight,
      fontFamily: 'Poppins',
    ),
  );
}
