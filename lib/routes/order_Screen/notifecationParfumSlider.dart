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
double _value = 40.0;

NotifecationParfumSlider(
  context, {
  required String itemId,
  required String UrlImages,
  required String intituleParfum,
  required num QuantiteInitiale,
  required num QuantiteNow,
  required String dataEntree,
  required String FullCondistion,
  required num PrixDeLunite,
  required num PrixDeVente,
  required int indexItem,
  required TextEditingController controllerTextMoaeny,
  required TextEditingController controllerTextMlCount,
}) {
  return AwesomeDialog(
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    headerAnimationLoop: false,
    //   useRootNavigator: false,
    context: context,

    body: Container(
      padding: EdgeInsets.only(bottom: 20),
      height: 410,
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
          widgetVeiwProductParfumLite(
            UrlImages: UrlImages,
            intituleParfum: intituleParfum,
            QuantiteInitiale: QuantiteInitiale,
            QuantiteNow: QuantiteNow,
            dataEntree: dataEntree,
            FullCondistion: FullCondistion,
            PrixDeLunite: PrixDeLunite,
          ),

          // Text form Feiled
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(2),
                  width: 130,
                  color: Color.fromARGB(255, 187, 187, 187),
                  child: TextFormFeiledX(
                    controller: controllerTextMlCount,
                    onChanged: (value) {
                      print("############################");

                      print(value);

                      if (value == "") {
                        num? x = 0;
                        num y = x * 50;
                        controllerTextMoaeny.text = "$y";
                      } else {
                        num? x = num.parse("$value");
                        num y = x * PrixDeLunite;
                        controllerTextMoaeny.text = "$y";
                      }
                    },
                  )),
              CustomText(
                text: "ml",
                TextSize: 21,
                TextColor: Colors.black,
                TextWeight: FontWeight.bold,
              ),
            ],
          ),

          ///Text iqule
          CustomText(
            text: "=",
            TextSize: 25,
            TextColor: Colors.black,
            TextWeight: FontWeight.bold,
          ),

          // Text form Feiled
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(2),
                  width: 130,
                  color: Color.fromARGB(255, 187, 187, 187),
                  child: TextFormFeiledX(
                    controller: controllerTextMoaeny,
                  )),
              CustomText(
                text: "DA",
                TextSize: 21,
                TextColor: Colors.black,
                TextWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(
            height: 10,
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
                    if (QuantiteNow >= num.parse(controllerTextMlCount.text)) {
                      listOrder.add({
                        "count_ml": num.parse(controllerTextMlCount.text),
                        "idProduct": itemId,
                        "nameProduct": intituleParfum,
                        "type_Prodct": "Parfum",
                        "price": num.parse(controllerTextMoaeny.text),
                        //سعر الفايدة في الكمية المختارة تقسيم الكمية الابتدائية
                        "price_profit": (num.parse(controllerTextMlCount.text) *
                                (PrixDeLunite - PrixDeVente)) /
                            QuantiteInitiale,
                        "urlImage_Product": UrlImages,
                      });
                    } else {
                      listOrder.add({
                        "count_ml": QuantiteNow,
                        "idProduct": itemId,
                        "nameProduct": intituleParfum,
                        "type_Prodct": "Parfum",
                        "price": num.parse(controllerTextMoaeny.text),
                        //سعر الفايدة في الكمية المختارة تقسيم الكمية الابتدائية
                        "price_profit":
                            (QuantiteNow * (PrixDeLunite - PrixDeVente)) /
                                QuantiteInitiale,
                        "urlImage_Product": UrlImages,
                      });
                    }

                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed("New Order Screen");
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

Widget widgetVeiwProductParfumLite({
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
          height: 50,
          width: 50,
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
              TextSize: 12,
              TextColor: Colors.black,
              TextWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 2,
            ),

            // Il reste
            CustomText(
              text: '${QuantiteNow} ml / ${QuantiteInitiale} ml',
              TextSize: 12,
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
              TextSize: 12,
              TextColor: Colors.grey,
              TextWeight: FontWeight.w300,
            ),
            SizedBox(
              height: 2,
            ),
            // data Entree
            CustomText(
              text: dataEntree.substring(0, 10),
              TextSize: 12,
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

class SliderPurfam extends StatefulWidget {
  SliderPurfam({Key? key}) : super(key: key);

  @override
  State<SliderPurfam> createState() => _SliderPurfamState();
}

class _SliderPurfamState extends State<SliderPurfam> {
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      min: 0.0,
      max: 100.0,
      value: _value,
      interval: 10,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

//#####################################################

Widget TextFormFeiled({
  required TextEditingController controller,
  required Function onChanged(value),
  required Function onSaved(value),
  // "FullCondistion": "Full",
}) {
  return TextFormField(
    onChanged: onChanged,
    onSaved: onSaved,
    textAlign: TextAlign.center,
    decoration: InputDecoration(
      suffixIcon: CustomText(
        text: "DA",
        TextSize: 21,
        TextColor: Colors.black,
        TextWeight: FontWeight.bold,
      ),
      filled: true,
      fillColor: Color.fromARGB(0, 208, 208, 208),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
          )),
    ),
  );
}

class TextFormFeiledX extends StatelessWidget {
  final String? hintText;

  final ValueSetter? onSaved;
  final ValueSetter? onChanged;

  final int? maxLines;
  final TextEditingController? controller;

  const TextFormFeiledX({
    Key? key,
    @required this.hintText,
    @required this.onSaved,
    this.onChanged,
    this.maxLines,
    this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      onSaved: onSaved,
      maxLines: maxLines,
      controller: controller,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        filled: true,
        labelStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        fillColor: Color.fromARGB(0, 208, 208, 208),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFFCCCCCC),
            )),
      ),
    );
  }
}
