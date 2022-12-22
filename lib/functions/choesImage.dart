import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_parfum/functions/cropImage.dart';
import 'package:my_parfum/functions/setStateFunction.dart';
import 'package:my_parfum/test.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_cropper/image_cropper.dart';

//function get image

File? image;
final imagePiker = ImagePicker();
String howgetimage = "Dont Choes";
String urlImageChosing = "";

//  howgetimage = "Piker";
//  howgetimage = "Network";

var nameImage;
late var titel, note, imageUrl;
bool valditoreImage = false;

class ChoesImageProvide extends ChangeNotifier {
  Future choesImage(context, ImageSource sourceType) async {
    var pikedImage =
        await imagePiker.pickImage(source: sourceType, imageQuality: 1);

    if (pikedImage != null) {
      image = File(pikedImage.path);
      nameImage = Path.basename(pikedImage.path);
      valditoreImage = false;
      print(
          "====================================================================");

      print(
          "pikedImage==================================${pikedImage.length()}");
      var cropImage = await CropImage(context, pikedImage);

      if (cropImage != null) {
        howgetimage = "Piker";
        image = File(cropImage?.path);

        notifyListeners();
        return File(cropImage?.path);
      } else {
        return null;
      }
    }
  }

  returnBuiled() {
    notifyListeners();
  }
}
