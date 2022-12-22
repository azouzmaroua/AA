import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';

Widget widgetVeiwProductParfum({
  required String UrlImages,
  required String intituleParfum,
  required num QuantiteInitiale,
  required num QuantiteNow,
  required String dataEntree,
  required String FullCondistion,
  required num PrixDeLunite,

  // "FullCondistion": "Full",
}) {
  return Container(
    child: Row(
      children: [
        //image parfum
        Image.network(
          UrlImages,
          height: 80,
          width: 80,
        ),
        SizedBox(
          width: 7,
        ),
        //
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // name parfum
            CustomText(
              text: intituleParfum,
              TextSize: 14,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),

            // Il reste
            CustomText(
              text: 'Il reste ${QuantiteNow} ml / ${QuantiteInitiale} ml',
              TextSize: 14,
              TextColor: FullCondistion == "Full"
                  ? greenColor
                  : FullCondistion == "Half"
                      ? orgneColor
                      : redColor,
              TextWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 2,
            ),

            // price X DA/1ml
            CustomText(
              text: '${PrixDeLunite} DA / 1 ml',
              TextSize: 14,
              TextColor: Colors.grey,
              TextWeight: FontWeight.w300,
            ),
            SizedBox(
              height: 2,
            ),
            // data Entree
            CustomText(
              text: dataEntree.substring(0, 10),
              TextSize: 14,
              TextColor: Colors.grey,
              TextWeight: FontWeight.w300,
            ),
          ],
        )
      ],
    ),
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,

      // The BoxShadow

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
        ) //BoxShadoww
      ],
    ),
  );
}
