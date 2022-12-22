import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_parfum/Core/SizeConfig.dart';
import 'package:my_parfum/data/add%20Data/addAutres.dart';
import 'package:my_parfum/data/add%20Data/addParfum.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/functions/scanBarCode.dart';
import 'package:my_parfum/soundUi.dart';
import 'package:my_parfum/theme.dart';
import 'package:my_parfum/widgets/bottomSheet/choesImageBottomSheet.dart';
import 'package:my_parfum/widgets/custom/CustomButton.dart';
import 'package:my_parfum/widgets/custom/text_field__item.dart';
import 'package:my_parfum/widgets/notification/NotificationLading.dart';
import 'package:my_parfum/widgets/space_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_parfum/functions/cropImage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';

class AddAutresScreen extends StatefulWidget {
  AddAutresScreen({Key? key}) : super(key: key);

  @override
  State<AddAutresScreen> createState() => _AddAutresScreenState();
}

class _AddAutresScreenState extends State<AddAutresScreen> {
  final TextEditingController _controllerNameAutres = TextEditingController();
  final TextEditingController _controllerReference = TextEditingController();
  final TextEditingController _controllerQuantiteInitiale =
      TextEditingController();
  final TextEditingController _controllerPrixDachat = TextEditingController();
  final TextEditingController _controllerPrixDeVente = TextEditingController();

  @override
  Future choesImage(context, ImageSource sourceType) async {
    var pikedImage = await imagePiker.pickImage(source: sourceType);
    if (pikedImage != null) {
      image = File(pikedImage.path);
      nameImage = Path.basename(pikedImage.path);
      valditoreImage = false;
      var cropImage = await CropImage(context, pikedImage);

      if (cropImage != null) {
        setState(() {
          image = File(cropImage?.path);
        });

        return File(cropImage?.path);
      } else {
        return null;
      }
    }
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        tapButton1();
        Navigator.of(context).pushReplacementNamed('Autres veiw Screen');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    tapButton1();
                    Navigator.of(context)
                        .pushReplacementNamed('Autres veiw Screen');
                  },
                  icon: Icon(Icons.arrow_back)),
              Text("Ajouter un autre produit"),
              Text("     ")
            ],
          ),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
            fontSize: 20,
            color: Color(0xff000000),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 248, 246, 246),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(children: [
            //coesImage
            Consumer<ChoesImageProvide>(builder: ((context, model, child) {
              return InkWell(
                  onTap: () {
                    tapButton1();
                    // model.changeImage();
                    showBottomChoesImage(
                        context, "Gallery Images Autres Screen");
                  },
                  child: howgetimage == "Dont Choes"
                      ? SizedBox(
                          height: 200,
                          width: 200,
                          child: Icon(
                            Icons.add_photo_alternate,
                            size: 155,
                            color: Color.fromARGB(255, 221, 221, 221),
                          ),
                        )
                      : howgetimage == "Piker"
                          ? SizedBox(
                              child: Image.file(image!),
                              height: 200,
                              width: 200,
                            )
                          : SizedBox(
                              child: Image.network('$urlImageChosing'),
                              height: 200,
                              width: 200,
                            ));
            })),

            const VerticalSpace(4),
            //name Autres…
            CompleteInfoItem(
              text: ' Entrez l’intitulé du Autres….',
              inputType: TextInputType.name,
              controller: _controllerNameAutres,
            ),
            const VerticalSpace(4),
            //Référence (code à barre)
            CompleteInfoItem(
                text: 'Référence (code à barre)… .',
                inputType: TextInputType.number,
                controller: _controllerReference,
                suffexIcon: InkWell(
                  onTap: () async {
                    _controllerReference.text = await scanBarCode();
                  },
                  child: Icon(
                    Icons.qr_code_scanner_rounded,
                    size: 25,
                    color: Colors.black,
                  ),
                )),
            const VerticalSpace(4),

            // Quantité initiale (en pieces)
            CompleteInfoItem(
              text: ' Quantité initiale (en pieces)',
              inputType: TextInputType.number,
              controller: _controllerQuantiteInitiale,
            ),

            const VerticalSpace(4),
            //Prix d’achat
            CompleteInfoItem(
              text: ' Prix d’achat (en DA)…',
              inputType: TextInputType.number,
              controller: _controllerPrixDachat,
            ),
            const VerticalSpace(4),
            //Prix de vente
            CompleteInfoItem(
              text: ' Prix de vente (en DA)…',
              inputType: TextInputType.number,
              controller: _controllerPrixDeVente,
            ),
            const VerticalSpace(4),
            GeneralButton(
              text: "Enregistrer",
              onTap: () {
                //  addToFireBase.AddAutresScreen(_controller.text, double.parse(_controller2.text),double.parse( _controller3.text), int.parse( _controller4.text), double.parse(_controller5.text),double.parse( _controller6.text));
                messageLading(context);
                AddAutres(
                  context,
                  "productAutres",
                  _controllerReference.text,
                  _controllerNameAutres.text,
                  _controllerQuantiteInitiale.text,
                  _controllerPrixDachat.text,
                  _controllerPrixDeVente.text,
                );
              },
              hight: 8,
              width: 38,
              color: greenColor,
              textAlign: TextAlign.center,
              iconData: Icons.save,
              colorIcon: Colors.black,
            ),
          ]),
        ),
      ),
    );
  }
}
