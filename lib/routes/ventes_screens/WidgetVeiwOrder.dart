import 'package:flutter/material.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

Widget WidgetVeiwOrder({
  required Null Function() onTap,
  required bool payee_ordre,
  required List itemes_Product,
  required String timeEnter,
  required String name_Adder,
  required String indexGetList,
  required num price_ordre,
  required num total_profti,
  required num total_reveresnse,
}) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      margin: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: payee_ordre == true
                    ? Color.fromARGB(255, 50, 168, 82)
                    : Color.fromARGB(255, 233, 67, 53),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: ListView.builder(
                  itemCount: itemes_Product.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 2, left: 3, right: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(0, 238, 246, 239),
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 50,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${itemes_Product[i]['nameProduct']}",
                                      style: TextStyle(
                                        color: Color(0xfff1fdf1),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      "(${itemes_Product[i]['type_Prodct']})",
                                      style: TextStyle(
                                        color: Color(0xfff1fdf1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ]),
                              Expanded(
                                  child: SizedBox(
                                width: 8,
                              )),
                              Row(
                                children: [
                                  Text(
                                      itemes_Product[i]['type_Prodct'] ==
                                              'Parfum'
                                          ? "${itemes_Product[i]['count_ml']}"
                                          : "${itemes_Product[i]['count_peieces']}",
                                      style: TextStyle(
                                        color: Color(0xfff1fdf1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      itemes_Product[i]['type_Prodct'] ==
                                              'Parfum'
                                          ? " ml"
                                          : " pieces",
                                      style: TextStyle(
                                        color: Color(0xfff1fdf1),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                              Expanded(
                                  child: SizedBox(
                                width: 3,
                              )),
                              Text(
                                "${itemes_Product[i]['price']} DA",
                                style: TextStyle(
                                  color: Color(0xfff1fdf1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]),
                        // margin: EdgeInsets.only(top: 2),
                      ),
                    );
                  }),
            ),
          ),
          SizedBox(
            width: 1,
          ),
          Container(
            height: 160,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Text(
                    "# $indexGetList",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xfff1fdf1), fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "$price_ordre DA",
                  style: TextStyle(
                      //color: payee_ordre == true ? Colors.green : Colors.red,
                      color: Color(0xfff1fdf1),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$timeEnter",
                  style: TextStyle(
                      color: Color(0xfff1fdf1),
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
                Text(
                  "$name_Adder",
                  style: TextStyle(
                      color: Color(0xfff1fdf1),
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: payee_ordre == true
                  ? Color.fromARGB(255, 50, 168, 82)
                  : Color.fromARGB(255, 233, 67, 53),
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          //
        ],
      ),
    ),
  );
}
