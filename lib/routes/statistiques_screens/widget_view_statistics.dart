import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

Widget widget_View_Statistics({
  required num payes,
  required num non_payes,
  required num revenue,
  required num profit,
  required num total,
  required String timeEnter,
  required String timeEnterExplain,
}) {
  return Container(
    height: 200,
    color: Colors.white,
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$timeEnter",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "$timeEnterExplain",
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ventes totales",
                    style: TextStyle(
                        color: Color(0xffa5a5a3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$total",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Color(0xffd7d7d7),
              width: 30,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Payés",
                    style: TextStyle(
                        color: Color(0xffa5a5a3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$payes",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Non payés",
                    style: TextStyle(
                        color: Color(0xffa5a5a3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$non_payes",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      const Divider(
        height: 5,
        thickness: 2,
        indent: 20,
        endIndent: 20,
        color: Color(0xffd7d7d7),
      ),
      Expanded(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Revenue total",
                    style: TextStyle(
                        color: Color(0xffa5a5a3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    revenue.toStringAsFixed(2) + " DA",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              color: Color(0xffd7d7d7),
              width: 30,
              thickness: 1,
              indent: 15,
              endIndent: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Profit total",
                    style: TextStyle(
                        color: Color(0xffa5a5a3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    profit.toStringAsFixed(2) + " DA",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]),
  );
}
