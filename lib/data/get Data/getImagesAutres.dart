import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:my_parfum/routes/splashScreen.dart';

List listUrlsImagesAutresGets = [];
bool ladingGetImagesAutresScreen = false;

Future getImagesAutres() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("urlsImagesAutres");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      var UrlImagesGet = element.get('UrlImages');

      listUrlsImagesAutresGets.add(UrlImagesGet);
    });
    ladingGetImagesAutresScreen = true;

    return listUrlsImagesAutresGets;
  });
}
