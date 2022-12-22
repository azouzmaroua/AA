import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class view_static extends StatelessWidget {
  final int? payes;
  final int? non_payes;
  final double? revenue;
  final double? profit;

  const view_static(
      {Key? key, this.payes, this.non_payes, this.revenue, this.profit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int total = 1;
    return Container(
      height: 200,
      child: Column(children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ventes total",
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
                      "$revenue DA",
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
                      "$profit DA",
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
}
