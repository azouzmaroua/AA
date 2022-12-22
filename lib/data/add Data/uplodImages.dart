import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:my_parfum/functions/choesImage.dart';

// String urlImageUploding = '';

uplodImage(var image, String collectionReference) async {
  //get name image and creat new name image
  var random = Random().nextInt(100000000);
  var nameImageEdite = "$nameImage$random";

  //first party (uplod image)
  print("+=====================1");

  var refranceStorge =
      await FirebaseStorage.instance.ref("parfum/$nameImageEdite");
  print("+=====================2");
  //compers image
  var _compressedFile;

  _compressedFile = await FlutterImageCompress.compressAndGetFile(
    image!.absolute.path,
    image!.path + 'compressed.jpg',
    quality: 1,
  );

  //uplode image

  await refranceStorge.putFile(_compressedFile!);
  print("+=====================3");

  var urlPhoto = await refranceStorge.getDownloadURL();

  print("+=====================4");
  CollectionReference refranceImages =
      FirebaseFirestore.instance.collection("$collectionReference");
  refranceImages.add({"UrlImages": "$urlPhoto"});

  print("======================================");
  print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

  print("$urlPhoto");
  // urlImageUploding = "$urlPhoto";

  print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");

  print("======================================");
  return urlPhoto;
}
