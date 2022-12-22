import 'package:cloud_firestore/cloud_firestore.dart';

List GetslistProductParfums = [];
String varibalChangeChoesCondistionParfum = "All";

Future getOrders() async {
  CollectionReference refranceImages =
      await FirebaseFirestore.instance.collection("Orders");
  await refranceImages.get().then((value) {
    value.docs.forEach((element) {
      GetslistProductParfums.add({
        "total-reveresnse-ordres-payes":
            element.get('total-reveresnse-ordres-payes'),
        "total-profti-ordres-payes": element.get('total-profti-ordres-payes'),
        "IdTimeEnter": element.get('IdTimeEnter'),
      });
    });
  });
  print(GetslistProductParfums);
  return GetslistProductParfums;
}
