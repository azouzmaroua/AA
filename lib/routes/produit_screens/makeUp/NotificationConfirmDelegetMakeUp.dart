import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/parfumScreen.dart';
import 'package:my_parfum/routes/splashScreen.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';

import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';

//#############################################

//###############################################

NotificationConfirmDelegetMakeUp(
  context, {
  required String itemId,
  required String UrlImages,
  required String intituleParfum,
  required num QuantiteInitiale,
  required String dataEntree,
  required num PrixDeLunite,
  required int indexItem,
}) {
  return AwesomeDialog(
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    headerAnimationLoop: false,
    //   useRootNavigator: false,
    context: context,

    body: Container(
      padding: EdgeInsets.only(bottom: 20),
      height: 257,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'supprimer',
            TextSize: 22,
            TextColor: Colors.black,
            TextWeight: FontWeight.w800,
          ),
          CustomText(
            text: 'Voulez-vous vraiment',
            TextSize: 15,
            TextColor: colorGray,
            TextWeight: FontWeight.w500,
          ),
          CustomText(
            text: 'supprimer cet item?',
            TextSize: 15,
            TextColor: colorGray,
            TextWeight: FontWeight.w500,
          ),
          widgetVeiwProductaMakeUpLite(
            UrlImages: UrlImages,
            intituleParfum: intituleParfum,
            QuantiteInitiale: QuantiteInitiale,
            dataEntree: dataEntree,
            PrixDeLunite: PrixDeLunite,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 95,
                height: 35,
                child: CustomGeneralButton(
                  color: Color.fromARGB(238, 204, 204, 204),
                  text: 'cancel',
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                width: 95,
                height: 35,
                child: CustomGeneralButton(
                  color: Color.fromARGB(183, 229, 22, 22),
                  text: 'confirmer',
                  onTap: () {
                    print(
                        "====================================================");
                    if (nameUser == "mohib") {
                      print(itemId);
                      CollectionReference refranceParfum = FirebaseFirestore
                          .instance
                          .collection("productMakeUp");
                      refranceParfum.doc(itemId).delete();
                      Navigator.of(context).pop();

                      Navigator.of(context)
                          .pushReplacementNamed('MakeUp veiw Screen');
                      // listProductParfums.removeAt(indexItem);
                      // oLdlistProductParfums.removeAt(indexItem);
                      // ParfumScreenState().updateList();
                    }
                  },
                ),
              ),
            ],
          )
        ],
      ),
    ),
    dialogType: DialogType.noHeader,
    animType: AnimType.rightSlide,
  )..show();
}

//Widget

Widget widgetVeiwProductaMakeUpLite({
  required String UrlImages,
  required String intituleParfum,
  required num QuantiteInitiale,
  required String dataEntree,
  required num PrixDeLunite,

  // "FullCondistion": "Full",
}) {
  return Container(
    child: Row(
      children: [
        //image parfum
        Image.network(
          UrlImages,
          height: 70,
          width: 70,
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
              text: '${QuantiteInitiale} peieces',
              TextSize: 14,
              TextColor: colorGray,
              TextWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 2,
            ),

            // price X DA/1ml
            CustomText(
              text: '${PrixDeLunite} DA',
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
    margin: EdgeInsets.only(bottom: 5),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,

      // The BoxShadow
    ),
  );
}
