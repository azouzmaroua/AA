import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class ScreenVeiwItemParfum extends StatefulWidget {
  ScreenVeiwItemParfum({Key? key}) : super(key: key);

  @override
  State<ScreenVeiwItemParfum> createState() => _ScreenVeiwItemParfumState();
}

String itemId_VeiwParfum = "dgzu783GUJG363";
String UrlImages_VeiwParfum =
    "https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/parfum%2Fimage_picker4219511951322543161.jpg83561109?alt=media&token=d29f47be-7cf6-43d1-a9f3-ed52820a710d";
String intituleParfum_VeiwParfum = "Sauvage";
num QuantiteNow_VeiwParfum = 100;
num QuantiteInitiale_VeiwParfum = 200;
String FullCondistion_VeiwParfum = "Half";
String dataEntree_VeiwParfum = '23/02/2022';
num PrixDeLunite_VeiwParfum = 250;
String reference_VeiwParfum = " ";
num PrixDachat_VeiwParfum = 16000;
num PrixDeVente_VeiwParfum = 16000;

class _ScreenVeiwItemParfumState extends State<ScreenVeiwItemParfum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("Enregister"),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,

                border: Border.symmetric(
                    horizontal: BorderSide(width: 0.5, color: colorGray)),

                // The BoxShadow
              ),
              child: Column(
                children: [
                  Image.network(
                    UrlImages_VeiwParfum,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "$intituleParfum_VeiwParfum",
                    TextSize: 21,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text:
                        'Il reste ${QuantiteNow_VeiwParfum} ml / ${QuantiteInitiale_VeiwParfum} ml',
                    TextSize: 17,
                    TextColor: FullCondistion_VeiwParfum == "Full"
                        ? greenColor
                        : FullCondistion_VeiwParfum == "Half"
                            ? orgneColor
                            : redColor,
                    TextWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            widgetContainerInformation(
                fisrstString: 'Prix de l’unité',
                secondString: "$PrixDeLunite_VeiwParfum DA"),
            widgetContainerInformation(
                fisrstString: 'Référence',
                secondString: "$reference_VeiwParfum"),
            widgetContainerInformation(
                fisrstString: 'Date d’entrée',
                secondString: dataEntree_VeiwParfum.substring(0, 10)),
            widgetContainerInformation2(
                fisrstString: 'Quantité initiale du flacon',
                fisrstValue: "$QuantiteInitiale_VeiwParfum ml",
                secondString: 'Quantité actuelle du flacon',
                secondValue: "$QuantiteNow_VeiwParfum ml"),
            widgetContainerInformation(
                fisrstString: 'Prix d’achat',
                secondString: "$PrixDachat_VeiwParfum DA"),
            widgetContainerInformation(
                fisrstString: 'Prix de vente',
                secondString: "$PrixDeVente_VeiwParfum DA"),
            widgetContainerInformation(
                fisrstString: 'Vendu',
                secondString:
                    "${PrixDeLunite_VeiwParfum * (QuantiteInitiale_VeiwParfum - QuantiteNow_VeiwParfum)} DA"),
          ],
        ),
      ),
    );
  }
}

//================================================================================

Widget widgetContainerInformation({
  required String fisrstString,
  required String secondString,
}) {
  return Container(
    width: 300,
    height: 55,
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: "$fisrstString",
          TextSize: 14,
          TextColor: Colors.black,
          TextWeight: FontWeight.w700,
        ),
        CustomText(
          text: "$secondString",
          TextSize: 14,
          TextColor: Colors.black,
          TextWeight: FontWeight.bold,
        ),
      ],
    ),
    decoration: BoxDecoration(
      color: Colors.white,

      border: Border.symmetric(
          horizontal: BorderSide(width: 0.5, color: colorGray)),

      // The BoxShadow
    ),
  );
}

//================================================================================

Widget widgetContainerInformation2({
  required String fisrstString,
  required String fisrstValue,
  required String secondString,
  required String secondValue,
}) {
  return Container(
    width: 300,
    height: 95,
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "$fisrstString",
              TextSize: 11,
              TextColor: Colors.black,
              TextWeight: FontWeight.w700,
            ),

            //vale

            CustomText(
              text: "$fisrstValue",
              TextSize: 14,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
          ],
        ),

        //

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: "$secondString",
              TextSize: 11,
              TextColor: Colors.black,
              TextWeight: FontWeight.w700,
            ),

            //value

            CustomText(
              text: "$secondValue",
              TextSize: 14,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
          ],
        ),
      ],
    ),
    decoration: BoxDecoration(
      color: Colors.white,

      border: Border.symmetric(
          horizontal: BorderSide(width: 0.5, color: colorGray)),

      // The BoxShadow
    ),
  );
}
