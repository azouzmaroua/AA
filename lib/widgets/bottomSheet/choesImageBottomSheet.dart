import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_parfum/functions/choesImage.dart';
import 'package:my_parfum/test.dart';
import 'package:my_parfum/widgets/custom/customText.dart';
import 'package:provider/provider.dart';

showBottomChoesImage(context, String screenAsset) {
  return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 230,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                width: 100,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // titetl bootom sheet
                  CustomText(
                    text: 'choisir une image',
                    TextSize: 23,
                    TextColor: Colors.black,
                    TextWeight: FontWeight.bold,
                  ),
                  // 1 image asset
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(screenAsset);
                      },
                      child: Row(children: [
                        Icon(
                          Icons.perm_media_rounded,
                          size: 25,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomText(
                            text: 'asset',
                            TextSize: 20,
                            TextColor: Colors.black,
                            TextWeight: FontWeight.w500),
                      ]),
                    ),
                  ),
                  // 2 From gallery

                  Consumer<ChoesImageProvide>(
                      builder: ((context, model, child) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pop();

                          model.choesImage(context, ImageSource.gallery);
                        },
                        child: Row(children: [
                          Icon(
                            Icons.image,
                            size: 25,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                              text: 'Gallery',
                              TextSize: 20,
                              TextColor: Colors.black,
                              TextWeight: FontWeight.w500),
                        ]),
                      ),
                    );
                  })),
                  // 3 camera
                  Consumer<ChoesImageProvide>(
                      builder: ((context, model, child) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: InkWell(
                        onTap: () {
                          // Navigator.of(context).pop();
                          model.choesImage(context, ImageSource.camera);
                        },
                        child: Row(children: [
                          Icon(
                            Icons.camera_alt,
                            size: 25,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          CustomText(
                              text: 'caméra',
                              TextSize: 20,
                              TextColor: Colors.black,
                              TextWeight: FontWeight.w500),
                        ]),
                      ),
                    );
                  })),
                ],
              ),
            ],
          ),
        );
      });
}
