import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_parfum/data/add%20Data/uplodImages.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/functions/getTime.dart';

AddAutres(
    context,
    String collectionReference,
    String reference,
    String intituleAutres,
    String QuantiteActule,
    String PrixDachat,
    String PrixDeVente) async {
  // first / uplode image
  if (howgetimage == "Piker") {
    String urlImageUploding = await uplodImage(image, "urlsImagesAutres");
    urlImageChosing = urlImageUploding;
  }
  // second / get time
  var dataEntree = await getTime();

  // therrd
  CollectionReference refranceImages =
      FirebaseFirestore.instance.collection(collectionReference);
  refranceImages.add({
    "referenceCodeBar": reference,
    "UrlImages": urlImageChosing,
    "typeProduct": "Autres",
    "intituleAutres": intituleAutres,
    "QuantiteActule": num.tryParse(QuantiteActule),
    "PrixDachat": num.tryParse(PrixDachat),
    "PrixDeVente": num.tryParse(PrixDeVente),
    "dataEntree": "$dataEntree",
  });
  howgetimage = "Dont Choes";
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed("Autres veiw Screen");
}
