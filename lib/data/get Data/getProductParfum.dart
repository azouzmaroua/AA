import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

List GetslistProductParfums = [];
bool ladingParfumScreen = false;
String varibalChangeChoesCondistionParfum = "All";

Future getProductParfum() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("productParfum");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      GetslistProductParfums.add({
        "itemId": element.id,
        "referenceCodeBar": element.get('referenceCodeBar'),
        "UrlImages": element.get('UrlImages'),
        "FullCondistion": element.get('FullCondistion'),
        "typeProduct": element.get('typeProduct'),
        "intituleParfum": element.get('intituleParfum'),
        "PrixDeLunite": element.get('PrixDeLunite'),
        "QuantiteInitiale": element.get('QuantiteInitiale'),
        "QuantiteNow": element.get('QuantiteNow'),
        "PrixDachat": element.get('PrixDachat'),
        "PrixDeVente": element.get('PrixDeVente'),
        "dataEntree": element.get('dataEntree'),
      });
    });
    ladingParfumScreen = true;
  });
  return GetslistProductParfums;
}
