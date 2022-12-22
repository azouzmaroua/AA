import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

List listUrlsImagesParfumGets = [];
bool ladingGetImagesParfumScreen = false;

Future getImagesParfum() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("urlsImagesParfum");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      var UrlImagesGet = element.get('UrlImages');

      listUrlsImagesParfumGets.add(UrlImagesGet);
    });
    ladingGetImagesParfumScreen = true;

    return listUrlsImagesParfumGets;
  });
}
