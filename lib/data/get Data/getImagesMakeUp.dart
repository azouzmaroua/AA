import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

List listUrlsImagesMakeUpGets = [];
bool ladingGetImagesMakeUpScreen = false;

Future getImagesMakeUp() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("urlsImagesMakeUp");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      var UrlImagesGet = element.get('UrlImages');

      listUrlsImagesMakeUpGets.add(UrlImagesGet);
    });
    ladingGetImagesMakeUpScreen = true;

    return listUrlsImagesMakeUpGets;
  });
}
