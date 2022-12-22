import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_parfum/routes/order_Screen/PartyParfum.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/routes/produit_screens/Parfum/parfumScreen.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/custom/custom_text_field.dart';
import 'package:my_parfum/widgets/space_widgets.dart';
import 'package:my_parfum/widgets/widgetVeiwProductParfum.dart';

import 'package:flutter/material.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:my_parfum/widgets/space_widgets.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

//#############################################

//###############################################

NotifecationMakeUpAutreTap(
  context, {
  required String itemId,
  required String type_Prodct,
  required String UrlImages,
  required String intituleParfum,
  required num QuantiteInitiale,
  required String dataEntree,
  required num PrixDeVente,
  required num PrixPrixDachat,
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
      height: 285,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //button Cloes
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Icon(Icons.close))
            ],
          ),
          //widget veiw
          widgetVeiwProductaMakeUpLite(
            UrlImages: UrlImages,
            intituleParfum: intituleParfum,
            QuantiteInitiale: QuantiteInitiale,
            dataEntree: dataEntree,
            PrixDeLunite: PrixPrixDachat,
          ),
          //button
          BarChoesQontity(QuantiteInitiale: QuantiteInitiale),
          SizedBox(
            height: 15,
          ),

          // Row Button
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
                  color: blueColor,
                  text: 'confirm',
                  onTap: () {
                    print(
                        "====================================================");
                    listOrder.add({
                      "count_peieces": count_peieces,
                      "idProduct": itemId,
                      "nameProduct": intituleParfum,
                      "type_Prodct": type_Prodct,
                      "price": count_peieces * QuantiteInitiale,
                      "price_profit": count_peieces * PrixDeVente,
                      "urlImage_Product": UrlImages,
                    });
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed("New Order Screen");

                    // listProductParfums.removeAt(indexItem);
                    // oLdlistProductParfums.removeAt(indexItem);
                    // ParfumScreenState().updateList();
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

//###########################################################
//Widget

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
          height: 100,
          width: 100,
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
              TextSize: 21,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),

            // Il reste
            CustomText(
              text: '${QuantiteInitiale} peieces',
              TextSize: 15,
              TextColor: colorGray,
              TextWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 2,
            ),

            // price X DA/1ml
            CustomText(
              text: '${PrixDeLunite} DA',
              TextSize: 15,
              TextColor: Colors.grey,
              TextWeight: FontWeight.w300,
            ),
            SizedBox(
              height: 2,
            ),
            // data Entree
            CustomText(
              text: dataEntree.substring(0, 10),
              TextSize: 15,
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

//***************************************************** */

class BarChoesQontity extends StatefulWidget {
  BarChoesQontity({Key? key, required num QuantiteInitiale}) : super(key: key);

  @override
  State<BarChoesQontity> createState() => BarChoesQontityState();
}

num QuantiteInitialeBarChoesQontity = 1;
num count_peieces = 1;

Color colorButtonIkwell = colorGray;
Color colorButtonAdd = blueColor;

class BarChoesQontityState extends State<BarChoesQontity> {
  @override
  void initState() {
    // TODO: implement initState
    functionActiveButoon();
    super.initState();
  }

  functionActiveButoon() {
    setState(() {
      if (count_peieces <= 1) {
        colorButtonIkwell = colorGray;
        colorButtonAdd = blueColor;
      } else if (count_peieces >= QuantiteInitialeBarChoesQontity) {
        colorButtonIkwell = blueColor;
        colorButtonAdd = colorGray;
      } else {
        colorButtonIkwell = blueColor;
        colorButtonAdd = blueColor;
      }
    });
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 55,
          height: 55,
          child: CustomGeneralButton(
            color: colorButtonIkwell,
            text: '-',
            onTap: () {
              if (count_peieces > 1) {
                setState(() {
                  count_peieces--;
                });
              }
              functionActiveButoon();
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Color.fromARGB(238, 204, 204, 204),
          width: 100,
          height: 55,
          child: Center(
            child: CustomText(
              text: "$count_peieces",
              TextSize: 21,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          width: 55,
          height: 55,
          child: CustomGeneralButton(
            color: colorButtonAdd,
            text: '+',
            onTap: () {
              if (count_peieces < QuantiteInitialeBarChoesQontity) {
                setState(() {
                  count_peieces++;
                });
              }
              functionActiveButoon();
            },
          ),
        ),
      ],
    );
  }
}


//#####################################################
