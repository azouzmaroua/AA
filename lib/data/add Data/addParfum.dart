import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_parfum/data/add%20Data/uplodImages.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/functions/getTime.dart';

AddParfum(
    context,
    String collectionReference,
    String reference,
    String intituleParfum,
    String PrixDeLunite,
    String QuantiteInitiale,
    String PrixDachat,
    String PrixDeVente) async {
  // first / uplode image
  if (howgetimage == "Piker") {
    String urlImageUploding = await uplodImage(image, "urlsImagesParfum");
    urlImageChosing = urlImageUploding;
  }
  // second / get time
  var dataEntree = await getTime();

  num x = -1;
  int y = -1;

  // therrd
  CollectionReference refranceImages =
      FirebaseFirestore.instance.collection(collectionReference);
  refranceImages.add({
    "referenceCodeBar": reference,
    "UrlImages": urlImageChosing,
    "FullCondistion": "Full",
    "typeProduct": "Parfum",
    "intituleParfum": intituleParfum,
    "PrixDeLunite": num.tryParse(PrixDeLunite),
    "QuantiteInitiale": num.tryParse(QuantiteInitiale),
    "QuantiteNow": num.tryParse(QuantiteInitiale),
    "PrixDachat": num.tryParse(PrixDachat),
    "PrixDeVente": num.tryParse(PrixDeVente),
    "dataEntree": "$dataEntree",
  });
  howgetimage = "Dont Choes";
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed("Parfum veiw Screen");
}
