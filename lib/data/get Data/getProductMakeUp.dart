import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

List GetslistProductMakeUp = [];
bool ladingMakeUpScreen = false;

Future getProductMakeUp() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("productMakeUp");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      GetslistProductMakeUp.add({
        "itemId": element.id,
        "referenceCodeBar": element.get('referenceCodeBar'),
        "UrlImages": element.get('UrlImages'),
        "typeProduct": element.get('typeProduct'),
        "intituleMakeUp": element.get('intituleMakeUp'),
        "QuantiteInitiale": element.get('QuantiteActule'),
        "PrixDachat": element.get('PrixDachat'),
        "PrixDeVente": element.get('PrixDeVente'),
        "dataEntree": element.get('dataEntree'),
      });
    });
    ladingMakeUpScreen = true;
  });
  return GetslistProductMakeUp;
}
