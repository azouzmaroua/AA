import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';

class ScreenVeiwItemMakeUp extends StatefulWidget {
  ScreenVeiwItemMakeUp({Key? key}) : super(key: key);

  @override
  State<ScreenVeiwItemMakeUp> createState() => _ScreenVeiwItemMakeUpState();
}

String itemId_VeiwMakeUp = "dgzu783GUJG363";
String UrlImages_VeiwMakeUp =
    "https://firebasestorage.googleapis.com/v0/b/myparfum-ac6ab.appspot.com/o/parfum%2Fimage_picker4219511951322543161.jpg83561109?alt=media&token=d29f47be-7cf6-43d1-a9f3-ed52820a710d";
String intituleMakeUp_VeiwMakeUp = "Sauvage";
num QuantiteInitiale_VeiwMakeUp = 1;
String FullCondistion_VeiwMakeUp = "Half";
String dataEntree_VeiwMakeUp = '23/02/2022';
String reference_VeiwMakeUp = "250";
num PrixDachat_VeiwMakeUp = 16000;
num PrixDeVente_VeiwMakeUp = 16000;

class _ScreenVeiwItemMakeUpState extends State<ScreenVeiwItemMakeUp> {
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
                    UrlImages_VeiwMakeUp,
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: "$intituleMakeUp_VeiwMakeUp",
                    TextSize: 21,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: 'Il reste ${QuantiteInitiale_VeiwMakeUp} peieces',
                    TextSize: 17,
                    TextColor: colorGray,
                    TextWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            widgetContainerInformation(
                fisrstString: 'Prix d’achat',
                secondString: "$PrixDachat_VeiwMakeUp DA"),
            widgetContainerInformation(
                fisrstString: 'Prix de l’unité',
                secondString: "$PrixDeVente_VeiwMakeUp DA"),
            widgetContainerInformation(
                fisrstString: 'Référence',
                secondString: "$reference_VeiwMakeUp"),
            widgetContainerInformation(
                fisrstString: 'QuantiteInitiale',
                secondString: "$QuantiteInitiale_VeiwMakeUp "),
            widgetContainerInformation(
                fisrstString: 'Date d’entrée',
                secondString: dataEntree_VeiwMakeUp.substring(0, 10)),
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
