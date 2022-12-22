import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_parfum/functions/CreatCodeOrder.dart';
import 'package:my_parfum/functions/getTime.dart';
import 'package:my_parfum/routes/order_Screen/newOrderScreen.dart';
import 'package:my_parfum/routes/order_Screen/screenChosingProduct.dart';
import 'package:my_parfum/routes/splashScreen.dart';

late num numberOrder;
DateTime dataEntreOrder = DateTime.now();

AddOrder(context) async {
  // 1 first / get time
  var dataEntreeGet = await getTime();
  dataEntreOrder = dataEntreeGet;
  String dataEntree = '$dataEntreeGet';
  dataEntree = dataEntree.substring(0, 10);

  //2 second / loop count
  //ينقص المكية من كل منتج

  listOrder.forEach((element) async {
    if (element["type_Prodct"] == "Parfum") {
      print("1=====================================");
      String refranceProduct = "productParfum";

      var refranceProductEdite =
          await FirebaseFirestore.instance.collection("$refranceProduct");
      refranceProductEdite
          .doc('${element["idProduct"]}')
          .update({"QuantiteNow": FieldValue.increment(-element["count_ml"])});

      //upadet condistion

      num QuantiteNow = 0;
      await refranceProductEdite
          .doc('${element["idProduct"]}')
          .get()
          .then((value) {
        QuantiteNow = value.get('QuantiteNow');
        if (QuantiteNow == 0) {
          refranceProductEdite.doc('${element["idProduct"]}').update({
            'FullCondistion': 'Finsh',
          });
        } else {
          refranceProductEdite.doc('${element["idProduct"]}').update({
            'FullCondistion': 'Half',
          });
        }
      });

      //
    } else if (element["type_Prodct"] == "MakeUp") {
      print("2=====================================");

      String refranceProduct = "productMakeUp";

      var refranceProductEdite =
          await FirebaseFirestore.instance.collection("$refranceProduct");
      refranceProductEdite.doc('${element["idProduct"]}').update(
          {"QuantiteActule": FieldValue.increment(-element["count_peieces"])});
    } else if (element["type_Prodct"] == "Autres") {
      print("3=====================================");

      String refranceProduct = "productAutres";

      var refranceProductEdite =
          FirebaseFirestore.instance.collection("$refranceProduct");
      await refranceProductEdite.doc('${element["idProduct"]}').update(
          {"QuantiteActule": FieldValue.increment(-element["count_peieces"])});
    }
  });

  //3 / get number order
  var refranceNumberOrder =
      FirebaseFirestore.instance.collection("users").doc('NumberOrder');
  await refranceNumberOrder.get().then((value) {
    numberOrder = value.get('NumberOrderNow');
  });

  //4 / update number order
  await refranceNumberOrder.update({'NumberOrderNow': FieldValue.increment(1)});

  //5 fifth / add map(order to list)

  var refranceOrder = FirebaseFirestore.instance.collection("Orders");
  await refranceOrder.doc('${dataEntree}').update({
    "All-orders-D'achats": FieldValue.increment(1),
    "orders": FieldValue.arrayUnion([
      {
        "$numberOrder": {
          "timeEnter": dataEntree,
          "timeEnterExsaktli": dataEntreeGet,
          "itemes_Product": listOrder,
          "name_Adder": "$nameUser",
          "payee_ordre": payee_ordre,
          "price_ordre": totalPrice,
          "total_profti": total_profti,
          "total_reveresnse": total_reveresnse,
        }
      }
    ])
  });

  //6 sixthe / add map(order to list)

  if (payee_ordre == true) {
    await refranceOrder.doc('${dataEntree}').update({
      "total-reveresnse-ordres-payes": FieldValue.increment(total_reveresnse),
      "total-profti-ordres-payes": FieldValue.increment(total_profti),
      "All-orders-payes": FieldValue.increment(1),
    });
  } else {
    await refranceOrder.doc('${dataEntree}').update({
      "total-reveresnse-ordres-Nopayes": FieldValue.increment(total_reveresnse),
      "total-profti-ordres-Nopayes": FieldValue.increment(total_profti),
      "All-orders-Nopayes": FieldValue.increment(1),
    });
  }

  //7 sEVEN / اضافة المبلغ الزائد الى خزنة المال
  var refranceCase = FirebaseFirestore.instance.collection("users");

  refranceCase.doc("la_case").update({
    "Moeny_On_la_case": FieldValue.increment(totalPrice),

    // "Historic_lacase": FieldValue.arrayUnion([
    //   {
    //     "timeEnterExsaktli": dataEntreeGet,
    //     "name_Adder": "$nameUser",
    //     "price": totalPrice,
    //     "type": "add",
    //   }
    // ])
  });

  // second /

  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed("Succes Order Screen");
}
