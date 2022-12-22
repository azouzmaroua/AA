import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class ScreenVeiwItemAutres extends StatefulWidget {
  ScreenVeiwItemAutres({Key? key}) : super(key: key);

  @override
  State<ScreenVeiwItemAutres> createState() => _ScreenVeiwItemAutresState();
}

String itemId_VeiwAutres = "dgzu783GUJG363";
String UrlImages_VeiwAutres =
    "https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/parfum%2Fimage_picker4219511951322543161.jpg83561109?alt=media&token=d29f47be-7cf6-43d1-a9f3-ed52820a710d";
String intituleAutres_VeiwAutres = "Savge";
num QuantiteInitiale_VeiwAutres = 1;
String FullCondistion_VeiwAutres = "Half";
String dataEntree_VeiwAutres = '23/02/2022';
String reference_VeiwAutres = "250";
num PrixDachat_VeiwAutres = 16000;
num PrixDeVente_VeiwAutres = 16000;

class _ScreenVeiwItemAutresState extends State<ScreenVeiwItemAutres> {
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
                    UrlImages_VeiwAutres,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "$intituleAutres_VeiwAutres",
                    TextSize: 21,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'Il reste ${QuantiteInitiale_VeiwAutres} peieces',
                    TextSize: 17,
                    TextColor: colorGray,
                    TextWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            widgetContainerInformation(
                fisrstString: 'Prix d’achat',
                secondString: "$PrixDachat_VeiwAutres DA"),
            widgetContainerInformation(
                fisrstString: 'Prix de l’unité',
                secondString: "$PrixDeVente_VeiwAutres DA"),
            widgetContainerInformation(
                fisrstString: 'Référence',
                secondString: "$reference_VeiwAutres"),
            widgetContainerInformation(
                fisrstString: 'QuantiteInitiale',
                secondString: "$QuantiteInitiale_VeiwAutres "),
            widgetContainerInformation(
                fisrstString: 'Date d’entrée',
                secondString: dataEntree_VeiwAutres.substring(0, 10)),
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
