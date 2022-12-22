import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

List GetslistProductAutres = [];
bool ladingAutresScreen = false;

Future getProductAutres() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("productAutres");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      GetslistProductAutres.add({
        "itemId": element.id,
        "referenceCodeBar": element.get('referenceCodeBar'),
        "UrlImages": element.get('UrlImages'),
        "typeProduct": element.get('typeProduct'),
        "intituleAutres": element.get('intituleAutres'),
        "QuantiteInitiale": element.get('QuantiteActule'),
        "PrixDachat": element.get('PrixDachat'),
        "PrixDeVente": element.get('PrixDeVente'),
        "dataEntree": element.get('dataEntree'),
      });
    });
    ladingAutresScreen = true;
  });
  return GetslistProductAutres;
}
